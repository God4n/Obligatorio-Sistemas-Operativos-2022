# ADA
Resolver en ADA el siguiente problema.

Se desea simular el funcionamiento de un puerto para barcos de contenedores. En dicho puerto existe una grúa de descarga (con capacidad de 2 barcos) y 2 lugares de atracadero de espera (el quinto espera sin atracar). Cada barco que accede al puerto anuncia “Barco x accede al puerto” y al retirarse “Barco x se retira del puerto” (x es el número de barco, los mismos están numerados) Cuando un barco accede a la grúa de descarga “Barco x accede a descargar en la grúa” y al salir de la grúa “Barco x se retira de la grúa”. Los barcos permanecen en la grúa de descarga o en el atracadero de espera un tiempo aleatorio. Al acceder al atracadero de espera “Barco x accede al atracadero de espera 1” (1 o 2). y al retirarse “Barco x se retira del atracadero de espera 1”(1 o 2). El objetivo de cada barco es entrar a puerto, descargar (esperar si es necesario) y finalmente irse del puerto.

Notas:
 - Una vez que descargan, deben irse.
 - De existir lugar en la grúa, no tienen que ir primero a esperar.
 - Existen 10 barcos que intentan entrar al puerto (numerados de 1 a 10).
    - Antes de intentar entrar a puerto, esperan un random de 1 a 10 segundos.
    - Inicialmente, todos los barcos están llenos.
    - Una vez descargado, no intenta volver a puerto.
 - No pueden acceder más de 5 barcos a la vez al puerto.
 - No pueden coincidir dos barcos en el mismo atracadero de espera o en la misma grúa.
 - Anunciar implica mostrar en consola.
 - Cada vez que habla de esperar un tiempo, implica esperar un random de 1 a 10 segundos.
 - Este problema es análogo al problema del “barbero dormilón”.
 - Cada barco representa una tarea independiente.
 - No suele haber dos ejecuciones iguales.
 - Entregar el código y una breve explicación de decisiones tomadas.
