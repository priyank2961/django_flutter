from django.db import models


class StudentData(models.Model):
    first_name   = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    email = models.CharField(max_length=30)
    password = models.CharField(max_length=30)
    age = models.IntegerField()
    city = models.CharField(max_length=20) 
