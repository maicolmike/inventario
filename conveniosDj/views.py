# se crea el archivo views.py y se pone esto dentro
from django.http import HttpResponse
from django.shortcuts import render
from django.contrib.auth.decorators import login_required # vista basada en funciones que no permita acceder a paginas donde no se ha logeado
from django.shortcuts import redirect

def index(request):
    # Redirige automáticamente a la página de consulta
    return redirect('consulta')  # Cambia 'consulta' al nombre correcto de tu URL
