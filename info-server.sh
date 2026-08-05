#!/bin/bash


#============================== VARIAVEIS =========================================

#====== sistema =========

 nome_host=$(hostname)

 ditribuicao_linux=$(cat /etc/os-release | grep -i name | awk 'NR == 2' | cut -d '"' -f2)

 versao_sistema=$(cat /etc/os-release | grep -i version_id | cut -d '"' -f2)





#============================== FUNCOES DO SISTEMA =================================

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

	printf "[1] [SISTEMA       	 ]"
	printf "[2] [REDE          	 ]"
	printf "[3] [ARMAZENAMENTO 	 ]"	
	printf "[4] [CPU E MEMORIA 	 ]"
	printf "[5] [SERVICOS       	 ]"
        printf "[6] [PROCESSOS     	 ]"  
	printf "[7] [DOCKER        	 ]"
 	printf "[8] [RELATORIO COMPLETO  ]"
	printf "[0] [SAIR 		 ]"
	
}


#funcao sistema


sistema(){


}
















