document.addEventListener("DOMContentLoaded", function () {

    const clasificacion = document.getElementById("id_clasificacion");
    const marca = document.getElementById("id_marca");

    if (!clasificacion || !marca) return;

    const marcaActual = (marca.dataset.current || "").toLowerCase();

    const marcasPorClasificacion = {
        "electrodomesticos": ["Acros","AEG","Aiwa","Aspes","Bosch","Haceb","LG","Samsung"],
        "equipo de computo": ["Acer","Dell","HP","Lenovo","Apple","Asus"],
        "equipo de comunicacion y audiovisual": ["JBL","Sony","LG","Panasonic"]
    };

    function cargarMarcas(clasif, seleccionada) {
        marca.innerHTML = '<option value="">Seleccionar</option>';

        if (!marcasPorClasificacion[clasif]) return;

        marcasPorClasificacion[clasif].forEach(item => {
            const opt = document.createElement("option");
            opt.value = item.toLowerCase();
            opt.textContent = item;

            if (opt.value === seleccionada) {
                opt.selected = true;
            }

            marca.appendChild(opt);
        });
    }

    // 🔥 CARGA AUTOMÁTICA EN EDICIÓN
    cargarMarcas(clasificacion.value, marcaActual);

    clasificacion.addEventListener("change", function () {
        cargarMarcas(this.value, "");
    });

});
