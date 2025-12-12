from django import forms
from .models import Equipo

# -------------------------
# LISTAS DE OPCIONES
# -------------------------

CODIGO = [
    ('', 'Seleccionar'),
    ('AG01-FDO', 'AG01-FDO'),
    ('AG02-FDO', 'AG02-FDO'),
    ('AG03-FDO', 'AG03-FDO'),
    ('AG04-FDO', 'AG04-FDO'),
    ('AG05-FDO', 'AG05-FDO'),
    ('AG06-FDO', 'AG06-FDO'),
    ('AG07-FDO', 'AG07-FDO'),
    ('AG08-FDO', 'AG08-FDO'),
    ('AG01-NMT', 'AG01-NMT'),
    ('AG02-NMT', 'AG02-NMT'),
    ('AG03-NMT', 'AG03-NMT'),
    ('AG04-NMT', 'AG04-NMT'),
    ('AG05-NMT', 'AG05-NMT'),
    ('AG06-NMT', 'AG06-NMT'),
    ('AG07-NMT', 'AG07-NMT'),
    ('AG08-NMT', 'AG08-NMT'),
]

SUCURSAL = [
    ('', 'Seleccionar'),
    ('Mocoa', 'Mocoa'),
    ('Villagarzon', 'Villagarzon'),
    ('Puerto Asis', 'Puerto Asis'),
    ('Puerto Leguizamo', 'Puerto Leguizamo'),
    ('Orito', 'Orito'),
    ('Hormiga', 'Hormiga'),
    ('Dorada', 'Dorada'),
    ('Sibundoy', 'Sibundoy'),
]

CLASIFICACION = [
    ('', 'Seleccionar'),
    ('Equipo de cómputo', 'Equipo de cómputo'),
    ('Equipo de comunicación y audiovisual', 'Equipo de comunicación y audiovisual'),
    ('Electrodomésticos', 'Electrodomésticos'),
    ('Menaje', 'Menaje'),
    ('Adornos', 'Adornos'),
    ('Muebles y enseres', 'Muebles y enseres'),
    ('Otros', 'Otros'),
]

RECURSOS = [
    ('', 'Seleccionar'),
    ('Gasto', 'Gasto'),
    ('Fondo de Educación', 'Fondo de Educación'),
    ('Fondo de Solidaridad', 'Fondo de Solidaridad'),
    ('Otro', 'Otro'),
]

ESTADO = [
    ('', 'Seleccionar'),
    ('Nuevo', 'Nuevo'),
    ('Bueno', 'Bueno'),
    ('Regular', 'Regular'),
    ('Malo', 'Malo'),
    ('Obsoleto', 'Obsoleto'),
]

