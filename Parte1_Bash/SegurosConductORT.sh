#!/bin/bash

mkdir logs 2>/dev/null #Crea carpeta para almacenar registros
log_file=logs/registro_$(date +%F_%T).log #Variable para referenciar al archivo log 
# ¿Crear archivo?
touch $log_file #Genera archivo log con la fecha en su nombre

#Funcion para: Registrar Matriculas
Registrar_Matricula(){
	echo -e "\n[+] Registrar Matricula"

	#Pedir matricula
	while [ true ]; do
		read -p "Ingrese la matricula: " matricula
		matricula=$(echo $matricula | tr '[:lower:]' '[:upper:]')
		#Verificar matricula
		IFS='-' read -ra arr_matricula <<< "$matricula" #Creamos array de la matricula todo raro
		letras=${arr_matricula[0]}
		numeros=${arr_matricula[1]}
		if [ ${#arr_matricula[@]} -eq 2 -a ${#letras} -eq 3 -a ${#numeros} -eq 4 ]; then #Verifica tamaños
			if [ ! $(echo $letras | grep [0-9] | wc -l) -gt 0 -a $(echo $letras | grep "\bS\w*\b" | wc -l) -eq 1 ]; then #Verifica no tenga digitos y sea de montevideo en las letras
				if [ ! $(echo $numeros | grep "[A-Z]" | wc -l) -gt 0  ]; then #Verifica no tenga letras en la parte numerica
					break 
				fi
			fi
		fi
		echo -e "Matricula Invalida\n"
	done
	
	#Pedir cedula
	while [ true ]; do
		read -p "Ingrese la cédula del responsable: " cedula
		cedula=$(echo $cedula | tr '[:lower:]' '[:upper:]')
		#Verificar cedula
		IFS='-' read -ra arr_cedula <<< "$cedula" #Creamos array de la cedula todo raro
		digitos=${arr_cedula[0]}
		verificador=${arr_cedula[1]}
		if [ ${#arr_cedula[@]} -eq 2 -a ${#digitos} -eq 9 -a ${#verificador} -eq 1 ]; then #Verifica tamaños
			IFS='.' read -ra arr_ced <<< "$digitos" #Creamos array de los digitos de la cedula todo raro
			primer=${arr_ced[0]}
			segundos=${arr_ced[1]}
			terceros=${arr_ced[2]}
			if [ ${#arr_ced[@]} -eq 3 -a ${#primer} -eq 1 -a ${#segundos} -eq 3 -a ${#terceros} -eq 3 ]; then #Verifica tamaños
				break
			fi
		fi
		echo -e "Cédula Invalida\n"
	done

	#Pedir fecha
	while [ true ]; do
		read -p "Ingrese la fecha de vencimiento del seguro (YYYY-MM-DD): " fecha
		fecha=$(echo $fecha | tr '[:lower:]' '[:upper:]')
		#Verificar fecha
		IFS='-' read -ra arr_fecha <<< "$fecha" #Creamos array de la fecha todo raro
		ano=${arr_fecha[0]}
		mes=${arr_fecha[1]}
		dia=${arr_fecha[2]}
		if [ ${#arr_fecha[@]} -eq 3 -a ${#ano} -eq 4 -a ${#mes} -le 2 -a ${#dia} -le 2 ]; then #Verifica tamaños
			if [ $((dia)) -lt 32 -a $((dia)) -gt 0 -a $((mes)) -lt 13 -a $((mes)) -gt 0 ]; then #Verifica  dias y meses
				break
			fi
		fi
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
