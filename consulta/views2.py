from django.shortcuts import render
from django.http import JsonResponse
from django.db import connections
from .forms import ConsultaAsociado

def consulta(request):
    estado = None
    estado_aptitud = None
    mensaje = ""
    observacion = ""
    tipo_mensaje = "danger"  # Valor predeterminado para mensajes de error o advertencia
    form = ConsultaAsociado(request.POST or None)

    if request.method == 'POST' and form.is_valid():
        identificacion = form.cleaned_data['identificacion']

        print("Ejecutando consulta con identificación:", identificacion)

        # Realizar consulta en la base de datos MySQL
        with connections['default'].cursor() as cursor:
            query = """
                SELECT estado, observacion
                FROM asociados
                WHERE cedula = %s
            """
            cursor.execute(query, [identificacion])
            resultado = cursor.fetchone()

        print("Resultado de la consulta:", resultado)

        # Procesar los resultados
        if resultado:
            estado = resultado[0]
            observacion = resultado[1] if resultado[1] is not None else "Sin observaciones"

            if estado.lower() == "habil":
                estado_aptitud = "habil"
                mensaje = f"La persona con cédula {identificacion} está habilitada."
                tipo_mensaje = "success"  # Cambiar a éxito si es habilitado
            else:
                estado_aptitud = "INHABIL"
                mensaje = f"La persona con cédula {identificacion} NO está habilitada."
        else:
            mensaje = f"No se encontraron resultados para la identificación {identificacion}."

        # Manejar respuestas AJAX
        if request.headers.get('X-Requested-With') == 'XMLHttpRequest':
            return JsonResponse({'estado': estado, 'mensaje': mensaje, 'observacion': observacion, 'tipo_mensaje': tipo_mensaje})

    return render(request, 'consulta/consulta.html', {
        'title': "Consultar asociado",
        'form': form,
        'estado': estado,
        'estado_aptitud': estado_aptitud,
        'mensaje': mensaje,
        'observacion': observacion,
    })
