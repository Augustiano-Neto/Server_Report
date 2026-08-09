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

	printf "[1] SISTEMA "
	printf "[2] REDE "
	printf "[3] ARMAZENAMENTO "	
	printf "[4] CPU E MEMORIA "
	printf "[5] SERVICOS "
	printf "[6] PROCESSOS "	
	printf "[7] DOCKER "
	printf "[8] RELATORIO COMPLETO "
	printf "[0] SISTEMA "	

}

#FUNCAO DE INFORMACOES DO SISTEM

sistema(){


	echo "Hostname: $(hostname)"

	echo "Distribuicao: $(cat /etc/os-release | grep -iE '\bname\b' | cut -d '"' -f2)"

	echo "Versao da distro: $(cat /etc/os-release | grep -iE '\bversion\b' | cut -d '"' -f2 | cut -d ' ' -f1)"

	echo "Kernel: $(uname -sr)"

	echo "Arquitetura: $(uname -m)"

	echo "Data e Hora: $(date)"
	
	echo "Tempo ligado: $(uptime -p | cut -d ' ' -f2-7)"
	
	echo "Data do Ultimo Boot: $(who -b | awk '{print $4" "$5}')"	

	echo "Usuarios conectados: $(who -u | awk '{print $1}' | sort | uniq)"
}


#FUNCAO DA INFORMACAO DA REDE

rede(){


	echo "Interface ativa: $(ip a | grep -i up | grep -iv down | grep -iv know | cut -d ':' -f2)"

	echo "Endereco IP: $(ip -4 route get 8.8.8.8 | cut -d ' ' -f7) "
	
	echo "Mascara: $(ifconfig | grep $(ip -4 route get 8.8.8.8 | cut -d ' ' -f7) | awk '{print f$4}')"

	echo "Geteway IP: $(ip -4 route get 8.8.8.8 | cut -d ' ' -f3)"

	echo "Servidor-DNS: $(nslookup a | grep -i server: | awk '{print $2}')"

}
