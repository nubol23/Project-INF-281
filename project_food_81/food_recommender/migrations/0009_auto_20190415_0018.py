# Generated by Django 2.1.7 on 2019-04-15 00:18

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('food_recommender', '0008_auto_20190414_0456'),
    ]

    operations = [
        migrations.RenameField(
            model_name='user',
            old_name='name',
            new_name='username',
        ),
        migrations.RemoveField(
            model_name='user',
            name='age',
        ),
        migrations.RemoveField(
            model_name='user',
            name='country',
        ),
        migrations.RemoveField(
            model_name='user',
            name='sex',
        ),
    ]
