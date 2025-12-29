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
    return render(request, 'registro/registrar_equipo.html', {
        'title': "Registrar equipo",
        'form': form
        })

@login_required
def lista_equipos(request):
    equipos = Equipo.objects.all()
    return render(request, 'registro/lista_equipos.html', {
        'title': "Consultar equipos",
        'equipos': equipos
        })

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
    return render(request, 'registro/registrar_equipo.html', {
        'title': "Editar equipo",
        'form': form
        })

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
        'ID', 'Código', 'Descripción', 'Serial', 'Marca', 'Modelo', 'Color','Cantidad',
        'Sucursal', 'Clasificación', 'Valor', 'Fecha Compra', 'Fecha Entrega','Número de Acta','Recursos',
        'Estado', 'Cargo Funcionario', 'Funcionario Responsable','Nit Proveedor',
        'Proveedor', 'Observaciones'
    ]
    ws.append(columnas)

    # Datos
    for equipo in Equipo.objects.all():
        fila = [
            equipo.id,
            equipo.codigo,
            equipo.descripcion,
            equipo.serial,
            equipo.marca,
            equipo.modelo,
            equipo.color,
            equipo.cantidad,
            equipo.sucursal,
            equipo.clasificacion,
            float(equipo.valor),
            equipo.fecha_compra.strftime('%d/%m/%Y') if equipo.fecha_compra else "",
            equipo.fecha_entrega.strftime('%d/%m/%Y') if equipo.fecha_entrega else "",
            equipo.numero_acta,
            equipo.recursos,
            equipo.estado,
            equipo.cargo_funcionario,
            equipo.funcionario_responsable,
            equipo.nit_proveedor,
            equipo.proveedor,
            equipo.observaciones or ""
        ]
        ws.append(fila)

    fecha = datetime.now().strftime('%Y-%m-%d')
    filename = f'equipos_{fecha}.xlsx'

    response = HttpResponse(
        content_type='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
    )
    response['Content-Disposition'] = f'attachment; filename={filename}'

    wb.save(response)
    return response
