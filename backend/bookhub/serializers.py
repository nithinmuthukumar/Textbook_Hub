from rest_framework import serializers
from bookhub.models import Textbook


class TextbookSerializer(serializers.ModelSerializer):
    class Meta:
        model = Textbook
        fields = ['id', 'name', 'file', 'subject', 'grade']