CARGO_FUNCIONARIO = [
    ('', 'Seleccionar'),
    ('Asesor (a) comercial de microcrédito', 'Asesor (a) comercial de microcrédito'),
    ('Asesor (a) de crédito y atención al cliente', 'Asesor (a) de crédito y atención al cliente'),
    ('Asesor (a) de servicios', 'Asesor (a) de servicios'),
    ('Asistente de auditoría', 'Asistente de auditoría'),
    ('Asistente de cartera', 'Asistente de cartera'),
    ('Asistente de contabilidad', 'Asistente de contabilidad'),
    ('Asistente de contabilidad y finanzas', 'Asistente de contabilidad y finanzas'),
    ('Asistente de mercadeo y ventas', 'Asistente de mercadeo y ventas'),
    ('Asistente de organización y métodos', 'Asistente de organización y métodos'),
    ('Asistente de riesgos', 'Asistente de riesgos'),
    ('Asistente de seguridad y salud en el trabajo', 'Asistente de seguridad y salud en el trabajo'),
    ('Asistente de sistemas 1', 'Asistente de sistemas 1'),
    ('Asistente de sistemas 2', 'Asistente de sistemas 2'),
    ('Auditor interno', 'Auditor interno'),
    ('Auxiliar de corresponsal', 'Auxiliar de corresponsal'),
    ('Auxiliar de mensajería y archivo', 'Auxiliar de mensajería y archivo'),
    ('Auxiliar servicios generales', 'Auxiliar servicios generales'),
    ('Cajero', 'Cajero'),
    ('Coordinador de operaciones', 'Coordinador de operaciones'),
    ('Coordinador de operaciones de corresponsal solidario', 'Coordinador de operaciones de corresponsal solidario'),
    ('Director comercial y de mercadeo', 'Director comercial y de mercadeo'),
    ('Director de agencia', 'Director de agencia'),
    ('Director de crédito', 'Director de crédito'),
    ('Director de organización y métodos', 'Director de organización y métodos'),
    ('Director de riesgos', 'Director de riesgos'),
    ('Director de sistemas', 'Director de sistemas'),
    ('Director de talento humano', 'Director de talento humano'),
    ('Directora jurídica', 'Directora jurídica'),
    ('Directora administrativa y de operaciones', 'Directora administrativa y de operaciones'),
    ('Directora de cartera', 'Directora de cartera'),
    ('Directora de contabilidad y finanzas', 'Directora de contabilidad y finanzas'),
    ('Gerente general', 'Gerente general'),
    ('Oficial de cumplimiento sarlaft', 'Oficial de cumplimiento sarlaft'),
    ('Oficial de seguridad de la informacion y continuidad del negocio', 'Oficial de seguridad de la informacion y continuidad del negocio'),
    ('Pasante sena', 'Pasante sena'),
    ('Secretaria general', 'Secretaria general'),
    ('Tesorera', 'Tesorera'),
]


