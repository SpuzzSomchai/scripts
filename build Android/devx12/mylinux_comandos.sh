
#!/usr/bin

linux_adb (){
	echo -e "0 - WIFE\n1 - USB"

}

gappsTT() {
	After_Date=`date --date="" +%Y%m%d`
	wget https://github.com/opengapps/arm/releases/download/$After_Date/open_gapps-arm64-8.1-mini-$After_Date.zip


}


linux_baixaAquivo(){
	clear
	echo -e "Cole a URL do arquivo Zip"
	read arquivo
	curl -O $arquivo ~/Downloads
	MSG=cd ~/Downloads; ls -l;cd;
	mensagem
}

linux_display() {
	echo -e "0 - Desligar\n1 - Ligar"
	read tela
	case $tela in
		0)xset -display :0.0 dpms force off
		MSG=$screen_off;;
		1)xset -display :0.0 dpms force on
		MSG=$screen_on	;;
		*) "Opção desconhecida." ; clear;;
	esac
	mensagem
	#buil_done
	#delmsg

}


linux_pesquisa(){
	find validus -type d | \
	while read line
	do
		echo "$line" && ls -l "$line" | grep -v ^total | wc -l
	done
}


linux_monitoraHD(){
	watch -n 0.1 df -t ext4 ; clear
}

linux_limpaRAM() {
	free -m
	sudo sysctl -w vm.drop_caches=3
	free -m
}

linux_botRobo() {
	#cd ~/etc/bot/ && node server.js
  node ~/etc/bot/server.js
}
linux_proxi() {
	echo -e "0 - Desativar\n1 - Ativar\n3 -Verificar proxy"
	read pProxy
	case $pProxy in
		0)
		export http_proxy=""
		export https_proxy=""
		export ftp_proxy="";;
		1)
		export http_proxy=http://aluno:123456@10.10.0.1:8080
		export ftp_proxy=http://aluno:123456@10.10.0.1:8080
		export https_proxy=http://aluno:123456@10.10.0.1:8080 ;;
		3) env ;;
		*) "Opção desconhecida." ; clear;;
	esac

}

linux_traficoRede(){
	sudo nethogs
}

linux_lamp(){
	echo -e "Vamos trabalhar com o LAMP ?"
	echo -e "0 - iniciar\n1 - Parar\n2 - Status\n3 - Abrir a Interface"
	dir='/opt/lamp/'
	read lamp
	case $lamp in
		0)sudo $dir/ctlscript.sh start;;
		1)sudo $dir/ctlscript.sh stop ;;
		2)sudo $dir/ctlscript.sh status ;;
		3)sudo $dir/manager-linux-x64.run ;;
		*) "Opção desconhecida." ; clear;;
	esac
}

voltar(){
 echo -e "\n"
 echo -n "Digite  [v] para voltar: >>>  "
 read voltar
 case ${voltar} in
     v) clear;Menu;;
  *) "Opção desconhecida." ;;
 esac
 Menu
}
