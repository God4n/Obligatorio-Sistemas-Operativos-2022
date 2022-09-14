#!/bin/bash

mkdir logs 2>/dev/null #Crea carpeta para almacenar registros
log_file=logs/registro_$(date +%F_%T).log #Variable para referenciar al archivo log 

#Funcion para: Registrar Matriculas
Registrar_Matricula(){
	echo -e "\n[+] Registrar Matricula"

	#Pedir matricula
	while [ true ]; do
		read -p "Ingrese la matricula: " matricula
		matricula=$(echo $matricula | tr '[:lower:]' '[:upper:]')
		#Verificar matricula
		if [ $(echo $matricula | grep -E "\bS[A-Z]{2}-[0-9]{4}\b" -c) -eq 1 ]; then break; fi
		echo -e "Matricula Invalida\n"
	done
	
	#Pedir cedula
	while [ true ]; do
		read -p "Ingrese la cédula del responsable: " cedula
		#Verificar cedula
		if [ $(echo $cedula | grep -E "\b[0-9]{1}.[0-9]{3}.[0-9]{3}-[0-9]{1}\b" -c) -eq 1 ]; then break; fi
		echo -e "Cédula Invalida\n"
	done

	#Pedir fecha
	while [ true ]; do
		read -p "Ingrese la fecha de vencimiento del seguro (YYYY-MM-DD): " fecha
		#Verificar fecha
		if [ $(echo $fecha | grep -E "\b[0-9]{4}-([1-9]|0[1-9]|1[12])-([1-9]|[012][0-9]|3[01])\b" -c) -eq 1 ]; then break; fi
		echo -e "Fecha Invalida\n"
	done

	echo -e "$matricula | $cedula | $fecha\n"
	echo -e "Operacion exitosa!"

	#Guarda matricula en el archivo matriculas.txt
	echo "$matricula | $cedula | $fecha" >> matriculas.txt
	
	#Registrar en el log
	echo -e "Operacion $(date +%T)\nRegistrar Matricula\n[ $matricula | $cedula | $fecha ]\n" >> $log_file
}

#Funcion para: Ver Matriculas Registradas
Ver_Matriculas_Registradas(){
	echo -e "\n[+] Ver Matriculas Registradas"
	echo -e "Matricula | Cedula | Estado" | column -t
	####### [calcular estado de vencimiento] #######
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
	echo -e "\nSeguros ConductORT\n"

	echo "1) Registrar Matricula"
	echo "2) Ver Matriculas Registradas"
	echo "3) Buscar Matriculas por Usuario"
	echo "4) Cambiar Permiso de Modificacion"
	echo -e "5) Salir\n"

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
		'5')	echo -e "Saliendo...\n"
			break
			;;
		*)	echo -e "No es una opcion valida\n"
			;;
	esac
	echo; read -sp "Presione [ENTER] para continuar"
done
