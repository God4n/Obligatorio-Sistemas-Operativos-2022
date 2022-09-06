#!/bin/bash

while [ true ]
do
	echo; echo "Seguros ConductORT"; echo
	
	echo "1) Registrar Matricula"
	echo "2) Ver Matriculas Registradas"
	echo "3) Buscar Matriculas por Usuario"
	echo "4) Cambiar Permiso de Modificacion"
	echo "5) Salir"; echo

	read -p 'Seleccione una opcion: ' x
	case $x in 
		'1')	echo; #salto de linea
			echo "Registrar Matricula"
			;;
		'2')	echo; #salto de linea
			echo "Ver Matriculas Registradas"
			;;
		'3') 	echo; #salto de linea
			echo "Buscar Matriculas por Usuario"
			;;
		'4')	echo; #salto de linea
			echo "Cambiar Permiso de Modificacion"
			;;
		'5')	echo "Saliendo..."; echo
			break
			;;
	esac
done
