from django.shortcuts import render, HttpResponse, Http404
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from typing import Dict, AnyStr

from itertools import chain
from random import sample

from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import linear_kernel, cosine_similarity
import numpy as np
import cv2
from django.core.files.uploadedfile import InMemoryUploadedFile
from django.conf import settings
import os

from hashlib import sha3_256
from base64 import b64encode
import pyimgur
from pyimgur.__init__ import Image, Album

from food_recommender.models import *
# Create your views here.


@csrf_exempt
def register(request):
    if request.method == 'POST':
        # print(request.body.decode('utf-8'))
        # data: Dict = json.loads(request.body.decode('utf-8'))
        data = request.POST.copy()

        username: AnyStr = data['username']
        email: AnyStr = data['email']
        role: bool = bool(int(data['role']))
        # hashed_password: AnyStr = data['password']
        hashed_password: AnyStr = sha3_256(data['password'].encode('utf-8')).digest()
        description: AnyStr = data['description']

        """DBG"""
        # print('username:', username)
        # print('email:', email)
        # print('role:', role)
        # print('hashed_password:', hashed_password)
        # print('description:', description)
        """DBG"""

        User.objects.create(username=username,
                            email=email,
                            role=role,
                            hashedPassword=hashed_password,
                            description=description)

        return HttpResponse('Successfully Added')


@csrf_exempt
def authenticate(request):
    if request.method == 'POST':
        data = request.POST.copy()

        username = data['username']
        password = sha3_256(data['password'].encode('utf-8')).digest()

        if len(User.objects.filter(username=username).filter(hashedPassword=password)) == 1:
            return HttpResponse('True')
        else:
            return HttpResponse('False')


@csrf_exempt
def list_users(request):
    if request.method == 'POST':
        users = User.objects.all()

        user_names = []
        for user in users:
            user_names.append(user.username)

        return JsonResponse({'response': user_names})


@csrf_exempt
def follow(request):
    if request.method == 'POST':
        # data: Dict = json.loads(request.body.decode('utf-8'))
        data = request.POST.copy()
        follower_username: AnyStr = data['follower_username']
        followed_username: AnyStr = data['followed_username']

        follower_user: User = User.objects.filter(username=follower_username)[0]
        followed_user = User.objects.filter(username=followed_username)[0]

        # Create Following Relationship
        # followed_user.followers.add(follower_user)
        follower_user.follow.add(followed_user)

        return HttpResponse('You are now following ' + followed_username)


@csrf_exempt
def unfollow(request):
    if request.method == 'POST':
        data = request.POST.copy()
        follower_username: AnyStr = data['follower_username']
        followed_username: AnyStr = data['followed_username']

        follower_user: User = User.objects.filter(username=follower_username)[0]
        followed_user = User.objects.filter(username=followed_username)[0]

        follower_user.follow.remove(followed_user)

        return HttpResponse('Unfollowed ' + followed_username)


@csrf_exempt
def list_dishes_news_feed(request):
    if request.method == 'POST':
        username = request.POST['username']

        # Get 5 random dishes from database
        random_dishes = Dish.objects.order_by('?')[:5]

        # Get all uploaded dishes from followed users
        followed_users = User.objects.filter(username=username)[0].follow.all()
        followed_users_uploaded_dishes = list()
        followed_users_uploaded_dishes.append(random_dishes)

        for followed_user in followed_users:
            followed_users_uploaded_dishes.append(followed_user.liked_dishes.filter(dishinterest__score__exact=6))
        followed_users_uploaded_dishes_set = list(chain(*followed_users_uploaded_dishes))

        # Get 5 random dishes from mixed database and followed users
        random_dishes = sample(followed_users_uploaded_dishes_set, 5)

        dish_list = list()
        for dish in random_dishes:
            dish_information = dict()
            dish_information['dish_name'] = dish.name
            dish_information['preparation'] = dish.preparation
            dish_information['uploader'] = dish.uploader
            dish_information['image_path'] = dish.imagePath

            # ingredients = []
            # for ingredient in dish.ingredients.all():
            #     ingredient_information = dict()
            #     ingredient_information['ingredient_name'] = ingredient.name
            #     ingredient_information['ingredient_price'] = str(ingredient.unitaryPrice)
            #     ingredients.append(ingredient_information)
            #
            # dish_information['ingredients'] = ingredients
            dish_information['ingredients'] = dish.plain_text_ingredients

            dish_list.append(dish_information)

        return JsonResponse({'dish_list': dish_list})


