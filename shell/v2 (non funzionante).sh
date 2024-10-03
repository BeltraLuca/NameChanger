#!/bin/sh

percorso="`pwd`/convertito"
mkdir $percorso
mkdir $percorso/copia

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
		*.PNG) fin=".PNG";;
		*.JPG)fin=".JPG";;
		*.MP4)fin=".MP4";;
		*.MOV)fin=".MOV";;
		*.HEIC)fin=".HEIC";;
		*.AAE)fin=".AAE";;
		*) echo "problemi con $i"
			continue;;
	esac
	if test -f $i
	then	
		n="`ls -gGh --full-time $i | wc -c`"
		if test $n -ge 66
		then
			continue
		fi
		echo $n
		if test $n -eq 66
		then
			tailn=` expr $tailn + 2 `
		fi
		while test ! $n -eq 66
		do
			if test $n -gt 66
			then
				if (test ! $((n%2)) -eq 0)
				then
					echo "maggiore e dispari"
					tailn=` expr $tailn + 1 `
				else
					echo "maggiore e pari head"
					#headn=` expr $headn + 1 `
				fi
				n=` expr $n - 1 `
			fi
			if test $n -lt 66
			then
                                tailn=` expr $tailn + 1 `
				n=66
			fi
		done
		date="`ls -gGh --full-time $i  | head -c $headn | tail -c $tailn | tr -d ' '`"
		var="$percorso/$date-$cont$fin"
		cont=` expr $cont + 1 `
		echo $var
		continue
		cp $i $var
	fi
done

echo "le copie/errore del telefono sono = $copia"
echo "le fotografie copiate in totale sono $cont"
