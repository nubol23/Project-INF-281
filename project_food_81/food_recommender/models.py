from django.db import models


# Create your models here.
class Ingredient(models.Model):
    name = models.CharField(max_length=200, unique=True)
    unitaryPrice = models.FloatField()

    def __str__(self):
        return self.name


class Dish(models.Model):
    name = models.CharField(max_length=200, unique=True)
    preparation = models.TextField()
    uploader = models.CharField(max_length=200)

    plain_text_ingredients = models.TextField()
    estimated_price = models.IntegerField()

    imagePath = models.CharField(max_length=200)
    # ingredients = models.ManyToManyField(Ingredient,
    #                                      through='DishIngredients')

    def __str__(self):
        return self.name


class Restaurant(models.Model):
    name = models.CharField(max_length=200, unique=True)
    dishes_in_menu = models.ManyToManyField(Dish)

    def __str__(self):
        return self.name


class User(models.Model):
    username = models.CharField(max_length=200, unique=True)
    email = models.CharField(max_length=200)
    # sex = models.CharField(max_length=1)

    # 0: Normal user, 1: Admin
    role = models.BooleanField()

    hashedPassword = models.CharField(max_length=200)
    # country = models.CharField(max_length=200)
    # age = models.IntegerField()
    description = models.TextField()

    liked_dishes = models.ManyToManyField(Dish,
                                          through='DishInterest')
    follow = models.ManyToManyField('self', symmetrical=False)

    def __str__(self):
        return self.username


class DishIngredients(models.Model):
    quantity = models.FloatField()
    unit = models.CharField(max_length=10)
    dish = models.ForeignKey(Dish, on_delete=models.CASCADE)
    ingredient = models.ForeignKey(Ingredient, on_delete=models.CASCADE)

    def __str__(self):
        return str(self.quantity) + ' ' + str(self.unit)


class DishInterest(models.Model):
    score = models.IntegerField()
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    dish = models.ForeignKey(Dish, on_delete=models.CASCADE)

    def __str__(self):
        return 'score: ' + str(self.score)


"""
HOW TO GET INGREDIENTS AND QUANTITY FROM DISHES TABLE

d = Dish.objects.all()[0] # Get one dish
for ingredient, relation_attributes in zip(d.ingredient.all(), d.dishingredients_set.all()):
    print(ingredient.name, relation_attributes.quantity, relation_attributes.unit)
"""