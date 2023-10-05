#!/bin/bash

while getopts ":at" option; do
  case $option in
    a) 
      echo "Bienvenido a la guía rápida de Agile, para continuar seleccione un tema:"
      echo "1. SCRUM"
      echo "2. X.P."
      echo "3. Kanban"
      echo "4. Crystal"
      
      read -p "Seleccione un tema (1/2/3/4): " tema
      case $tema in
        1)
          seccion="SCRUM"
          ;;
        2)
          seccion="X.P."
          ;;
        3)
          seccion="Kanban"
          ;;
        4)
          seccion="Crystal"
          ;;
        *)
          echo "Selección no válida. Saliendo."
          exit 1
          ;;
      esac
      
      echo "Usted está en la sección $seccion, seleccione la opción que desea utilizar:"
      echo "1. Agregar información"
      echo "2. Buscar"
      echo "3. Eliminar información"
      echo "4. Leer base de información"
      
      read -p "Seleccione una opción (1/2/3/4): " opcion
      case $opcion in
          1)
            read -p "Ingrese el concepto: " concepto
            read -p "Ingrese la definición: " definicion

            echo "[$concepto] .- $definicion" >> "Informacion/$option/$seccion/$seccion.inf"
            echo "Información agregada correctamente."
            ;;
          2)
            read -p "Ingrese el identificador: " identificador

            if grep -q "$identificador" "Informacion/$option/$seccion/$seccion.inf"; then
              echo "Resultado de la búsqueda:"
              grep "$identificador" "Informacion/$option/$seccion/$seccion.inf"
            else
              echo "Elemento no encontrado en el archivo."
            fi
            ;;
          3)
            read -p "Ingrese el identificador del concepto a eliminar: " identificador

            if sed -i "/\[$identificador\]/d" "Informacion/$option/$seccion/$seccion.inf"; then
              echo "Concepto eliminado correctamente."
            else
              echo "El concepto no fue encontrado en el archivo."
            fi
            ;;
          4)if [ -e "Informacion/$option/$seccion/$seccion.inf" ]; then
           	 cat "Informacion/$option/$seccion/$seccion.inf"
	    fi
            ;;
          *)
            echo "Opción no válida. Saliendo."
            exit 1
            ;;
      esac
      ;;
    t) 
      echo "Bienvenido a la guía rápida de metodologías tradicionales, para continuar seleccione un tema:"
      echo "1. Cascada"
      echo "2. Espiral"
      echo "3. Modelo V"
      
      read -p "Seleccione un tema (1/2/3): " tema
      case $tema in
        1)
          seccion="Cascada"
          ;;
        2)
          seccion="Espiral"
          ;;
        3)
          seccion="Modelo V"
          ;;
        *)
          echo "Selección no válida. Saliendo."
          exit 1
          ;;
      esac
      
      echo "Usted está en la sección $seccion, seleccione la opción que desea utilizar:"
      echo "1. Agregar información"
      echo "2. Buscar"
      echo "3. Eliminar información"
      echo "4. Leer base de información"
      ;;
      
    \?) 
      echo "Opción no válida: -$OPTARG. Utilice -a para Agile o -t para metodologías tradicionales."
      exit 1
      ;;
  esac
done

shift $((OPTIND-1))

