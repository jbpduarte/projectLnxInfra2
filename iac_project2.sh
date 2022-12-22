#!/bin/bash
TB_B='\033[1;34m'
T_RST='\e[0m'
T_YE='\e[0;33m'
T_GRN='\e[0;32m'

echo -e $TB_B
echo "Iniciando Script de Provisionamento IAC."
date
echo ""
echo -e $T_YE
echo "Verificando atualizações..."
apt-get update
echo -e $T_RST
echo ""
echo "Atualizando Servidor..."
apt-get upgrade -y
echo ""
echo "Removendo pacotes desnecessários..."
apt-get  autoremove -y
echo -e $T_GRN
echo "...Servidor Atualizado..."
echo -e $T_RST
echo ""
echo "Instalando Apache - >"
apt-get install apache2 -y
echo ""
echo "Instalando descompactador Unzip - >"
apt-get install unzip -y
echo ""
echo "Baixando aplicação...."
wget -P /tmp/ https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
echo ""
echo ""
echo "Descompactando arquivos e os enviando para a pasta destino do apache..."
unzip -q /tmp/main.zip -d /tmp
cp -R /tmp/linux-site-dio-main/* /var/www/html
echo ""
echo -e $T_GRN
echo -e "...Processo Finalizado..."
echo -e $T_RST