@csrf_exempt
def list_dishes_users(request):
    if request.method == 'GET':
        users = User.objects.all()

        users_uploaded_dishes = list()
        for user in users:
            uploaded_dishes = user.liked_dishes.filter(dishinterest__score__exact=6)
            users_uploaded_dishes.append(uploaded_dishes)

        users_uploaded_dishes = list(chain(*users_uploaded_dishes))[:10]

        dish_list = list()
        for dish in users_uploaded_dishes:
            dish_information = dict()
            dish_information['dish_name'] = dish.name
            dish_information['preparation'] = dish.preparation
            dish_information['uploader'] = dish.uploader
            dish_information['image_path'] = dish.imagePath

            # ingredients = []
            # for ingredient in dish.ingredients.all():
            #     ingredient_information = dict()
            #     ingredient_information['ingredient_name'] = ingredient.name
            #     ingredient_information['ingredient_price'] = str(ingredient.unitaryPrice)
            #     ingredients.append(ingredient_information)
            #
            # dish_information['ingredients'] = ingredients
            dish_information['ingredients'] = dish.plain_text_ingredients

            dish_list.append(dish_information)

        return JsonResponse({'dish_list': dish_list})


@csrf_exempt
def show_user_information(request):
    if request.method == 'POST':
        my_username = request.POST['my_username']
        username = request.POST['username']
        response = {}
        user = User.objects.filter(username=username)[0]

        response['username'] = user.username
        response['description'] = user.description

        # check if following
        my_user: User = User.objects.filter(username=my_username)[0]
        following_names = [following_user.username for following_user in my_user.follow.all()]
        response['following'] = True if username in following_names else False

        user_dishes = list()
        for dish in user.liked_dishes.filter(dishinterest__score__exact=6):
            dish_information = dict()
            dish_information['dish_name'] = dish.name
            dish_information['preparation'] = dish.preparation
            dish_information['uploader'] = dish.uploader
            dish_information['image_path'] = dish.imagePath

            # ingredients = []
            # for ingredient in dish.ingredients.all():
            #     ingredient_information = dict()
            #     ingredient_information['ingredient_name'] = ingredient.name
            #     ingredient_information['ingredient_price'] = str(ingredient.unitaryPrice)
            #     ingredients.append(ingredient_information)
            #
            # dish_information['ingredients'] = ingredients
            dish_information['ingredients'] = dish.plain_text_ingredients

            user_dishes.append(dish_information)

        response['dishes'] = user_dishes

        return JsonResponse(response)


@csrf_exempt
def like_dish(request):
    if request.method == 'POST':
        dish_name = request.POST['dish_name']
        username = request.POST['username']
        score = int(request.POST['score'])

        user = User.objects.filter(username=username)[0]
        dish = Dish.objects.filter(name__contains=dish_name)
        if len(dish) == 1:
            dish = dish[0]
            user.liked_dishes.add(dish, through_defaults={'score': score})

            return HttpResponse('Successfully liked')
        else:
            return Http404()


@csrf_exempt
def dislike_dish(request):
    if request.method == 'POST':
        dish_name = request.POST['dish_name']
        username = request.POST['username']

        user = User.objects.filter(username=username)[0]
        dish = Dish.objects.filter(name__contains=dish_name)
        if len(dish) == 1:
            dish = dish[0]
            # user.liked_dishes.add(dish, through_defaults={'score': score})
            user.liked_dishes.remove(dish)

            return HttpResponse('Successfully disliked')
        else:
            return Http404()