FUNCIONARIO_RESPONSABLE = [
    ('', 'Seleccionar'),
    ('Alfredo Ricardo Chamorro Burbano', 'Alfredo Ricardo Chamorro Burbano'),
    ('Amilda Berenice Caicedo Caicedo', 'Amilda Berenice Caicedo Caicedo'),
    ('Ana Marly Segura Diaz', 'Ana Marly Segura Diaz'),
    ('Ana Milena Ruano Chamorro', 'Ana Milena Ruano Chamorro'),
    ('Ana Viky Rosero Adarme', 'Ana Viky Rosero Adarme'),
    ('Andrea Carolina Verdugo Benavides', 'Andrea Carolina Verdugo Benavides'),
    ('Andrea Daniela Vallejos Pulido', 'Andrea Daniela Vallejos Pulido'),
    ('Angela Milena Urbano Narvaez', 'Angela Milena Urbano Narvaez'),
    ('Brandon Danilo Guerrero Jajoy', 'Brandon Danilo Guerrero Jajoy'),
    ('Camilo Alejandro Zambrano Hernandez', 'Camilo Alejandro Zambrano Hernandez'),
    ('Carlos Hernan Caicedo Ramos', 'Carlos Hernan Caicedo Ramos'),
    ('Carlos Ivan Romero Bastidas', 'Carlos Ivan Romero Bastidas'),
    ('Carlos Reinaldo Garcia Nastar', 'Carlos Reinaldo Garcia Nastar'),
    ('Claudia Paola Gaviria Diaz', 'Claudia Paola Gaviria Diaz'),
    ('Cristhian Andres Olarte Cordoba', 'Cristhian Andres Olarte Cordoba'),
    ('Cristian Manuel Robles', 'Cristian Manuel Robles'),
    ('Danny Yulieth Torres Castro', 'Danny Yulieth Torres Castro'),
    ('Deyvy Milena Muñoz Quenan', 'Deyvy Milena Muñoz Quenan'),
    ('Diana Alejandra Acero Carrillo', 'Diana Alejandra Acero Carrillo'),
    ('Diana Emilse Reyes Solarte', 'Diana Emilse Reyes Solarte'),
    ('Diana Yadira Congote Andrade', 'Diana Yadira Congote Andrade'),
    ('Edna Ximena Narvaez Ramirez', 'Edna Ximena Narvaez Ramirez'),
    ('Eduardo Cuaran Tipaz', 'Eduardo Cuaran Tipaz'),
    ('Elias Adirvey Galvis Carvajal', 'Elias Adirvey Galvis Carvajal'),
    ('Elver Mauricio Grueso Vainas', 'Elver Mauricio Grueso Vainas'),
    ('Fabian Lopez Getial', 'Fabian Lopez Getial'),
    ('Favio Nelson Ojeda Gomez', 'Favio Nelson Ojeda Gomez'),
    ('Freddy Alberto Guinchin Estrada', 'Freddy Alberto Guinchin Estrada'),
    ('Gerlin Duvan Rodriguez Portillo', 'Gerlin Duvan Rodriguez Portillo'),
    ('German Dario De La Cruz Chavez', 'German Dario De La Cruz Chavez'),
    ('Gladis Yanet Apraez Tapias', 'Gladis Yanet Apraez Tapias'),
    ('Hernan Antury Parra', 'Hernan Antury Parra'),
    ('Hernan Froilan Burbano Caicedo', 'Hernan Froilan Burbano Caicedo'),
    ('Hernan Santiago Zambrano Enriquez', 'Hernan Santiago Zambrano Enriquez'),
    ('Holmer Gutierrez Urbano', 'Holmer Gutierrez Urbano'),
    ('Irma Yolanda Obando Mora', 'Irma Yolanda Obando Mora'),
    ('Jaider Alfonso Guerra Sanchez', 'Jaider Alfonso Guerra Sanchez'),
    ('Jaime Fernando Rosero Sanchez', 'Jaime Fernando Rosero Sanchez'),
    ('Jeimy Katerine Vargas Arenas', 'Jeimy Katerine Vargas Arenas'),
    ('Jenny Marina Ortiz Carlosama', 'Jenny Marina Ortiz Carlosama'),
    ('Jerson David Solarte Perez', 'Jerson David Solarte Perez'),
    ('Jesus Alberto Garcia Muñoz', 'Jesus Alberto Garcia Muñoz'),
    ('Jhan Brandon Riascos Martinez', 'Jhan Brandon Riascos Martinez'),
    ('Johana Maritza Morales Cardenas', 'Johana Maritza Morales Cardenas'),
    ('Jonathan Mauricio Pejendino Rosero', 'Jonathan Mauricio Pejendino Rosero'),
    ('Karen Jackeline Campaña Delgado', 'Karen Jackeline Campaña Delgado'),
    ('Karen Liliana Villota Hernandez', 'Karen Liliana Villota Hernandez'),
    ('Kely Mabel Guerrero Lazo', 'Kely Mabel Guerrero Lazo'),
    ('Kevin Camilo Galarraga Cordoba', 'Kevin Camilo Galarraga Cordoba'),
    ('Liceth Karolina Pantoja Mora', 'Liceth Karolina Pantoja Mora'),
    ('Lorena Liseth Herrera Moncayo', 'Lorena Liseth Herrera Moncayo'),
    ('Lorena Lisseth Paz Chamorro', 'Lorena Lisseth Paz Chamorro'),
    ('Luis Jaide Jamauca Correa', 'Luis Jaide Jamauca Correa'),
    ('Luisa Fernanda Cuero Criollo', 'Luisa Fernanda Cuero Criollo'),
    ('Magda Johana Sanabria Tejada', 'Magda Johana Sanabria Tejada'),
    ('Maria Olga Diaz', 'Maria Olga Diaz'),
    ('Mario Steban Dueñas De La Cruz', 'Mario Steban Dueñas De La Cruz'),
    ('Mary Lucy Guerron Madroñero', 'Mary Lucy Guerron Madroñero'),
    ('Mery Norbeyi Castillo Nupan', 'Mery Norbeyi Castillo Nupan'),
    ('Michael Yela Valencia', 'Michael Yela Valencia'),
    ('Myriam Milena Portillo Castro', 'Myriam Milena Portillo Castro'),
    ('Nasson Pimentel Criollo', 'Nasson Pimentel Criollo'),
    ('Oswaldo Alejandro Narvaez Araujo', 'Oswaldo Alejandro Narvaez Araujo'),
    ('Raquel Malua Sayalpud', 'Raquel Malua Sayalpud'),
    ('Ruth Aleida Cuaran Solarte', 'Ruth Aleida Cuaran Solarte'),
    ('Sonia Yaneth Cubillos Beltran', 'Sonia Yaneth Cubillos Beltran'),
    ('Wilmer Moreno Estrada', 'Wilmer Moreno Estrada'),
    ('Yerzón Duvan Moreno Sanchez', 'Yerzón Duvan Moreno Sanchez'),
    ('Yesica Obando Ordoñez', 'Yesica Obando Ordoñez'),
    ('Yudy Andrea Henao Lopez', 'Yudy Andrea Henao Lopez'),
    ('Yurany Del Pilar Rodriguez Ceballos', 'Yurany Del Pilar Rodriguez Ceballos'),
]



