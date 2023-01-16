#!/bin/bash
# Licence : GPL v3
# Fonction : Scanner et Reconnaître. Script pour une personne aveugle qui a des difficultés pour lancer un logiciel de scan.. 
# Le script lui donnera le document scanné sous trois formats : pdf, jpg et txt.
# Maintenance : aciah@laposte.net
# Shell : bash
# d'abord un petit bruit pour montrer que le script travaille
aplay /usr/local/share/advl/beep.wav  
# un mot enregistré sous la forme patienter.pdf
pdftotext -layout /usr/local/share/advl/patienter.pdf - | espeak -a 150 -v mb-fr1 -s 130
# on crée le dossier scan dans $HOME
mkdir $HOME/scan
# on scanne le document en indiquant le format 210x297 et la résolution.
scanimage -x 210 -y 297 --format=tiff >$HOME/scan/image.tiff --resolution 150
sleep 1
# on se place dans le dossier scan
cd $HOME/scan
# on transforme l'image tiff en document_final.txt
tesseract image.tiff document_final
# le texte docfinal.pdf annonce que le document scanné se trouve dans le dossier scan.
pdftotext -layout /usr/local/share/advl/docfinal.pdf - | espeak -a 150 -v mb-fr1 -s 130

# on fait lire le document_final.txt  avec un autre script qui s'appelle lecture.sh que nous publierons plus tard.
x-terminal-emulator -e /usr/bin/lecture.sh $HOME/scan/document_final.txt

# et notre script n'est pas fini car on veut encore avoir le document en pdf et en jpg. Mais nous y reviendrons.
# ceci n'était qu'un essai pour utiiiser Github.
# à suivre donc ........
# et n'hésitez pas à nous visiter ici : https://aciah-linux.org
