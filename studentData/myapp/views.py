from django.http.response import HttpResponse
from rest_framework.serializers import Serializer
from myapp.models import StudentData
from rest_framework.decorators import api_view
from rest_framework.response import Response
from .serializer import StudentDataSerializer

@api_view(['GET'])
def getStudentData(request):
        studentData=StudentData.objects.all()
        serializer = StudentDataSerializer(studentData,many=True)
        return Response(serializer.data)

@api_view(['GET'])
def getStudent(request,pk):
        studentData=StudentData.objects.get(id = pk)
        serializer = StudentDataSerializer(studentData,many=False)
        return Response(serializer.data)


@api_view(['PUT'])
def updateStudent(request, pk):
    data = request.data
    student = StudentData.objects.get(id=pk)
    serializer = StudentDataSerializer(student,data=request.data)
    if serializer.is_valid():
            serializer.save()
    else:
        print("serializer is not rightttt")
    return Response(serializer.data)
   
@api_view(['DELETE'])
def deleteStudent(request,pk):
    studentData = StudentData.objects.get(id=pk)
    studentData.delete()
    return Response("Student was Deleted!")

@api_view(['POST'])
def createStudent(request):
        data=request.data
        student = StudentData.objects.create(
            first_name=data['first_name'], last_name=data['last_name'], email=data[
                'email'], password=data['password'], age=int(data['age']), city=data['city']
        )
        serializer = StudentDataSerializer(student,many=False)
        return Response(serializer.data)