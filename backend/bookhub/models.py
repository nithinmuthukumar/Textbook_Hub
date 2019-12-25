from django.db import models

# Create your models here.
class Textbook(models.Model):
    name=models.CharField(max_length=40)
    file=models.FileField(upload_to='pdf')
    subject=models.CharField(max_length=40)
    grade=models.IntegerField()

    class Meta:
        ordering = ['grade']
    def __str__(self):
        return self.name

