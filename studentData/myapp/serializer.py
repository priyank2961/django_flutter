from django.db.models import fields
from rest_framework.serializers import ModelSerializer
from myapp.models import StudentData

class StudentDataSerializer(ModelSerializer):
    class Meta:
        model = StudentData
        fields = '__all__'