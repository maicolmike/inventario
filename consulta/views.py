from django.shortcuts import render
from django.http import JsonResponse
from django.db import connections
from .forms import ConsultaAsociado


def consulta(request):
    estado_aptitud = None
    mensaje = ""
    mensaje2 = ""
    mensaje3 = ""
    form = ConsultaAsociado(request.POST or None)

    if request.method == 'POST' and form.is_valid():
        identificacion = form.cleaned_data['identificacion']

        # Realizar consulta en la base de datos MySQL
        with connections['default'].cursor() as cursor:
            query = """
                SELECT identificacion, nombre, agencia, estado, observacion
                FROM asociados
                WHERE identificacion = %s
            """
            cursor.execute(query, [identificacion])
            resultado = cursor.fetchone()

        print("Resultado de la consulta:", resultado)  # Depuración

        # Procesar los resultados
        if resultado:
            identificacion = resultado[0]
            nombre = resultado[1]
            agencia = resultado[2]
            estado = resultado[3].strip().upper()  # Normalizar a mayúsculas
            observacion = resultado[4]

            if estado == "HABIL":
                estado_aptitud = "HABIL"
                mensaje = f"{nombre}"
                #mensaje2 = f"{observacion}"
            elif estado == "INHABIL":
                estado_aptitud = "INHABIL"
                mensaje = f"{nombre}"
                mensaje3 = "Motivo de inhabilidad"
                mensaje2 = f"{observacion}"
            else:
                estado_aptitud = "NO ENCONTRADO"
                mensaje = f"No se encontró un estado válido para la identificación {identificacion}."

        else:
            mensaje = f"No se encontraron resultados para la identificación {identificacion}."
        
        # Manejar respuestas AJAX
        if request.headers.get('X-Requested-With') == 'XMLHttpRequest':
            return JsonResponse({'estado': estado_aptitud, 'mensaje': mensaje, 'mensaje2': mensaje2, 'mensaje3': mensaje3})

    # Renderizar la plantilla para solicitudes normales
    return render(request, 'consulta/consulta.html', {
        'title': "Consultar asociado",
        'form': form,
        'estado_aptitud': estado_aptitud,
        'mensaje': mensaje,
        'mensaje2': mensaje2,
        'mensaje3': mensaje3,
    })
