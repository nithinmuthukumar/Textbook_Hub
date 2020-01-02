from django.contrib import admin

# Register your models here.
from bookhub.models import Textbook, User

admin.site.register(Textbook)
admin.site.register(User)