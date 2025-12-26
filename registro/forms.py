from django import forms
from .models import Equipo
import unicodedata

# -------------------------
# FUNCIÓN DE NORMALIZACIÓN
# -------------------------
def normalizar(texto):
    if not texto:
        return texto
    texto = texto.lower().strip()
    texto = unicodedata.normalize('NFD', texto)
    texto = ''.join(c for c in texto if unicodedata.category(c) != 'Mn')
    return texto

# -------------------------
# LISTAS DE OPCIONES
# -------------------------

CODIGO = [
    ('', 'Seleccionar'),
    ('ag01-fdo', 'AG01-FDO'),
    ('ag02-fdo', 'AG02-FDO'),
    ('ag03-fdo', 'AG03-FDO'),
    ('ag04-fdo', 'AG04-FDO'),
    ('ag05-fdo', 'AG05-FDO'),
    ('ag06-fdo', 'AG06-FDO'),
    ('ag07-fdo', 'AG07-FDO'),
    ('ag08-fdo', 'AG08-FDO'),
    ('ag01-nmt', 'AG01-NMT'),
    ('ag02-nmt', 'AG02-NMT'),
    ('ag03-nmt', 'AG03-NMT'),
    ('ag04-nmt', 'AG04-NMT'),
    ('ag05-nmt', 'AG05-NMT'),
    ('ag06-nmt', 'AG06-NMT'),
    ('ag07-nmt', 'AG07-NMT'),
    ('ag08-nmt', 'AG08-NMT'),
]

SUCURSAL = [
    ('', 'Seleccionar'),
    ('mocoa', 'Mocoa'),
    ('sibundoy', 'Sibundoy'),
    ('puerto asis', 'Puerto Asís'),
    ('hormiga', 'Hormiga'),
    ('orito', 'Orito'),
    ('puerto leguizamo', 'Puerto Leguízamo'),
    ('dorada', 'Dorada'),
    ('villagarzon', 'Villagarzón'),
]


CLASIFICACION = [
    ('', 'Seleccionar'),
    ('adornos', 'Adornos'),
    ('electrodomesticos', 'Electrodomésticos'),
    ('equipo de computo', 'Equipo de cómputo'),
    ('equipo de comunicacion y audiovisual', 'Equipo de comunicación y audiovisual'),
    ('menaje', 'Menaje'),
    ('muebles y enseres', 'Muebles y enseres'),
    ('otros', 'Otros'),
]

RECURSOS = [
    ('', 'Seleccionar'),
    ('gasto', 'Gasto'),
    ('fondo de educacion', 'Fondo de Educación'),
    ('fondo de solidaridad', 'Fondo de Solidaridad'),
    ('otro', 'Otro'),
]

ESTADO = [
    ('', 'Seleccionar'),
    ('nuevo', 'Nuevo'),
    ('bueno', 'Bueno'),
    ('regular', 'Regular'),
    ('malo', 'Malo'),
    ('obsoleto', 'Obsoleto'),
]

