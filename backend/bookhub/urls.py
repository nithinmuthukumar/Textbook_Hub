from django.urls import path, include
from rest_framework import routers

from . import views
router = routers.DefaultRouter()

router.register('textbooks', views.TextbookViewSet,basename='textbook')



urlpatterns = [
    path('', include(router.urls)),


]