#!/bin/sh

percorso="`pwd`/convertito"
mkdir $percorso
mkdir $percorso/copia
cont=0
copia=0
anno=2024
for i in *
do
	case $i in
		*-*)copia=` expr $copia + 1 `
			cp "$i" $percorso/copia
			continue;;
		*);;
	esac

	case $i in
		*.PNG) fin=".PNG";;
		*.JPG)fin=".JPG";;
		*.MP4)fin=".MP4";;
		*.MOV)fin=".MOV";;
		*.HEIC)fin=".HEIC";;
		*.AAE)fin=".AAE";;
		*) echo "problemi con $i";;
	esac
	if test -f $i
	then
		var="`ls -gGh $i  | head -c 24 | tail -c 7`"
		date="`ls -gGh $i  | head -c 24 | tail -c 2 | tr -d ' '`"
		case $date in
			"1")date="01";;
			"2")date="02";;
			"3")date="03";;
			"4")date="04";;
			"5")date="05";;
			"6")date="06";;
			"7")date="07";;
			"8")date="08";;
			"9")date="09";;
		esac
		case $var in 
			*gen*)date=01-$date-$anno-$cont;;
			*feb*)date=02-$date-$anno-$cont;;
			*mar*)date=03-$date-$anno-$cont;;
			*mag*)date=05-$date-$anno-$cont;;
			*giu*)date=06-$date-$anno-$cont;;
			*lug*)date=07-$date-$anno-$cont;;
			*apr*)date=04-$date-$anno-$cont;;
			*ago*)date=08-$date-$anno-$cont;;
			*set*)date=09-$date-$anno-$cont;;
			*ott*)date=10-$date-$anno-$cont;;
			*nov*)date=11-$date-$anno-$cont;;
			*dic*)date=12-$date-$anno-$cont;;
			*);;
		esac
		cont=` expr $cont + 1 `
		echo $date
		cp $i $percorso/$date$fin
	fi
done

echo "le copie/errore del telefono sono = $copia"
echo "le fotografie copiate in totale sono $cont"
