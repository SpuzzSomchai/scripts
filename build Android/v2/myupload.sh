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
