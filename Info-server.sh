#!/bin/bash

#======================== FUNCOES DO SCRIPT =================================================


#FUNCAO DA TELA INICIAL

Template(){

	cat << "EOF"
	    ____        _            __   _____                 _     __
	   / __ \____ _(_)___  ___  / /  / ___/___  ______   __(_)___/ /___  _____
	  / /_/ / __ `/ / __ \/ _ \/ /   \__ \/ _ \/ ___/ | / / / __  / __ \/ ___/
	 / ____/ /_/ / / / / /  __/ /   ___/ /  __/ /   | |/ / / /_/ / /_/ / /
	/_/    \__,_/_/_/ /_/\___/_/   /____/\___/_/    |___/_/\__,_/\____/_/

EOF

}

menu_inicial(){

	printf " [1] SISTEMA\n "
	printf "[2] REDE\n "
	printf "[3] ARMAZENAMENTO\n "	
	printf "[4] CPU E MEMORIA\n "
	printf "[5] SERVICOS\n "
	printf "[6] PROCESSOS\n "	
	printf "[7] DOCKER\n "
	printf "[8] RELATORIO COMPLETO\n "
	printf "[0] SISTEMA\n "	

}



#FUNCAO DE INFORMACOES DO SISTEMA

#abstracao de informacoes do sistema

hostname=$(hostname)

distribuicao=$(grep -iE '\bname\b' /etc/os-release 2>/dev/null | cut -d '"' -f2)

versao_distro=$(grep -iE '\bversion\b' /etc/os-release 2>/dev/null | cut -d '"' -f2 | cut -d ' ' -f1)

kernel=$(uname -r)

arquitetura=$(uname -m)

data=$(date)

tempo_ligado=$(uptime -p 2>/dev/null | cut -d ' ' -f2-7)

ultimo_boot=$(who -b 2>/dev/null | awk '{print $4" "$5}')

usuarios_conectados=$(who -u 2>/dev/null | awk '{print $1}' | sort -u)

# montando a funcao da aba de informacao do sistema
sistema(){
	
	printf "==================== INFORMACOES DO SISTEMA ====================\n\n"

	printf "Hostname: $hostname\n"
	printf "Distribuicao: ${distribuicao:-"Desconhecida"}\n"
	printf "Versao da distro:${versao_distro:-"Desconhecida"}\n"
	printf "Kernel: $kernel \n"
	printf "Arquitetura: $arquitetura \n"
	printf "Data e Hora: $data \n"
	printf "Tempo ligado: ${tempo_ligado:-"Indisponivel"} \n"
	printf "Data do Ultimo Boot: ${ultimo_boot:-"Indisponivel"} \n"
	printf "Usuarios conectados: ${usuarios_conectados:-"Indisponivel"} \n"

	printf "==================================================================\n\n"
}



#FUNCAO DE RECURSOS DO SISTEMA

#abstracao de recursos do sistema

#CPU

uso_cpu=$(top -b -n 1 | grep -i "%cpu(s)" | awk '{print $8}')

numero_cpu=$(lscpu | grep -i "cpu(s):" | awk '{print $2}')

numero_nucleos=$(lscpu | grep -i "núcleo(s)" | awk '{print $2}')



























#FUNCAO DE INFORMACoes DE REDE

#abstracao de informacoes da rede

interface_ativa=$(ip route show default | awk '{print $5}')

endereco_ip_privado=$(ip -4 route get 8.8.8.8 | awk '{print $7}')

mascara_rede=$(ifconfig | grep $(endereco_ip_privado | cut -d ' ' -f7)| awk '{print $4}')

getway=$(ip -4 route get 8.8.8.8 | awk '{print $3}')

servidor_dns=$(grep -i nameserver /etc/resolv.conf 2>/dev/null | awk '{print $2}' )

mac_adress=$(ip -br link | grep -i $(interface_ativa) | awk '{print $3}')

enderco_ip_publico=$(curl ifconfig-me 2>/dev/null)

latencia_internet=$(pig -c 3 8.8.8.8 | head -n 1 | cut -d '/' -f5)

#funcao de teste de conectividade com a internet
teste_conectividade(){

	if ping -c 1 -w 2 8.8.8.8 &>/dev/null; then
		printf "ATIVA"
	else 
		printf "INATIVA"
	fi
}



#montando funcao da aba de rede do sistema

rede(){

	printf "==================== INFORMACOES DE REDE ====================\n\n"

	printf "Interface ativa: $interface_ativa\n"
	printf "IP privado: $endereco_ip_privado\n"
	printf "Mascara: $mascara_rede\n"
	printf "Geteway IP: $getway\n"
	printf "Servidor DNS: ${servidor_dns:-"Indisponivel"}\n"
	printf "MAC adress: $mac_adress\n"
	printf "IP publico: $enderco_ip_publico\n"
	printf "Status de conexao da rede: $conectividade_internete"
	printf "Latencia da rede: $latencia_internet\n"
	printf "==================================================================\n\n"

}

Template
menu_inicial
sistema
rede