# -------------------------
# FORMULARIO
# -------------------------

class EquipoForm(forms.ModelForm):

    class Meta:
        model = Equipo
        fields = "__all__"

        widgets = {
            'codigo': forms.Select(attrs={'class': 'form-control'}, choices=CODIGO),
            'descripcion': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Descripción del elemento'}),
            'serial': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Serial'}),
            'marca': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Marca'}),
            'modelo': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Modelo'}),
            'color': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Color'}),

            'sucursal': forms.Select(attrs={'class': 'form-control'}, choices=SUCURSAL),
            'clasificacion': forms.Select(attrs={'class': 'form-control'}, choices=CLASIFICACION),

            'valor': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Valor','inputmode': 'numeric','autocomplete': 'off'}),
            'fecha_compra': forms.DateInput(format='%Y-%m-%d',attrs={'class': 'form-control', 'type': 'date'}),

            'recursos': forms.Select(attrs={'class': 'form-control'}, choices=RECURSOS),
            'estado': forms.Select(attrs={'class': 'form-control'}, choices=ESTADO),

            'cargo_funcionario': forms.Select(attrs={'class': 'form-control'}, choices=CARGO_FUNCIONARIO),
            'funcionario_responsable': forms.Select(attrs={'class': 'form-control'}, choices=FUNCIONARIO_RESPONSABLE),
            'proveedor': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Proveedor'}),

            'observaciones': forms.Textarea(attrs={'class': 'form-control', 'rows': 3}),
        }

    # -------------------------
    # NORMALIZACIÓN (opcional pero recomendado)
    # upper = mayusculas
    # lower = minusculas
    # capitalize = primera mayuscula
    # -------------------------

    def clean_marca(self):
        marca = self.cleaned_data["marca"]
        return marca.upper().strip()  # ejemplo: HP, LENOVO

    def clean_modelo(self):
        modelo = self.cleaned_data["modelo"]
        return modelo.upper().strip()

    def clean_color(self):
        color = self.cleaned_data["color"]
        return color.capitalize().strip()

    def clean_funcionario_responsable(self):
        nombre = self.cleaned_data["funcionario_responsable"]
        return " ".join([p.capitalize() for p in nombre.lower().split()])

    def clean_valor(self):
        # Obtiene el valor tal como viene del formulario (con puntos)
        valor_raw = self.data.get("valor", "").replace(".", "")

        # Si el usuario deja el campo vacío → error obligatorio
        if valor_raw == "":
            raise forms.ValidationError("El valor es obligatorio.")

        try:
            # Convierte el valor ya limpio a entero
            valor = int(valor_raw)
        except:
            # Si contiene caracteres no numéricos → error
            raise forms.ValidationError("Ingrese solo números enteros.")

        # Valida que no ingresen números negativos
        if valor < 0:
            raise forms.ValidationError("El valor no puede ser negativo.")

        # Retorna el valor entero (este se guardará en la BD)
        return valor




    # Muy importante: definir los formatos aceptados
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['fecha_compra'].input_formats = ['%Y-%m-%d']