CARGO_FUNCIONARIO = [
    ('', 'Seleccionar'),
    ('asesor (a) comercial de microcredito', 'Asesor (a) comercial de microcrédito'),
    ('asesor (a) de credito y atencion al cliente', 'Asesor (a) de crédito y atención al cliente'),
    ('asesor (a) de servicios', 'Asesor (a) de servicios'),
    ('asistente de auditoría', 'Asistente de auditoría'),
    ('asistente de cartera', 'Asistente de cartera'),
    ('asistente de contabilidad', 'Asistente de contabilidad'),
    ('asistente de contabilidad y finanzas', 'Asistente de contabilidad y finanzas'),
    ('asistente de mercadeo y ventas', 'Asistente de mercadeo y ventas'),
    ('asistente de organizacion y metodos', 'Asistente de organización y métodos'),
    ('asistente de riesgos', 'Asistente de riesgos'),
    ('asistente de seguridad y salud en el trabajo', 'Asistente de seguridad y salud en el trabajo'),
    ('asistente de sistemas 1', 'Asistente de sistemas 1'),
    ('asistente de sistemas 2', 'Asistente de sistemas 2'),
    ('auditor interno', 'Auditor interno'),
    ('auxiliar de corresponsal', 'Auxiliar de corresponsal'),
    ('auxiliar de mensajeria y archivo', 'Auxiliar de mensajería y archivo'),
    ('auxiliar servicios generales', 'Auxiliar servicios generales'),
    ('cajero', 'Cajero'),
    ('coordinador de operaciones', 'Coordinador de operaciones'),
    ('coordinador de operaciones de corresponsal solidario', 'Coordinador de operaciones de corresponsal solidario'),
    ('director comercial y de mercadeo', 'Director comercial y de mercadeo'),
    ('director de agencia', 'Director de agencia'),
    ('director de crédito', 'Director de crédito'),
    ('director de organización y métodos', 'Director de organización y métodos'),
    ('director de riesgos', 'Director de riesgos'),
    ('director de sistemas', 'Director de sistemas'),
    ('director de talento humano', 'Director de talento humano'),
    ('directora juridica', 'Directora jurídica'),
    ('directora administrativa y de operaciones', 'Directora administrativa y de operaciones'),
    ('directora de cartera', 'Directora de cartera'),
    ('directora de contabilidad y finanzas', 'Directora de contabilidad y finanzas'),
    ('gerente general', 'Gerente general'),
    ('oficial de cumplimiento sarlaft', 'Oficial de cumplimiento sarlaft'),
    ('oficial de seguridad de la informacion y continuidad del negocio', 'Oficial de seguridad de la informacion y continuidad del negocio'),
    ('pasante sena', 'Pasante sena'),
    ('secretaria general', 'Secretaria general'),
    ('tesorera', 'Tesorera'),
]


