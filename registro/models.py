from django.db import models

class Equipo(models.Model):
    codigo = models.CharField(max_length=50)
    descripcion = models.CharField(max_length=255)
    serial = models.CharField(max_length=100, unique=True)
    marca = models.CharField(max_length=150)
    modelo = models.CharField(max_length=150)
    color = models.CharField(max_length=50)
    sucursal = models.CharField(max_length=50)
    clasificacion = models.CharField(max_length=100)
    valor = models.BigIntegerField()
    fecha_compra = models.DateField()
    recursos = models.CharField(max_length=100)
    estado = models.CharField(max_length=50)
    cargo_funcionario = models.CharField(max_length=100)
    funcionario_responsable = models.CharField(max_length=100)
    proveedor = models.CharField(max_length=255)
    observaciones = models.TextField(blank=True, null=True)

    def __str__(self):
        return f"{self.descripcion} - {self.serial}"
