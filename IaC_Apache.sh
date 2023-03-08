#!/bin/bash

echo "Atualizando pacotes..."
	apt update -y && apt upgrade -y
echo -e

echo "Iniciano instalação servidor apache..."
	apt install apache2 -y
echo -e


echo "Verificando Status apache..."
	systemclt status apache2
echo -e


echo "Instalano unzip..."
	apt install unzip
echo -e


echo "Biaxando arquivos html e descompactando..."
	cd /tmp
	wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
	unzip main.zip
echo -e


echo "Copiando arquivos html para diretório padrão apache..."
	cd linux-site-dio-main
	cp -R * /var/www/html/
echo  -e
echo "Finalizado!!"
