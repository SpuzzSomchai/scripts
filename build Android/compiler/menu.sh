#!/usr/bin/env bash

mPATH=scripts

source  ~/$mPATH/config
source  ~/$mPATH/mycolor.sh
source  ~/$mPATH/funcions

Menu() {
 echo -e "\n ▼ Favor escolhe opção no menu abaixo :";  echo -e ${grn}"""
 Q:EXIT          | C:CLEAR:        | U:UPDATE                CREATED BY @jadilsson12
------------------------------------------------------------------------------------
 1-Source Update         5 - Kernel
 2-Clear Build           6 - Update source extras
 3-Make Build            7 - Build auto
 4-Uplord  to Cloud 
 ------------------------------------------------------------------------------------"""${txtrst}
 echo  -n  "Qual a opção desejada? "
	read opcao
	case ${opcao} in
	 q) exit $3 ;;
     c) clear ;;
     u) clear ; source ~/$mPATH/menu.sh ;;
	 1) rom_update ;;
     2) rom_clear ;;
     3) rom_make ;;
     4) rom_upload ;;
     5) kernel ;;
     6) merge_up_extras ;;
     7) auto ;;
  	  	*) 'Opcao desconhecida.' ;;
	esac
 Menu
}
clear
Menu
