from django.shortcuts import render, redirect
from .models import Equipo
from .forms import EquipoForm


from django.contrib.auth.decorators import login_required

@login_required
def registrar_equipo(request):
    if request.method == 'POST':
        form = EquipoForm(request.POST)
        if form.is_valid():
            equipo = form.save(commit=False)
            equipo.funcionario_registra = request.user.get_full_name() or request.user.username  # Usa nombre completo si está disponible
            equipo.save()
            return redirect('lista_equipos')
    else:
        form = EquipoForm()
    return render(request, 'registro/registrar_equipo.html', {'form': form})


@login_required
def lista_equipos(request):
    equipos = Equipo.objects.all()
    return render(request, 'registro/lista_equipos.html', {'equipos': equipos})