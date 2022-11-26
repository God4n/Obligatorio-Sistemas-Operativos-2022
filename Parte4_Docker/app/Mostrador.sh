#!/bin/bash
echo "Ingrese su nombre: "
read nombre
echo "Bienvenido a Seguros ConductORT $nombre"

echo "Ingrese su numero de telefono: "
read telefono

echo "Ingrese su numero de cedula: "
read cedula

echo "Seleccion una opción de consulta: "
echo "1. Activar Seguro"
echo "2. Ingresar Siniestro"
echo "3. Atencion al Cliente"
echo "4. Otra"

read x;

if [[ $(echo $x | grep '1' -c) -eq 1 ]];then echo "Desea activar seguro.";fi
if [[ $(echo $x | grep '2' -c) -eq 1 ]];then echo "Desea ingresar un siniestro.";fi
if [[ $(echo $x | grep '3' -c) -eq 1 ]];then echo "Desea hablar con atención al cliente";fi
if [[ $(echo $x | grep '4' -c) -eq 1 ]];then echo "Ingrese su razón de consulta"; read razon; echo "Desea cosnultar por $razon" ;fi

echo "Gracias por su consulta!!!"
echo "Aguarde a ser llamado por un asesor, se le indicará el puesto vía SMS al numero $telefono!"