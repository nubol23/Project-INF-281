# Generated by Django 2.1.7 on 2019-04-15 00:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('food_recommender', '0010_auto_20190415_0019'),
    ]

    operations = [
        migrations.AddField(
            model_name='dish',
            name='uploader',
            field=models.CharField(default='admin', max_length=200),
            preserve_default=False,
        ),
    ]
