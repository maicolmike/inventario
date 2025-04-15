from django.contrib import admin
from django.urls import path
from . import views
from users.views import login_view,logout_view,register,usersList,CambiarClave,UserUpdateView,UserUdpateClave,UserDelete,recuperar_clave
from consulta.views import consulta
from registro.views import registrar_equipo, lista_equipos, editar_equipo, eliminar_equipo, exportar_equipos_excel



urlpatterns = [
    path('admin/', admin.site.urls),
    #agregadas por el usuario
    path('',views.index, name='index'),
    path('users/login', login_view, name='login'),
    path('users/logout', logout_view, name='logout'),
    path('users/registro',register, name='register'),
    path('users/listadoUsuarios',usersList, name='usersList'),
    path('users/cambiarClave', CambiarClave, name='CambiarClave'),
    path('users/editar', UserUpdateView, name='updateusuarios'),
    path('users/editarClave', UserUdpateClave, name='updateusuariosClave'),
    path('users/eliminarUsuarios', UserDelete, name='deleteusuarios'),
    path('users/recuperarClave', recuperar_clave, name='recuperar_clave'),
    path('consulta/consulta', consulta, name='consulta'),
    path('registro/registrar_equipo', registrar_equipo, name='registrar_equipo'),
    path('registro/lista_equipos', lista_equipos, name='lista_equipos'),
    path('registro/equipos/<int:pk>/editar/', editar_equipo, name='editar_equipo'),
    path('registro/equipos/<int:pk>/eliminar/', eliminar_equipo, name='eliminar_equipo'),
    path('registro/exportar_equipos_excel', exportar_equipos_excel, name='exportar_equipos_excel'),

    
]