document.addEventListener("DOMContentLoaded", function () {

    const clasificacion = document.getElementById("id_clasificacion");
    const marca = document.getElementById("id_marca");

    if (!clasificacion || !marca) return;

    const marcaActual = (marca.dataset.current || "").toLowerCase();

     const marcasPorClasificacion = {
        "adornos": [
            "Alkosto Home","Artesanías de Colombia","Casaideas","Colombian Design",
            "Dollarcity","Éxito Hogar","Falabella Home","H&M Home","Homecenter",
            "IKEA","Iluminatta","La Casa de las Velas","Manos de Oro","Miniso",
            "Mola Sasa","Nativos Colombia","Panamericana","Pepe Ganga Home",
            "Raíces Ancestrales","Rimax","Tierra Querida","Velas Santa Fe",
            "Wayuu Decor","Zara Home","No aplica"
        ],
        "electrodomesticos": [
            "Acros","AEG","Aiwa","Ariston","Aspes","Beko","Bissell","Black+Decker",
            "Bosch","Candy","Carrier","Caixun","Cecotec","Challenger","Corbero",
            "Daewoo","Daikin","Dyson","Electrolux","Eureka","Fagor","Frigidaire",
            "Fujitsu","General Electric","Gree","Haceb","Haier","Hamilton Beach",
            "Hisense","Hitachi","Hoover","Hotpoint","Hyundai","Imusa","iRobot",
            "Kalley","Karcher","KitchenAid","LG","Mabe","Maytag","Midea","Miele",
            "Ninja","Oster","Panasonic","Philips","PowerXL","Remington","Roborock",
            "Rowenta","Russell Hobbs","Samsung","Samurai","Sharp","Siemens","Smeg",
            "Sunbeam","Taurus","Tefal","Teka","Trane","Ufesa","Westinghouse",
            "Whirlpool","York","Zanussi","No aplica"
        ],
        "equipo de computo": [
            "Acer","Alienware","AMD","AOC","Apple","Asrock","Asus","Benq","Biostar",
            "Canon","Compaq","Corsair","Crucial","Dell","D-Link","Epson","Fujitsu",
            "Gateway","Genius","Gigabyte","HP","Huawei","IBM","Intel","Kingston",
            "Lanix","Lenovo","LG","Logitech","Microsoft","MSI","Nvidia","Philips",
            "Razer","Ricoh","Samsung","Seagate","Sony Vaio","Toshiba",
            "ViewSonic","Western Digital","Xiaomi","No aplica"
        ],  
        "equipo de comunicacion y audiovisual": [
            "Aiwa","AKG","Behringer","BenQ","Bose","Cisco","Crestron","Epson",
            "Harman Kardon","Hisense","InFocus","JBL","Kalley","Kenwood","LG",
            "Logitech","Marshall","Motorola","NEC","Optoma","Panasonic","Philips",
            "Poly","QSC","Samsung","Sennheiser","Sharp","Shure","Sony","TCL",
            "ViewSonic","Yamaha","No aplica"
        ],
        "menaje": [
            "Arcopal","Brabantia","Casa Ideas","Corelle","Corona","Cuisinart",
            "Duralex","Ekco","Fackelmann","Home Elements","Ikea","Imusa",
            "Joseph Joseph","KitchenAid","Lock&Lock","Luminarc","Magefesa",
            "Mainstays","Metaltex","OXO","Paderno","Pyrex","Rimax","Rubbermaid",
            "Tescoma","Tefal","Tramontina","Tupperware","Victorinox",
            "Wilton","No aplica"
        ],
        "muebles y enseres": [
            "Actiu","Alkosto","Ashley Furniture","Brabantia","Comodísimos","Curver",
            "El Dorado","Falabella","Forma 5","Haworth","Herman Miller","Homecenter",
            "Home Elements","IKEA","Linea Italia","Maderkit","Muebles Jamar",
            "Muebles Rimo","Ofimuebles","Ofix","Organitodo","Paraíso",
            "Rimax","Pullman","Restonic","Rubbermaid","RTA Muebles",
            "Sillas y Sillas","Spring","Steelcase","Sterilite","Tugó",
            "No aplica"
        ],
        "otros": [
            "No aplica"
        ],
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
