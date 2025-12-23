document.addEventListener("DOMContentLoaded", function () {

    const clasificacion = document.getElementById("id_clasificacion");
    const marca = document.getElementById("id_marca");

    const marcasPorClasificacion = {
        "electrodomesticos": [
            "Acros","AEG","Aiwa","Aspes","Black+Decker","Bosch","Caixun","Candy",
            "Challenger","Corbero","Dyson","Electrolux","Fujitsu",
            "General Electric","Haceb","Hisense","Hitachi","Hyundai","Imusa",
            "Kalley","LG","Mabe","Maytag","Miele","N/R","Ninja","Oster",
            "Panasonic","Philips","PowerXL","Remington","Rowenta","Samsung",
            "Samurai","Sharp","Siemens","Sony","Taurus","Tefal","Teka","TLC",
            "Whirlpool"
        ],

        "equipo de computo": [
            "Acer","Alienware","AMD","AOC","Apple","Asrock","Asus","Benq",
            "Biostar","Canon","Compaq","Dell","D-Link","Epson","Genius",
            "Hitachi","HP","IBM","Intel","Janus","JVC","Kyocera","Lanix",
            "Lenovo","Maxtor","MSI","Nvidia","Packard Bell","Ricoh","Samsung",
            "Seagate","Siemens","Sony Vaio","Toshiba","Western Digital"
        ],

        "equipo de comunicacion y audiovisual": [
            "Aiwa","Bose","DjPro","Epson","JBL","Kalley","LG","Panasonic",
            "Sony","Yamaha"
        ]
    };

    clasificacion.addEventListener("change", function () {
        const valor = this.value;

        // Limpiar marcas
        marca.innerHTML = '<option value="">Seleccionar</option>';

        if (marcasPorClasificacion[valor]) {
            marcasPorClasificacion[valor].forEach(function (item) {
                const option = document.createElement("option");
                option.value = item;
                option.textContent = item;
                marca.appendChild(option);
            });
        }
    });

});
