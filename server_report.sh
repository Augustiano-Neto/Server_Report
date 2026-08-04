#!/bin/bash


#============================================ VARIAVEIS =====================================================
#
#

#============================ informacoes do sistema =============================

NOME_HOST=$(hostname)


DIAS_LOGADOS=$(uptime | awk '{print $3}')

USUARIOS_LOGADOS=$(who | awk '{print $1}')

USO_CPU=$(top -b -n 1 -d 1 | grep -i cpu | head -n 1 | awk '{print $8}')#cpu nao usada

$USO_CPU=$((100-USO_CPU)) #calculo de uso da cpu


TOP_PROCESSOS=$(ps -eo user,pid,%cpu,%mem,cmd --sort=-%cpu | grep -v "ps" | head -n 5)


MEMORIA_UTILIZADA=$(free -h | grep -i mem | awk '{print $3}')


MEMORIA_LIVRE=$(free -h | grep -i mem | awk '{print $7}')


USO_DISCO_RAIZ=$(df -h / | grep / | awk '{print $5}')


#=========================== informacoes da rede ==============================

ENDERECO_IP=$(ip a | grep -v inet6 | grep dynamic | awk '{print $2}')


GATEWAY=$(ip route | grep default | awk '{print $3}')


SERVIDOR_DNS=$(nslookup a | grep -i server: | awk '{print $2}')

#====================== informacoes servicos ==================================

NGINX=$(systemctl is-active nginx)

SSH=$(systemctl is-active ssh)

DOCKER=$(systemctl is-active docker)


#============================================ Exibicao =====================================================


cat << "EOF"
    ____        _            __   _____                 _     __
   / __ \____ _(_)___  ___  / /  / ___/___  ______   __(_)___/ /___  _____
  / /_/ / __ `/ / __ \/ _ \/ /   \__ \/ _ \/ ___/ | / / / __  / __ \/ ___/
 / ____/ /_/ / / / / /  __/ /   ___/ /  __/ /   | |/ / / /_/ / /_/ / /
/_/    \__,_/_/_/ /_/\___/_/   /____/\___/_/    |___/_/\__,_/\____/_/


EOF

echo "INFORMACOES DO SERVIDOR:"

echo "HOST NAME: $NOME_HOST"
echo "PERIODO LOGADO: $DIAS_LOGADOS"
echo "USUARIOS LOGADOS: $USUARIOS_LOGADOS "
echo "TOP 5 PROCESSOS RODANDOS: "
echo "$TOP_PROCESSOS"

echo -e "IFORMACOES DE HARDWARE: \n"

echo "USO DA CPU: $USO_CPU"
echo "MEMORIA UTILIZADA: $MEMORIA_UTILIZADA"
echo "MEMORIA LIVRE: $MEMORIA_LIVRE "
echo "ESPAÇO DO DISCO RAIZ UTILIZADO: $USO_DISCO_RAIZ"

echo -e "INFORMACOES DE REDE: \n"

echo "ENDERECO IP: $ENDERECO_IP"
echo "GATEWAY: $GATEWAY"
echo "ENDERECO SERVIDOR DNS: $SERVIDOR_DNS"

echo -e "STATUS DE SERVICOS: \n"

echo "NGINX: $NGINX"
echo "SSH: $SSH"
echo "DOCKER: $DOCKER"
