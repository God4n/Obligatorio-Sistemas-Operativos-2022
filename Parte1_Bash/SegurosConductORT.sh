#!/bin/bash

mkdir logs 2>/dev/null #Crea carpeta para almacenar registros
touch logs/registro_$(date +%F_%T).log #Genera archivo log con la fecha en su nombre

#Funcion para: Registrar Matriculas
Registrar_Matricula(){
	echo; echo "Registrar Matricula"
	echo "Funcion 1"; echo;
	
}

#Funcion para: Ver Matriculas Registradas
Ver_Matriculas_Registradas(){
	echo; echo "Ver Matriculas Registradas"
	echo "Funcion 2"; echo;
	
}

#Funcion para: Buscar Matriculas por Usuario
Buscar_Matriculas_por_Usuario(){
	echo; echo "Buscar Matriculas por Usuario"
	echo "Funcion 3"; echo;
	
}

#Funcion para: Cambiar Permiso de Modificacion
Cambiar_Permiso_de_Modificacion(){
	echo; echo "Cambiar Permiso de Modificacion"
	echo "Funcion 4"; echo;
	
}

while [ true ]; do
	clear
	figlet --gay -t -k "Seguros ConductORT" 2>/dev/null #2>/dev/null -> si no tiene figlet instalado no reporta errores
	echo; echo "Seguros ConductORT"; echo

	echo "1) Registrar Matricula"
	echo "2) Ver Matriculas Registradas"
	echo "3) Buscar Matriculas por Usuario"
	echo "4) Cambiar Permiso de Modificacion"
	echo "5) Salir"; echo

	read -p 'Seleccione una opcion: ' x
	case $x in 
		'1')	Registrar_Matricula
			read -sp "Presione [ENTER] para continuar"
			;;
		'2')	Ver_Matriculas_Registradas
			read -sp "Presione [ENTER] para continuar"
			;;
		'3') 	Buscar_Matriculas_por_Usuario
			read -sp "Presione [ENTER] para continuar"
			;;
		'4')	Cambiar_Permiso_de_Modificacion
			read -sp "Presione [ENTER] para continuar"
			;;
		'5')	echo "Saliendo..."; echo
			break
			;;
		*)	echo "No es una opcion valida"; echo
			read -sp "Presione [ENTER] para continuar"
			;;
	esac
done
