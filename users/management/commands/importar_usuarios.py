# Módulo estándar de Python para leer archivos CSV
import csv

# Path permite construir rutas de archivos de forma segura
# (funciona igual en Linux, Windows y servidores)
from pathlib import Path

# Clase base para crear comandos personalizados en Django
from django.core.management.base import BaseCommand

# Permite acceder a la variable BASE_DIR del proyecto
from django.conf import settings

# Obtiene el modelo de usuario activo (User por defecto
# o un User personalizado si usas AbstractUser)
from django.contrib.auth import get_user_model


# Se obtiene el modelo de usuario definido en AUTH_USER_MODEL
User = get_user_model()


# ===============================
# COMANDO PERSONALIZADO
# ===============================

# Todo comando de Django DEBE tener una clase llamada Command
# y heredar de BaseCommand
class Command(BaseCommand):

    # Texto descriptivo que aparece al ejecutar:
    # python manage.py help
    help = "Importar usuarios desde CSV con first_name"


    # Método principal del comando
    # Django ejecuta este método cuando corres:
    # python manage.py importar_usuarios2
    def handle(self, *args, **options):

        # Ruta completa al archivo CSV usando BASE_DIR
        # BASE_DIR apunta a la carpeta donde está manage.py
        ruta_archivo = Path(settings.BASE_DIR) / "users" / "import_users" / "usuarios_inventario.csv"


        # Abrimos el archivo CSV en modo lectura
        # newline='' evita líneas vacías
        # encoding='utf-8' permite tildes y caracteres especiales
        with open(ruta_archivo, newline='', encoding='utf-8') as archivo:

            # DictReader convierte cada fila en un diccionario
            # Ejemplo:
            # {
            #   'username': 'admin11',
            #   'first_name': 'Administrador',
            #   'agencia': 'AG01',
            #   'email': 'correo@email.com'
            # }
            reader = csv.DictReader(archivo)


            # enumerate permite saber el número de fila del CSV
            # start=2 porque la fila 1 es el encabezado
            for fila_num, fila in enumerate(reader, start=2):

                # Se leen los valores del CSV
                # .get evita errores si la columna no existe
                # .strip elimina espacios en blanco
                username = fila.get("username", "").strip()
                first_name = fila.get("first_name", "").strip()
                agencia = fila.get("agencia", "").strip()
                email = fila.get("email", "").strip()


                # ===============================
                # VALIDACIONES
                # ===============================

                # El username es obligatorio
                if not username:
                    self.stdout.write(
                        self.style.ERROR(f"❌ Fila {fila_num}: username vacío")
                    )
                    # Salta a la siguiente fila
                    continue


                # Verifica si el usuario ya existe en la base de datos
                if User.objects.filter(username=username).exists():
                    self.stdout.write(
                        self.style.WARNING(f"⚠ Usuario {username} ya existe")
                    )
                    continue


                # ===============================
                # CREACIÓN DEL USUARIO
                # ===============================

                # create_user:
                # - Encripta automáticamente la contraseña
                # - Aplica las validaciones del modelo User
                User.objects.create_user(
                    username=username,
                    first_name=first_name,
                    agencia=agencia,
                    email=email,
                    password=username  # 🔐 se guarda encriptada (pbkdf2)
                )


                # Mensaje de éxito en consola
                self.stdout.write(
                    self.style.SUCCESS(f"✅ Usuario {username} creado correctamente")
                )


# ===============================
# EJECUCIÓN DEL COMANDO
# ===============================
# Desde la carpeta donde está manage.py ejecutar:
# python manage.py importar_usuarios2

                
# correr el comando toca irse a la carpeta inventario y ejecutar:
# python3 manage.py importar_usuarios