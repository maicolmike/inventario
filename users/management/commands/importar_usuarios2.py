import csv
from pathlib import Path
from django.core.management.base import BaseCommand
from django.conf import settings
from django.contrib.auth import get_user_model

User = get_user_model()

class Command(BaseCommand):
    help = "Importar usuarios desde CSV con first_name"

    def handle(self, *args, **options):
        ruta_archivo = Path(settings.BASE_DIR) / "users" / "import_users" / "usuarios_inventario.csv"

        with open(ruta_archivo, newline='', encoding='utf-8') as archivo:
            reader = csv.DictReader(archivo)

            for fila_num, fila in enumerate(reader, start=2):

                username = fila.get("username", "").strip()
                first_name = fila.get("first_name", "").strip()
                agencia = fila.get("agencia", "").strip()
                email = fila.get("email", "").strip()

                if not username:
                    self.stdout.write(
                        self.style.ERROR(f"❌ Fila {fila_num}: username vacío")
                    )
                    continue

                if User.objects.filter(username=username).exists():
                    self.stdout.write(
                        self.style.WARNING(f"⚠ Usuario {username} ya existe")
                    )
                    continue

                User.objects.create_user(
                    username=username,
                    first_name=first_name,
                    agencia=agencia,
                    email=email,
                    password=username  # 🔐 Django la encripta
                )

                self.stdout.write(
                    self.style.SUCCESS(f"✅ Usuario {username} creado correctamente")
                )





# correr el comando toca irse a la carpeta inventario y ejecutar:
# python3 manage.py importar_usuarios2