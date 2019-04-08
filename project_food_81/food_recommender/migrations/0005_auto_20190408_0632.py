# Generated by Django 2.1.7 on 2019-04-08 06:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('food_recommender', '0004_auto_20190408_0609'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='ingredient',
            name='dish',
        ),
        migrations.AddField(
            model_name='dish',
            name='ingredient',
            field=models.ManyToManyField(through='food_recommender.DishIngredients', to='food_recommender.Ingredient'),
        ),
    ]