@csrf_exempt
def list_dishes_i_like(request):
    if request.method == 'POST':
        username = request.POST['username']

        user = User.objects.filter(username=username)[0]

        response = dict()

        user_dishes = list()
        for dish in user.liked_dishes.filter(dishinterest__score__lte=5):
            dish_information = dict()
            dish_information['dish_name'] = dish.name
            dish_information['preparation'] = dish.preparation
            dish_information['uploader'] = dish.uploader
            dish_information['image_path'] = dish.imagePath

            # ingredients = []
            # for ingredient in dish.ingredients.all():
            #     ingredient_information = dict()
            #     ingredient_information['ingredient_name'] = ingredient.name
            #     ingredient_information['ingredient_price'] = str(ingredient.unitaryPrice)
            #     ingredients.append(ingredient_information)
            #
            # dish_information['ingredients'] = ingredients
            dish_information['ingredients'] = dish.plain_text_ingredients

            user_dishes.append(dish_information)

        response['dishes'] = user_dishes

        return JsonResponse(response)


@csrf_exempt
def get_dish_information(request):
    if request.method == 'POST':
        query_name = request.POST['query_name']

        # Prepare index dictionary {dish_name: index}
        dish_name_indexes = dict()
        dishes = Dish.objects.all()
        for i, dish in enumerate(dishes):
            dish_name_indexes[dish.name] = i

        # Extract all dishes information
        names, dishes_ingredients, preparations, uploaders, image_paths = list(), list(), list(), list(), list()
        total_prices = [0.0] * len(dishes)
        for i, dish in enumerate(dishes):
            names.append(dish.name)
            preparations.append(dish.preparation)
            image_paths.append(dish.imagePath)
            uploaders.append(dish.uploader)
            # ingredients = list()
            # for ingredient in dish.dishingredients_set.all():
            #     ingredients.append({'name': ingredient.ingredient.name,
            #                         'quantity': ingredient.quantity,
            #                         'unit': ingredient.unit})
            #     total_prices[i] += (ingredient.quantity * ingredient.ingredient.unitaryPrice)
            # dishes_ingredients.append(ingredients)  # All Ingredients for Dish
            # total_prices[i] = total_prices[i] * 0.7  # 70% of estimated price
            dishes_ingredients.append(dish.plain_text_ingredients)
            total_prices[i] = dish.estimated_price

        # Prepare Data
        tfidf = TfidfVectorizer(stop_words=['el', 'la', 'en', 'a', 'o', 'los', 'las'])
        tfidf_matrix = tfidf.fit_transform(preparations)

        # Calculate Similarity
        cosine_sim = linear_kernel(tfidf_matrix, tfidf_matrix)

        # indice del plato con nombre "name"##
        idx = dish_name_indexes[query_name]

        # tupla (id_plato, score) de cada plato con respecto a "name"##
        sim_scores = list(enumerate(cosine_sim[idx]))

        # ordenamos por score, manteniendo el id para extraer los platos similares##
        sim_scores = sorted(sim_scores, key=lambda x: x[1], reverse=True)

        # top-3#
        best_scores = sim_scores[1:4]

        dish_name_indexes = [idx[0] for idx in best_scores]

        # Reommendation Response
        response = {'name': names[idx], 'ingredients': dishes_ingredients[idx], 'preparation': preparations[idx],
                    'image_path': image_paths[idx], 'uploader': uploaders[idx], 'total_price': total_prices[idx]}

        recommended_dishes = []
        for prediction_index in dish_name_indexes:
            name = names[prediction_index]
            image_path = image_paths[prediction_index]

            recommended_dishes.append({'name': name, 'image_path': image_path})
        response['recommended_dishes'] = recommended_dishes

        return JsonResponse(response)


