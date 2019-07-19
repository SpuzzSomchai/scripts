
#!/usr/bin/env bash
ROM=rr
DirScripts=~/etc/scripts/devx12/
DEVICE=sanders
custom=~/etc/custom
After_Date=`date --date="" +%Y%m%d`
RAM=7
outzip=~/$ROM/out/target/product/$device/
RRZIP="RR*.zip"

export LC_ALL=C  #Obrigatorio quando usa novo sistema

source  ~/etc/scripts/devx12/myrom.sh
source  ~/etc/scripts/devx12/mycolor.sh
source  ~/etc/scripts/devx12/mytoken.sh
source  ~/etc/scripts/devx12/mystring.sh
source  ~/etc/scripts/devx12/mylinux_comandos.sh
#source  ~/etc/scripts/devx12/myapktool.sh
source  ~/etc/scripts/devx12/myupload.sh
#clear
Menu() {
  echo -e "\n ▼ Favor escolhe opção no menu abaixo by j144df:";  echo -e ${grn}"""
 A:Build Android | B:Utilidades linux:   | C: Tool Extras  | D: Outros
----------------------------------------------------------------------------------
 1-Atualizar apps| 1-Configuar Proxy     |                 | 1-LAMP
 2-Atualizar ROM | 2-CPU/MEM| 7-                           | 2-Sync Gdrive SI
 3-Limpar build  | 3-Conectar Celular
 4-Make build    | 4-Contar arquivos
 5-Enviar AFH    | 5-Liberar memória
 6-Enviar MEGA   | 6-Baixar file ZIp
 7-Enviar Source | 7-Reniciar PC
 8-Atualizar Ota | 8-kill java
 9-Mv Build      | 9-Status disco
 -----------------------------------------------------------------------------------"""${txtrst}
  echo -n "Qual a opção desejada?(x para cancelar) ou l para Limpar a tela >>>  "
	read opcao
	case ${opcao} in
	   x) exit ${exitCode} ;;
     a1) extras_atualizar;;
     a2) rom_atualizar ;;
     a3) rom_limpar ;;
     a4) rom_make ;;
     a5) enviar_afh ;;
     a6) enviar_mega ;;
     a7) enviar_sourceforce;;
     a8) rom_novidades ;;
     a9) enviar_sourceforce;;
     b1) linux_proxi ;;
     b2) htop ;;
     b3) Conectar_adb;;
     b4)  ;;
     b5)  ;;
     b6)  ;;
     b7) ;;
     b8)  ;;
     b9)  ;;
     b10) ;;
     d1) linux_lamp;;
     d2) sync_gdriveDaTurma;;
     l) clear;;
     d4) bash ~/etc/scripts/menu_main.sh && exit 1 ;;
	  	*) 'Opcao desconhecida.' ;;
	esac
 Menu
}
Menu
