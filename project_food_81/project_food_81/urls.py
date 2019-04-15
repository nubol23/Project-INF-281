"""project_food_81 URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from food_recommender.views import *

urlpatterns = [
    path('admin/', admin.site.urls),
    path('list-feed/', list_dishes_news_feed, name='list_feed'),
    path('list-user-dish/', list_dishes_users, name='list_users_dishes'),
    path('register/', register, name='register'),
    path('follow/', follow, name='follow'),
    path('unfollow/', unfollow, name='unfollow'),
    path('user-list/', list_users, name='list_users'),
    path('authenticate/', authenticate, name='auth'),
    path('user-information/', show_user_information, name='information'),
    path('like-dish/', like_dish, name='like'),
    path('dislike-dish/', dislike_dish, name='dislike'),
    path('list-liked-dishes/', list_dishes_i_like, name='liked_dishes'),
]
