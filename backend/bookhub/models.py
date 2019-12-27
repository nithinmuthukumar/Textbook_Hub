from django.db import models

# Create your models here.
class Textbook(models.Model):
    name=models.CharField(max_length=40)
    file=models.FileField(upload_to='', null=True, blank=True)
    subject=models.CharField(max_length=40)
    grade=models.IntegerField()

    class Meta:
        ordering = ['grade']
    def __str__(self):
        return self.name
class User(models.Model):
    recents = models.ForeignKey(Textbook)
    favourites = models.ForeignKey(Textbook)

    name=models.CharField(max_length=40)

    def __str__(self):
        return self.name






