from django.shortcuts import render

# Create your views here.
def home_view(request):
    return render(request,'a_posts/home.html')

