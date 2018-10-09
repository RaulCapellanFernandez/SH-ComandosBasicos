#!/bin/bash

##############
# Practica 3 #
##############

#Funciones

#Visualizar el numero de archivos dentro del directorio de trabajo
function numFiles(){
	ls | wc -l
}

#Visualizar numero de subdirectorios dentro del directorio de trabajo
function numSub(){
	ls -l | grep ^d | wc -l
}

#Visualizar el fichero de mayor tamano
function max(){
	du -sm * | sort -nr | head -1 | cut -f2
	#ls -al|grep^- | awk {print$5}' | sort -n | head -1
}

#Visualizar el fichero mas pequeno
function min(){
	du -sm * | sort -n | head -1 | cut -f2
}

#Espacio total usado
function diskUsed(){
	du -sh | cut -f1
}
#Numero de ficheros con permiso de lectura para el usuario que ejecuta
function numFichEjec(){
	ls -l | grep '^-r' |wc -l
	#ls -al | grep '^-r' |wc -l
}
function numFichWrite(){
	num1 = ls -l | grep '^-rw' |wc -l
 	num2 = ls -l | grep '^--w' |wc -l

 	num1 = $num1 + $num2
 	echo "$num1"
 	#ls -al | grep '^-.w' |wc -l


}
 	#ls -al | grep '^-..x' |wc -l
 	#ls -al | grep '^-..x..x..x' |wc -l


#PRECONDICIONES#
#Si no recibe ningun argumento trabajara sobre el directorio actual
if test $# -eq 0
then
	dir=.
fi

#Si recibe un argumento lo tomaremos como directorio de trabajo
if test $# -eq 1
then
	dir=$1
fi

#Si recibe mas de un parametro debemos finalizar la ejecucion del script
if test $# -gt 1
then
	echo -e "Numero de argumentos no valido"
	exit 0
fi


while true
do

	echo -e "\n1) Numero de archivos\n"
	echo -e "2) Numero de subdirectorios\n"
	echo -e "3) Fichero mas grande\n"
	echo -e "4) Fichero mas pequeño\n"
	echo -e "5) Espacio total ocupado\n"
	echo -e "6) Numero de ficheros con permiso de lectura para el usuario que ejecuta\n"
	echo -e "7) Numero de ficheros con permiso de escritura para el usuario que ejecuta\n"
	echo -e "8) Numero de ficheros con permiso a ejecucion para el usuario que ejecuta\n"
	echo -e "9) Ficheros con permiso de ejecucion para todos los usuarios\n"
	echo -e "10) Salir\n"

read option

	case $option in
	1)numFiles=`numFiles`
		echo -e "Numero de archivos en el directorio: $numFiles\n"
		;;
	2)numSub=`numSub`
		echo -e "Numero de subdirectorios: $numSub\n"
		;;
	3)max=`max`
		echo -e "El fichero mas grande del directorio es: $max\n"
		;;
	4)min=`min`
		echo -e "El fichero mas pequeño del directorio es: $min\n"
		;;
	5)diskUsed=`diskUsed`
		echo -e "Espacio total usado: $diskUsed\n"
		;;
	6)numFichEjec=`numFichEjec`
		echo -e "ficheros con permso de lectura en el directorio $numFichEjec\n"
		;;
	7)numFichWrite=`numFichWrite`
		echo -e "ficheros con permso de escritura en el directorio $numFichWrite\n"
		;;
	10)break;;
	*) echo Opcion no valida;;
	esac
done
