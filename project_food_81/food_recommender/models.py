from django.db import models


# Create your models here.
class User(models.Model):
    name = models.CharField(max_length=200)
    email = models.CharField(max_length=200)
    sex = models.CharField(max_length=1)
    role = models.BooleanField()
    hashedPassword = models.CharField(max_length=1)


class Restaurant(models.Model):
    name = models.CharField(max_length=200)


class Ingredient(models.Model):
    name = models.CharField(max_length=200)
    unitaryPrice = models.FloatField()


class Dish(models.Model):
    name = models.CharField(max_length=200)
    preparation = models.TextField()
    imagePath = models.CharField(max_length=200)
    restaurant = models.ManyToManyField(Restaurant)
    user = models.ManyToManyField(User,
                                  through='DishInterest')
    ingredient = models.ManyToManyField(Ingredient,
                                        through='DishIngredients')


class DishIngredients(models.Model):
    quantity = models.FloatField()
    unit = models.CharField(max_length=10)
    dish = models.ForeignKey(Dish, on_delete=models.CASCADE)
    ingredient = models.ForeignKey(Ingredient, on_delete=models.CASCADE)


class DishInterest(models.Model):
    score = models.IntegerField()
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    dish = models.ForeignKey(Dish, on_delete=models.CASCADE)


"""
HOW TO GET INGREDIENTS AND QUANTITY FROM DISHES TABLE

d = Dish.objects.all()[0] # Get one dish
for ingredient, relation_attributes in zip(d.ingredient.all(), d.dishingredients_set.all()):
    print(ingredient.name, relation_attributes.quantity, relation_attributes.unit)
"""