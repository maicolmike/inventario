from django.db import models

class Equipo(models.Model):
    serial_contabilidad = models.CharField(max_length=50, unique=True)
    marca = models.CharField(max_length=50)
    modelo = models.CharField(max_length=50)
    serial = models.CharField(max_length=50, unique=True)
    procesador = models.CharField(max_length=100)
    memoria_ram = models.CharField(max_length=50)
    capacidad_max = models.CharField(max_length=50)
    tipo = models.CharField(max_length=50)
    velocidad = models.CharField(max_length=50)
    disco_duro = models.CharField(max_length=50)
    capacidad = models.CharField(max_length=50)
    version_windows = models.CharField(max_length=50)
    clave_windows = models.CharField(max_length=50)
    version_office = models.CharField(max_length=50)
    clave_office = models.CharField(max_length=50)
    ip = models.GenericIPAddressField()
    any_desk = models.CharField(max_length=50, blank=True, null=True)
    clave_admin = models.CharField(max_length=50)
    funcionario_a_cargo = models.CharField(max_length=100)
    observaciones = models.TextField(blank=True, null=True)
    funcionario_registra = models.CharField(max_length=100)

    def __str__(self):
        return f"{self.marca} {self.modelo} ({self.serial})"

