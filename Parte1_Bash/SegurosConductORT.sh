#!/bin/bash

mkdir logs 2>/dev/null #Crea carpeta para almacenar registros
log_file=logs/registro_$(date +%F_%T).log #Variable para referenciar al archivo log 
touch $logFile #Genera archivo log con la fecha en su nombre

#Funcion para: Registrar Matriculas
Registrar_Matricula(){
	echo; echo "[+] Registrar Matricula"

	#Pedir datos
	read -p "Ingrese la matricula: " matricula
	read -p "Ingrese la cedula del responsable: " cedula
	read -p "Ingrese la fecha de vencimiento del seguro (YYYY-MM-DD): " fecha
	echo -e "$matricula | $cedula | $fecha\n"

	####### [falta verificar datos y calcular estado de vencimiento] #######
	echo -e "Operacion exitosa!"

	#Guarda matricula en el archivo matriculas.txt
	echo "$matricula | $cedula | $fecha" >> matriculas.txt
	
	#Registrar en el log
	echo -e "Operacion $(date +%T)\nRegistrar Matricula\n[ $matricula | $cedula | $fecha ]\n" >> $log_file
}

#Funcion para: Ver Matriculas Registradas
Ver_Matriculas_Registradas(){
	echo; echo "[+] Ver Matriculas Registradas"
	echo -e "Matricula | Cedula | Estado" | column -t
	cat matriculas.txt | column -t 
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
			;;
		'2')	Ver_Matriculas_Registradas
			;;
		'3') 	Buscar_Matriculas_por_Usuario
			;;
		'4')	Cambiar_Permiso_de_Modificacion
			;;
		'5')	echo "Saliendo..."; echo
			break
			;;
		*)	echo "No es una opcion valida"; echo
			;;
	esac
	echo; read -sp "Presione [ENTER] para continuar"
done
