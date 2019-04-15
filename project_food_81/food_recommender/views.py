from django.shortcuts import render, HttpResponse, Http404
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from typing import Dict, AnyStr

from itertools import chain
from random import sample

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
        hashed_password: AnyStr = data['hashed_password']
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
        password = data['password']

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

            ingredients = []
            for ingredient in dish.ingredients.all():
                ingredient_information = dict()
                ingredient_information['ingredient_name'] = ingredient.name
                ingredient_information['ingredient_price'] = str(ingredient.unitaryPrice)
                ingredients.append(ingredient_information)

            dish_information['ingredients'] = ingredients

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

            ingredients = []
            for ingredient in dish.ingredients.all():
                ingredient_information = dict()
                ingredient_information['ingredient_name'] = ingredient.name
                ingredient_information['ingredient_price'] = str(ingredient.unitaryPrice)
                ingredients.append(ingredient_information)

            dish_information['ingredients'] = ingredients

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

            ingredients = []
            for ingredient in dish.ingredients.all():
                ingredient_information = dict()
                ingredient_information['ingredient_name'] = ingredient.name
                ingredient_information['ingredient_price'] = str(ingredient.unitaryPrice)
                ingredients.append(ingredient_information)

            dish_information['ingredients'] = ingredients

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

            ingredients = []
            for ingredient in dish.ingredients.all():
                ingredient_information = dict()
                ingredient_information['ingredient_name'] = ingredient.name
                ingredient_information['ingredient_price'] = str(ingredient.unitaryPrice)
                ingredients.append(ingredient_information)

            dish_information['ingredients'] = ingredients

            user_dishes.append(dish_information)

        response['dishes'] = user_dishes

        return JsonResponse(response)

# TODO: GET IMAGES FROM URL MEDIA FOLDER,
#       UPLOAD IMAGES TO SERVER,
#       UPLOAD AND DELETE DISHES
#       GET DISH INFORMATION WITH RECOMENDER SYSTEM,
