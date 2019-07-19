#!/usr/bin



enviar_sourceforge() {

	if [ "$ROM" = "rr" ] ; then
		cd ~/rr/out/target/product/sanders
		echo -e ${ylw}"\n\n ▼ ROM está sendo enviada para sourceforge?\n"${txtrst}
		scp RR*.zip j144df@frs.sourceforge.net:/home/frs/project/j144df/sanders/
		fi
}

enviar_alteracoes() {
	modirDev=~/apps/devx12/rr

	nomeDev=novidades
	if [ -d $modirDev/$nomeDev  ] ; then
		echo -e ${ylw}"\n ▼$nomeDev \n"${txtrst}
		cd $modirDev/$nomeDev
		cp -a -R  ~/rr/CHANGELOG.mkdn  $modirDev/$nomeDev/MotoG5sPlus.xml
		git add -A
		echo "OTA Update for RR $DEVICE $(date +%Y%m%d) Build" > /tmp/rrota
		git commit -as -F /tmp/rrota
		git push origin master
		cd -
		rm -fv /tmp/rrota
	else
		git clone https://github.com/devx12/changelogs -b master $modirDev/$nomeDev
	fi
}

enviar_adb() {

		cd ~/rr/out/target/product/sanders
		RRZIP="$(ls RR*.zip)";
		adb push $RRZIP /sdcard/Download
		adb reboot recovery
}

enviar_afh() {

	if [ "$ROM" = "rr" ] ; then
		cd ~/rr/out/target/product/sanders
		#echo -e ${ylw}"\n\n ▼ ROM está sendo enviada para AFH?\n"${txtrst}
		curl -T RR*.zip ftp://uploads.androidfilehost.com --user j144df:PTVWatWG2rbA
	fi

}

sync_gdriveDaTurma() {

	caminho=~/etc/documentos/G-Drive/turma/4°\ SEMESTRE\ Apostilas\ \|\ 2018
	turma=Estrutura\ de\ Dados/
		echo -e ${ylw}"\n ▼$caminho \n"${txtrst}
		cd $caminho/$turma
		git clone https://bitbucket.org/wesleyqueiroz -b master bitbucket


}


"""







    def voltar():

    def menubuildandroid():
        divisor()
        menulista ={1:"1 - Atualizar rom",
                    2:"2 - Limpar build",
                    3:"3 - Make build",
                    4:"4 - Enviar AFh",
                    5:"5 - Enviar Mega",
                    6:"6 - Enviar SourceForce",
                    7:"7 - Emviar atualização OTA"}
        divisor()
    def menuultilidadelinux():
        print("""
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

          """)

    def menutoolextras():
        print("""
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

          """)

    def menuoutros():
        print("""
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

          """)

"""