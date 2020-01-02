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

    favourites = models.ForeignKey(Textbook,on_delete=models.CASCADE)
    recents = models.ForeignKey(Textbook,on_delete=models.CASCADE,related_name="recents")
    name=models.CharField(max_length=40)

    def __str__(self):
        return self.name