FUNCIONARIO_RESPONSABLE = [
    ('', 'Seleccionar'),
     ('alfredo ricardo chamorro burbano', 'Alfredo Ricardo Chamorro Burbano'),
    ('amilda berenice caicedo caicedo', 'Amilda Berenice Caicedo Caicedo'),
    ('ana marly segura diaz', 'Ana Marly Segura Diaz'),
    ('ana milena ruano chamorro', 'Ana Milena Ruano Chamorro'),
    ('ana viky rosero adarme', 'Ana Viky Rosero Adarme'),
    ('andrea carolina verdugo benavides', 'Andrea Carolina Verdugo Benavides'),
    ('andrea daniela vallejos pulido', 'Andrea Daniela Vallejos Pulido'),
    ('angela milena urbano narvaez', 'Angela Milena Urbano Narvaez'),
    ('brandon danilo guerrero jajoy', 'Brandon Danilo Guerrero Jajoy'),
    ('camilo alejandro zambrano hernandez', 'Camilo Alejandro Zambrano Hernandez'),
    ('carlos hernan caicedo ramos', 'Carlos Hernan Caicedo Ramos'),
    ('carlos ivan romero bastidas', 'Carlos Ivan Romero Bastidas'),
    ('carlos reinaldo garcia nastar', 'Carlos Reinaldo Garcia Nastar'),
    ('claudia paola gaviria diaz', 'Claudia Paola Gaviria Diaz'),
    ('cristhian andres olarte cordoba', 'Cristhian Andres Olarte Cordoba'),
    ('cristian manuel robles', 'Cristian Manuel Robles'),
    ('danny yulieth torres castro', 'Danny Yulieth Torres Castro'),
    ('deyvy milena muñoz quenan', 'Deyvy Milena Muñoz Quenan'),
    ('diana alejandra acero carrillo', 'Diana Alejandra Acero Carrillo'),
    ('diana emilse reyes solarte', 'Diana Emilse Reyes Solarte'),
    ('diana yadira congote andrade', 'Diana Yadira Congote Andrade'),
    ('edna ximena narvaez ramirez', 'Edna Ximena Narvaez Ramirez'),
    ('eduardo cuaran tipaz', 'Eduardo Cuaran Tipaz'),
    ('elias adirvey galvis carvajal', 'Elias Adirvey Galvis Carvajal'),
    ('elver mauricio grueso vainas', 'Elver Mauricio Grueso Vainas'),
    ('fabian lopez getial', 'Fabian Lopez Getial'),
    ('favio nelson ojeda gomez', 'Favio Nelson Ojeda Gomez'),
    ('freddy alberto guinchin estrada', 'Freddy Alberto Guinchin Estrada'),
    ('gerlin duvan rodriguez portillo', 'Gerlin Duvan Rodriguez Portillo'),
    ('german dario de la cruz chavez', 'German Dario De La Cruz Chavez'),
    ('gladis yanet apraez tapias', 'Gladis Yanet Apraez Tapias'),
    ('hernan antury parra', 'Hernan Antury Parra'),
    ('hernan froilan burbano caicedo', 'Hernan Froilan Burbano Caicedo'),
    ('hernan santiago zambrano enriquez', 'Hernan Santiago Zambrano Enriquez'),
    ('holmer gutierrez urbano', 'Holmer Gutierrez Urbano'),
    ('irma yolanda obando mora', 'Irma Yolanda Obando Mora'),
    ('jaider alfonso guerra sanchez', 'Jaider Alfonso Guerra Sanchez'),
    ('jaime fernando rosero sanchez', 'Jaime Fernando Rosero Sanchez'),
    ('jeimy katerine vargas arenas', 'Jeimy Katerine Vargas Arenas'),
    ('jenny marina ortiz carlosama', 'Jenny Marina Ortiz Carlosama'),
    ('jerson david solarte perez', 'Jerson David Solarte Perez'),
    ('jesus alberto garcia muñoz', 'Jesus Alberto Garcia Muñoz'),
    ('jhan brandon riascos martinez', 'Jhan Brandon Riascos Martinez'),
    ('johana maritza morales cardenas', 'Johana Maritza Morales Cardenas'),
    ('jonathan mauricio pejendino rosero', 'Jonathan Mauricio Pejendino Rosero'),
    ('karen jackeline campaña delgado', 'Karen Jackeline Campaña Delgado'),
    ('karen liliana villota hernandez', 'Karen Liliana Villota Hernandez'),
    ('kely mabel guerrero lazo', 'Kely Mabel Guerrero Lazo'),
    ('kevin camilo galarraga cordoba', 'Kevin Camilo Galarraga Cordoba'),
    ('liceth karolina pantoja mora', 'Liceth Karolina Pantoja Mora'),
    ('lorena liseth herrera moncayo', 'Lorena Liseth Herrera Moncayo'),
    ('lorena lisseth paz chamorro', 'Lorena Lisseth Paz Chamorro'),
    ('luis jaide jamauca correa', 'Luis Jaide Jamauca Correa'),
    ('luisa fernanda cuero criollo', 'Luisa Fernanda Cuero Criollo'),
    ('magda johana sanabria tejada', 'Magda Johana Sanabria Tejada'),
    ('maria olga diaz', 'Maria Olga Diaz'),
    ('mario steban dueñas de la cruz', 'Mario Steban Dueñas De La Cruz'),
    ('mary lucy guerron madroñero', 'Mary Lucy Guerron Madroñero'),
    ('mery norbeyi castillo nupan', 'Mery Norbeyi Castillo Nupan'),
    ('michael yela valencia', 'Michael Yela Valencia'),
    ('myriam milena portillo castro', 'Myriam Milena Portillo Castro'),
    ('nasson pimentel criollo', 'Nasson Pimentel Criollo'),
    ('oswaldo alejandro narvaez araujo', 'Oswaldo Alejandro Narvaez Araujo'),
    ('raquel malua sayalpud', 'Raquel Malua Sayalpud'),
    ('ruth aleida cuaran solarte', 'Ruth Aleida Cuaran Solarte'),
    ('sonia yaneth cubillos beltran', 'Sonia Yaneth Cubillos Beltran'),
    ('wilmer moreno estrada', 'Wilmer Moreno Estrada'),
    ('yerzón duvan moreno sanchez', 'Yerzón Duvan Moreno Sanchez'),
    ('yesica obando ordoñez', 'Yesica Obando Ordoñez'),
    ('yudy andrea henao lopez', 'Yudy Andrea Henao Lopez'),
    ('yurany del pilar rodriguez ceballos', 'Yurany Del Pilar Rodriguez Ceballos'),
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
            'marca': forms.Select(attrs={'class': 'form-control', 'placeholder': 'Marca'}),
            'modelo': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Modelo'}),
            'color': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Color'}),
            'cantidad': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Cantidad'}),

            'sucursal': forms.Select(attrs={'class': 'form-control'}, choices=SUCURSAL),
            'clasificacion': forms.Select(attrs={'class': 'form-control'}, choices=CLASIFICACION),

            'valor': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Valor','inputmode': 'numeric','autocomplete': 'off'}),
            'fecha_compra': forms.DateInput(format='%Y-%m-%d',attrs={'class': 'form-control', 'type': 'date'}),

            'recursos': forms.Select(attrs={'class': 'form-control'}, choices=RECURSOS),
            'estado': forms.Select(attrs={'class': 'form-control'}, choices=ESTADO),

            'cargo_funcionario': forms.Select(attrs={'class': 'form-control'}, choices=CARGO_FUNCIONARIO),
            'funcionario_responsable': forms.Select(attrs={'class': 'form-control'}, choices=FUNCIONARIO_RESPONSABLE),
            'nit': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Nit'}),
            'proveedor': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Proveedor'}),

            'observaciones': forms.Textarea(attrs={'class': 'form-control', 'rows': 3}),
        }

    # -------------------------
    # NORMALIZACIÓN (opcional pero recomendado)
    # upper = mayusculas
    # lower = minusculas
    # capitalize = primera mayuscula
    # -------------------------

    # -------------------------
    # NORMALIZACIÓN DE CAMPOS
    # -------------------------

    def clean_marca(self):
        return normalizar(self.cleaned_data.get("marca"))

    def clean_modelo(self):
        return normalizar(self.cleaned_data.get("modelo"))

    def clean_color(self):
        return normalizar(self.cleaned_data.get("color"))

    def clean_proveedor(self):
        return normalizar(self.cleaned_data.get("proveedor"))

    def clean_funcionario_responsable(self):
        return normalizar(self.cleaned_data.get("funcionario_responsable"))
        #nombre = self.cleaned_data["funcionario_responsable"]
        #return " ".join([p.capitalize() for p in nombre.lower().split()])

    def clean_valor(self):
        # Obtenemos el valor crudo del formulario (string con posibles puntos)
        valor_raw = self.data.get("valor", "").strip()
        
        # Quitamos los puntos de miles
        valor_sin_puntos = valor_raw.replace(".", "")
        
        # Validamos que no esté vacío
        if not valor_sin_puntos:
            raise forms.ValidationError("El valor es obligatorio.")
        
        # Validamos que solo contenga dígitos (más seguro que solo try/except)
        if not valor_sin_puntos.isdigit():
            raise forms.ValidationError("El valor debe contener solo números enteros.")
        
        # Convertimos a entero
        try:
            valor = int(valor_sin_puntos)
        except ValueError:
            # Este except ya no debería ejecutarse nunca gracias a isdigit(), pero por seguridad
            raise forms.ValidationError("El valor ingresado no es válido.")
        
        # Validación de negocio: no negativo
        if valor < 0:
            raise forms.ValidationError("El valor no puede ser negativo.")
        
        # Opcional: si quieres un valor mínimo razonable
        # if valor == 0:
        #     raise forms.ValidationError("El valor debe ser mayor a cero.")
        
        return valor

    def clean(self):
        cleaned_data = super().clean()
        codigo = cleaned_data.get("codigo")
        sucursal = cleaned_data.get("sucursal")

        # Reglas de negocio
        reglas = {
            "ag01-fdo": "mocoa",
            "ag01-nmt": "mocoa",
            "ag02-fdo": "sibundoy",
            "ag02-nmt": "sibundoy",
            "ag03-fdo": "puerto asis",
            "ag03-nmt": "puerto asis",
            "ag04-fdo": "hormiga",
            "ag04-nmt": "hormiga",
            "ag05-fdo": "orito",
            "ag05-nmt": "orito",
            "ag06-fdo": "puerto leguizamo",
            "ag06-nmt": "puerto leguizamo",
            "ag07-fdo": "dorada",
            "ag07-nmt": "dorada",
            "ag08-fdo": "villagarzon",
            "ag08-nmt": "villagarzon",
        }

        # Validar solo si ambos campos vienen seleccionados
        #if codigo in reglas and sucursal != reglas[codigo]:
        if codigo and sucursal and sucursal != reglas.get(codigo):
            self.add_error(
                "sucursal",
                f"El código {codigo} solo permite la sucursal {reglas[codigo]}."
            )

        return cleaned_data

    # Muy importante: definir los formatos aceptados
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['fecha_compra'].input_formats = ['%Y-%m-%d']
