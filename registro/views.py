from django.shortcuts import render, redirect,get_object_or_404
from .models import Equipo
from .forms import EquipoForm
from django.contrib.auth.decorators import login_required
from django.contrib import messages

import openpyxl  #pip install openpyxl -- toca instalarlo sino genera error
from django.http import HttpResponse
from datetime import datetime

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

@login_required
def editar_equipo(request, pk):
    equipo = get_object_or_404(Equipo, pk=pk)
    if request.method == 'POST':
        form = EquipoForm(request.POST, instance=equipo)
        if form.is_valid():
            form.save()
            messages.success(request, "Equipo actualizado correctamente.")
            return redirect('lista_equipos')
    else:
        form = EquipoForm(instance=equipo)
    return render(request, 'registro/registrar_equipo.html', {'form': form})

@login_required
def eliminar_equipo(request, pk):
    equipo = get_object_or_404(Equipo, pk=pk)
    equipo.delete()
    messages.success(request, "Equipo eliminado exitosamente.")
    return redirect('lista_equipos')

def exportar_equipos_excel(request):
    wb = openpyxl.Workbook()
    ws = wb.active
    ws.title = "Equipos"

    # Cabeceras
    columnas = [
        'Id', 'Serial Contabilidad', 'Marca', 'Modelo', 'Serial', 'Procesador',
        'Memoria RAM', 'Capacidad Max', 'Tipo', 'Velocidad', 'Disco Duro',
        'Capacidad', 'Versión Windows', 'Clave Windows', 'Versión Office',
        'Clave Office', 'IP', 'AnyDesk', 'Clave Admin', 'Funcionario a Cargo',
        'Observaciones', 'Funcionario Registra'
    ]
    ws.append(columnas)

    # Datos
    for equipo in Equipo.objects.all():
        fila = [
            equipo.id, equipo.serial_contabilidad,equipo.marca, equipo.modelo, equipo.serial,
            equipo.procesador, equipo.memoria_ram, equipo.capacidad_max, equipo.tipo,
            equipo.velocidad, equipo.disco_duro, equipo.capacidad, equipo.version_windows,
            equipo.clave_windows, equipo.version_office, equipo.clave_office, equipo.ip,
            equipo.any_desk, equipo.clave_admin, equipo.funcionario_a_cargo,
            equipo.observaciones, equipo.funcionario_registra
        ]
        ws.append(fila)

    # Nombre del archivo con fecha
    fecha = datetime.now().strftime('%Y-%m-%d')
    filename = f'equipos_{fecha}.xlsx'

    # Configurar la respuesta HTTP
    response = HttpResponse(
        content_type='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
    )
    response['Content-Disposition'] = f'attachment; filename={filename}'

    wb.save(response)
    return response