@csrf_exempt
def filter_dish_by_ingredient(request):
    if request.method == 'POST':
        ingredient:str = request.POST['ingredient']

        response = dict()
        user_dishes = list()
        dishes = list(chain(*[Dish.objects.filter(plain_text_ingredients__contains=ingredient),
                              Dish.objects.filter(plain_text_ingredients__contains=ingredient.lower())]))
        for dish in dishes:
            dish_information = dict()
            dish_information['dish_name'] = dish.name
            dish_information['preparation'] = dish.preparation
            dish_information['uploader'] = dish.uploader
            dish_information['image_path'] = dish.imagePath
            dish_information['ingredients'] = dish.plain_text_ingredients

            user_dishes.append(dish_information)

        response['dishes'] = user_dishes

        return JsonResponse(response)

import matplotlib.pyplot as plt
@csrf_exempt
def create_dish(request):
    if request.method == 'POST':
        file: InMemoryUploadedFile = request.FILES.dict()['image']
        byte_image = file.open().read()
        image_buffer = np.frombuffer(byte_image, np.uint8)
        image: np.ndarray = cv2.imdecode(image_buffer, cv2.IMREAD_COLOR)
        image = cv2.resize(image, (507, 458))
        _, byte_image_resized = cv2.imencode('.png', image)

        name: str = request.POST['dish_name']
        preparation = request.POST['preparation']
        uploader = request.POST['username']
        plain_text_ingredients = request.POST['plain_text_ingredients']
        estimated_price = float(request.POST['estimated_price'])
        # imagePath = '_'.join(name.lower().split())+'.png'

        # Save Image
        # print(os.path.join(settings.MEDIA_ROOT, imagePath))
        im = pyimgur.Imgur('3cb63aac091c259')
        link = upload_image(instance=im, byte_image=byte_image_resized)
        print(link)
        imagePath = link

        # cv2.imwrite(os.path.join(settings.MEDIA_ROOT, imagePath), image)

        # Save Dish
        Dish.objects.create(name=name,
                            preparation=preparation,
                            uploader=uploader,
                            plain_text_ingredients=plain_text_ingredients,
                            estimated_price=estimated_price,
                            imagePath=imagePath)
                            # imagePath='media/'+imagePath)

        # Link user to dish
        # request.POST['score']
        like_dish(request)

        return HttpResponse('Correctamente Agregado')


@csrf_exempt
def delete_dish(request):
    if request.method == 'POST':
        name = request.POST['dish_name']

        # request.POST['username']
        dislike_dish(request)
        # imagePath = '_'.join(name.lower().split()) + '.png'

        dish = Dish.objects.filter(name=name)[0]

        dish.delete()
        # os.remove(os.path.join(settings.MEDIA_ROOT, imagePath))

        return HttpResponse('Eliminado Correctamente')


def upload_image(instance=None, byte_image=None, url=None, title=None, description=None,
                 album=None):
    """
    Upload the image at either path or url.

    :param path: The path to the image you want to upload.
    :param url: The url to the image you want to upload.
    :param title: The title the image will have when uploaded.
    :param description: The description the image will have when uploaded.
    :param album: The album the image will be added to when uploaded. Can
        be either a Album object or it's id. Leave at None to upload
        without adding to an Album, adding it later is possible.
        Authentication as album owner is necessary to upload to an album
        with this function.

    :returns: An Image object representing the uploaded image.
    """

    image = b64encode(byte_image)

    payload = {'album_id': album, 'image': image,
               'title': title, 'description': description}

    resp = instance._send_request(instance._base_url + "/3/image",
                              params=payload, method='POST')
    return resp['link']

# TODO:
# DONE:
#       GET DISH INFORMATION WITH RECOMENDER SYSTEM
#       GET IMAGES FROM URL MEDIA FOLDER,
#       UPLOAD IMAGES TO SERVER,
#       UPLOAD AND DELETE DISHES,
#       LINK USER TO UPLOADED DISH VIA A SCORE OF 6
#       WHEN DELETING DISH, WE ALSO HAVE TO DELETE THE RELATIONSHIP
