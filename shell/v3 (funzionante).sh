#!/bin/sh

percorso="`pwd`/convertito"
mkdir $percorso
mkdir $percorso/copia

png=0
jpg=0
mp=0
mov=0
heic=0
aae=0
cont=0

copia=0
anno=2024
for i in *
do
	headn=28
	tailn=9
	case $i in
		*-*)copia=` expr $copia + 1 `
			cp "$i" $percorso/copia
			continue;;
		*);;
	esac

	case $i in
		*.PNG) fin=".PNG"
			png=` expr $png + 1 `;;
		*.JPG)fin=".JPG"
                        jpg=` expr $jpg + 1 `;;
		*.MP4)fin=".MP4"
                        mp=` expr $mp + 1 `;;
		*.MOV)fin=".MOV"
                        mov=` expr $mov + 1 `;;
		*.HEIC)fin=".HEIC"
                        heic=` expr $heic + 1 `;;
		*.AAE)fin=".AAE"
                        aae=` expr $aae + 1 `;;
		*) echo "problemi con $i"
			continue;;
	esac
	if test -f $i
	then
		n="`ls -gGh --full-time $i`"
		dn=0
		for p in $n
		do
			dn=` expr $dn + 1 `
			if test $dn -eq  4
			then
				date=$p
			fi
		done
		var="$percorso/$date-$cont$fin"
		cont=` expr $cont + 1 `
		echo $var
		cp $i $var
	fi
done

echo "in totale ci sono:\nPNG=$png\nJPG=$jpg\nMP4=$mp\nMOV=$mov\nHEIC=$heic\nAAE=$aae"
echo "le copie/errore del telefono sono = $copia"
echo "le fotografie copiate in totale sono $cont"
