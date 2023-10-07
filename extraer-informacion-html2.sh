#!/bin/bash

# Nombre del archivo HTML
archivo_html="index.html"

# Leer el contenido del archivo HTML
html_content=$(<"$archivo_html")

# Usar expresiones regulares para extraer información

# Aquí tienes los comentarios para cada expresión regular:

# Expresión regular: <\w+>

# Comentario:

#     Extrae cualquier etiqueta HTML, es decir, cualquier elemento que comience con un signo menor (<) y termine con un signo mayor (>).

# Explicación:

#     La expresión regular <\w+> utiliza el metacarácter \w para indicar que cualquier carácter alfanumérico o guión bajo es válido. El carácter + indica que el metacarácter \w debe repetirse una o más veces.

# Expresión regular: id=\"[^\"]+\"

# Comentario:

#     Extrae el valor del atributo id de una etiqueta HTML. El valor del atributo id está encerrado entre comillas dobles (").

# Explicación:

#     La expresión regular id=\"[^\"]+\" utiliza el metacarácter \w para indicar que cualquier carácter alfanumérico o guión bajo es válido. El carácter + indica que el metacarácter \w debe repetirse una o más veces. Los caracteres "' indican que el valor del atributo id está encerrado entre comillas dobles.

# Expresión regular: class=\"[^\"]+\"

# Comentario:

#     Extrae el valor del atributo class de una etiqueta HTML. El valor del atributo class está encerrado entre comillas dobles (").

# Explicación:

#     La expresión regular class=\"[^\"]+\" es similar a la expresión regular id=\"[^\"]+\", pero se utiliza para extraer el valor del atributo class.



# Etiquetas
etiquetas=$(grep -oP '<\w+>' <<< "$html_content")

# IDs
ids=$(grep -oP 'id=\"[^\"]+\"' <<< "$html_content")

# Clases
clases=$(grep -oP 'class=\"[^\"]+\"' <<< "$html_content")

# Mostrar los valores extraídos
echo "Etiquetas: $etiquetas"
echo "IDs: $ids"
echo "Clases: $clases"

# Función para extraer el valor de un atributo HTML
function extract_html_attribute() {
    # $1 es el contenido HTML
    # $2 es el nombre del atributo
    local html_content="$1"
    local attribute_name="$2"

    # Usar expresiones regulares para extraer el valor del atributo
    if [[ $html_content =~ $attribute_name=\"([^\"]*)\" ]]; then
        echo "${BASH_REMATCH[1]}"
    else
        echo ""
    fi
}

# Expresiones regulares
#
# '<\w+>' : Extrae cualquier etiqueta HTML, es decir, cualquier elemento
#            que comience con un signo menor (<) y termine con un signo
#            mayor (>).
#
# 'id=\"[^\"]+\"' : Extrae el valor del atributo `id` de una etiqueta
#                    HTML. El valor del atributo `id` está encerrado entre
#                    comillas dobles (").
#
# 'class=\"[^\"]+\"' : Extrae el valor del atributo `class` de una etiqueta
#                      HTML. El valor del atributo `class` está encerrado
#                      entre comillas dobles (").

# Extraer la información del archivo HTML
header_id=$(extract_html_attribute "$html_content" "header_id")
header_h1=$(extract_html_attribute "$html_content" "header_h1")
nav_id=$(extract_html_attribute "$html_content" "nav_id")
nav_items_str=$(extract_html_attribute "$html_content" "nav_items")
main_id=$(extract_html_attribute "$html_content" "main_id")
filtro_modelo_id=$(extract_html_attribute "$html_content" "filtro_modelo_id")
filtro_modelo_options_str=$(extract_html_attribute "$html_content" "filtro_modelo_options")
filtro_precio_id=$(extract_html_attribute "$html_content" "filtro_precio_id")
filtro_precio_options_str=$(extract_html_attribute "$html_content" "filtro_precio_options")
sections_str=$(extract_html_attribute "$html_content" "sections")
footer_id=$(extract_html_attribute "$html_content" "footer_id")
footer_text=$(extract_html_attribute "$html_content" "footer_text")

# Dividir las listas de cadenas en matrices
IFS=', ' read -ra nav_items <<< "$nav_items_str"
IFS=', ' read -ra filtro_modelo_options <<< "$filtro_modelo_options_str"
IFS=', ' read -ra filtro_precio_options <<< "$filtro_precio_options_str"
IFS=', ' read -ra sections <<< "$sections_str"

# Mostrar los valores extraídos
echo "header_id: $header_id"
echo "header_h1: $header_h1"
echo "nav_id: $nav_id"
echo "nav_items: ${nav_items[*]}"
echo "main_id: $main_id"
echo "filtro_modelo_id: $filtro_modelo_id"
echo "filtro_modelo_options: ${filtro_modelo_options[*]}"
echo "filtro_precio_id: $filtro_precio_id"
echo "filtro_precio_options: ${filtro_precio_options[*]}"
echo "sections: ${sections[*]}"
echo "footer_id: $footer_id"
echo "footer_text: $footer_text"
