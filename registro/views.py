from django.shortcuts import render, redirect
from .models import Equipo
from .forms import EquipoForm


def registrar_equipo(request):
    if request.method == 'POST':
        form = EquipoForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('lista_equipos')  # Redirige a la vista de equipos
    else:
        form = EquipoForm()
    return render(request, 'registro/registrar_equipo.html', {'form': form})

def lista_equipos(request):
    equipos = Equipo.objects.all()
    return render(request, 'registro/lista_equipos.html', {'equipos': equipos})