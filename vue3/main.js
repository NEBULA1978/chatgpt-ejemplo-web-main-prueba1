// main.js
const bicicletasContenedor = document.getElementById("bicicletas-contenedor");

// Obtener los datos de las bicicletas
fetch("data.json")
    .then(response => response.json())
    .then(data => {
        // Almacenar los datos en una variable global
        window.bicicletas = data.bicicletas;
        // Crear una instancia de Vue
        new Vue({
            el: "#bicicletas-contenedor", // Monta Vue en el elemento con el id "bicicletas-contenedor"
            data: {
                bicicletas: data.bicicletas,
                filtroModelo: "",
                filtroPrecio: 0
            },
            methods: {
                // Función para mostrar las bicicletas en la página
                mostrarBicicletas: function () {
                    // Lógica para mostrar las bicicletas aquí
                    // Puedes acceder a los datos con this.bicicletas, this.filtroModelo, this.filtroPrecio
                }
            },
            mounted: function () {
                // Llama a la función mostrarBicicletas una vez que Vue se haya montado
                this.mostrarBicicletas();
            }
        });
    })
    .catch(error => console.error(error));
