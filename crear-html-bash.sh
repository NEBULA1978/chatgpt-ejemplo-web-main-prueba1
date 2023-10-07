#!/bin/bash

# Definir variables por defecto
header_id="header"
header_h1="Alquiler de bicicletas"
nav_id="nav"
nav_items=("Bicicletas" "Camisetas" "Ubicación" "Reservas")
main_id="main"
filtro_modelo_id="filtro-modelo"
filtro_modelo_options=("Todos los modelos" "Bicicleta de montaña" "Bicicleta de carretera" "Bicicleta de paseo" "Camisetas de manga corta y larga")
filtro_precio_id="filtro-precio"
filtro_precio_options=("Todos los precios" "Hasta \$5" "Hasta \${10}" "Hasta \${15}")
sections=("bicicletas" "camisetas" "ubicacion" "reservas")
footer_id="footer"
footer_text="Copyright © 2021 Bicycle Rentals"

# Función para mostrar menú de personalización
function mostrar_menu() {
    clear
    echo "Menú de Personalización HTML"
    echo "1. Cambiar valores predeterminados"
    echo "2. Generar HTML con valores predeterminados"
    echo "3. Salir"
    read -p "Seleccione una opción: " opcion
    case $opcion in
        1)
            personalizar_variables
            ;;
        2)
            generar_html
            ;;
        3)
            exit
            ;;
        *)
            echo "Opción no válida. Intente nuevamente."
            ;;
    esac
}

# Función para personalizar variables
function personalizar_variables() {
    echo "Personalice las variables (deje en blanco para mantener los valores predeterminados):"
    read -p "ID para el encabezado ($header_id): " nuevo_header_id
    if [[ -n "$nuevo_header_id" ]]; then
        header_id="$nuevo_header_id"
    fi

    read -p "Contenido para el encabezado h1 ($header_h1): " nuevo_header_h1
    if [[ -n "$nuevo_header_h1" ]]; then
        header_h1="$nuevo_header_h1"
    fi

    read -p "ID para la barra de navegación ($nav_id): " nuevo_nav_id
    if [[ -n "$nuevo_nav_id" ]]; then
        nav_id="$nuevo_nav_id"
    fi

    read -p "Ítems de navegación separados por comas ($nav_items): " nuevo_nav_items
    if [[ -n "$nuevo_nav_items" ]]; then
        IFS=',' read -ra nuevo_nav_items_array <<< "$nuevo_nav_items"
        nav_items=("${nuevo_nav_items_array[@]}")
    fi

    read -p "ID para el contenido principal ($main_id): " nuevo_main_id
    if [[ -n "$nuevo_main_id" ]]; then
        main_id="$nuevo_main_id"
    fi

    read -p "ID para el filtro por modelo ($filtro_modelo_id): " nuevo_filtro_modelo_id
    if [[ -n "$nuevo_filtro_modelo_id" ]]; then
        filtro_modelo_id="$nuevo_filtro_modelo_id"
    fi

    read -p "Opciones del filtro por modelo separadas por comas ($filtro_modelo_options): " nuevo_filtro_modelo_options
    if [[ -n "$nuevo_filtro_modelo_options" ]]; then
        IFS=',' read -ra nuevo_filtro_modelo_options_array <<< "$nuevo_filtro_modelo_options"
        filtro_modelo_options=("${nuevo_filtro_modelo_options_array[@]}")
    fi

    read -p "ID para el filtro por precio ($filtro_precio_id): " nuevo_filtro_precio_id
    if [[ -n "$nuevo_filtro_precio_id" ]]; then
        filtro_precio_id="$nuevo_filtro_precio_id"
    fi

    read -p "Opciones del filtro por precio separadas por comas ($filtro_precio_options): " nuevo_filtro_precio_options
    if [[ -n "$nuevo_filtro_precio_options" ]]; then
        IFS=',' read -ra nuevo_filtro_precio_options_array <<< "$nuevo_filtro_precio_options"
        filtro_precio_options=("${nuevo_filtro_precio_options_array[@]}")
    fi

    read -p "Nombres de secciones separados por comas ($sections): " nuevo_sections
    if [[ -n "$nuevo_sections" ]]; then
        IFS=',' read -ra nuevo_sections_array <<< "$nuevo_sections"
        sections=("${nuevo_sections_array[@]}")
    fi

    read -p "ID para el pie de página ($footer_id): " nuevo_footer_id
    if [[ -n "$nuevo_footer_id" ]]; then
        footer_id="$nuevo_footer_id"
    fi

    read -p "Texto para el pie de página ($footer_text): " nuevo_footer_text
    if [[ -n "$nuevo_footer_text" ]]; then
        footer_text="$nuevo_footer_text"
    fi

    mostrar_menu
}

# Función para generar HTML con variables personalizadas
function generar_html() {
    # Inicio del archivo HTML
    html_content="<html>
<head>
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
    <title>Alquiler de bicicletas</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        #$header_id {
            background-color: #8B0000;
            color: white;
            text-align: center;
            padding: 10px;
        }

        #$nav_id {
            background-color: #FFA07A;
            text-align: center;
        }

        #$nav_id ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

        #$nav_id li {
            display: inline-block;
            margin-right: 10px;
        }

        #$nav_id a {
            color: black;
            text-decoration: none;
            padding: 10px;
        }

        #$nav_id a:hover {
            background-color: #ff7f50;
        }

        #$main_id {
            margin: 0 auto;
            max-width: 800px;
            padding: 10px;
        }
"
    # Generar estilos y secciones dinámicas
    for section in "${sections[@]}"; do
        html_content+="
        section#$section {
            margin-bottom: 20px;
            padding: 20px;
            background-color: #ffb6c1;
        }
"
    done

    html_content+="
        section h2 {
            margin-top: 0;
        }

        #$footer_id {
            background-color: #8B0000;
            color: white;
            text-align: center;
            padding: 10px;
            max-width: 800px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <header>
        <h1>$header_h1</h1>
    </header>
    <nav>
        <ul>
"
    # Generar elementos de navegación dinámicos
    for item in "${nav_items[@]}"; do
        html_content+="            <li><a href=\"#$item\">$item</a></li>
"
    done

    html_content+="
        </ul>
    </nav>
    <main>
        <!-- Filtro por modelo -->
        <select id=\"$filtro_modelo_id\">
"
    # Generar opciones del filtro por modelo dinámicas
    for option in "${filtro_modelo_options[@]}"; do
        html_content+="            <option value=\"$option\">$option</option>
"
    done

    html_content+="
        </select>

        <!-- Filtro por precio -->
        <select id=\"$filtro_precio_id\">
"
    # Generar opciones del filtro por precio dinámicas
    for option in "${filtro_precio_options[@]}"; do
        html_content+="            <option value=\"$option\">$option</option>
"
    done

    html_content+="
        </select>
"

    # Generar secciones dinámicas
    for section in "${sections[@]}"; do
        html_content+="
        <section id=\"$section\">
            <h2>${section^} disponibles</h2>
            <div id=\"${section}-contenedor\"></div>
        </section>
"
    done

    html_content+="
    </main>
    <footer>
        <p>$footer_text</p>
    </footer>
</body>
</html>
"

    # Nombre del archivo HTML
    archivo_html="index.html"

    # Crear el archivo HTML
    echo "$html_content" > "$archivo_html"

    # Comprobar si se creó correctamente
    if [ -e "$archivo_html" ]; then
        echo "El archivo $archivo_html se ha creado exitosamente."
    else
        echo "Hubo un error al crear el archivo $archivo_html."
    fi
}

# Mostrar el menú inicial
mostrar_menu
