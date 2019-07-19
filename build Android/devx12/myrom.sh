#!/usr/bin
cd ~/$ROM

export days_to_log=6  #Quantidates de dias para atualização

rom_device(){

	if [ ! -d "$ROM/device/motorola/sanders" ] ; then
           echo ""
	else
		git clone https://github.com/devx12/device_motorola_sanders -b oreo ~/rr/device/motorola/sanders
	fi
}


rom_jack(){
	./prebuilts/sdk/tools/jack-admin kill-server $1>/dev/null
	./prebuilts/sdk/tools/jack-admin start-server $1>/dev/null
	./prebuilts/misc/linux-x86/ccache/ccache -M 50 $1>/dev/null
}


mensagem(){

	curl --silent --output /dev/null \
	--data-urlencode "chat_id=$chat_id" \
	--data-urlencode "text=$MSG" \
	--data-urlencode "parse_mode=Markdown" \
	"https://api.telegram.org/bot$token/sendMessage"
}

print_screen(){
	while true; do
		DISPLAY=:0 scrot foto.png
		curl --silent --output /dev/null \
		-s -X POST "https://api.telegram.org/bot$token/sendPhoto" -F chat_id=$chat_id -F photo="@foto.png"
		rm foto.png
		clear
		#echo "Á última captura enviada foi  $(date +'%d-%m-%Y') as $(date +'%H:%M:%S %Z - %Y')"
		echo "Á última captura enviada foi  $(date)"
		echo "Aguardando chegar  $(date -d "+1 Second") para enviar outra"
		sleep 1
	done
}

rom_gapps(){
	cd ~/Downloads && curl -O https://cloud.kenzoROMs.club/opengapps/$After_Date/arm64/open_gapps-arm64-8.1-mini-$After_Date-UNOFFICIAL.zip  ;cd;
	MSG=O gapps baixando com sucesso
	mensagem
	curl -s –max-time 10 -d "chat_id=${chat_id}&disable_web_page_preview=1&text=${MSG}" https://api.telegram.org/bot${token}/sendMessage >/dev/null
}

rom_atualizar(){

	cd ~/$ROM

	#repo sync -c -f -q --force-sync --no-clone-bundle  -j32 --no-tags --force-broken
	repo sync -c -f --force-sync  -j32 --no-tags --no-clone-bundle --force-broken
	#repo sync -c -f --force-sync --no-tags
	#rom_scripts_build
	#rom_device

}

rom_scripts_build() {
	cp -a -R  ~/etc/scripts/build/changelog.sh ~/rr/vendor/rr/tools/
	cp -a -R  ~/etc/scripts/build/rr_variant.sh ~/rr/vendor/rr/tools/
}



rom_make(){

	cd ~/$ROM;	rom_ccache
	if [ "$ROM" = 'rr' ] ; then
		pasta="rr"
		nomeDev="rr"
		#. build/envsetup.sh && brunch lineage_sanders-userdebug -j32
		 . build/envsetup.sh && lunch aosp_sanders-userdebug &&  mka aex -j32

	fi

	killall java $1>/dev/null
	romProcessoNotificacao

}


romProcessoNotificacao(){
 cd $outdir
		while true; do
						if [ -f $RRZIP ] ; then
							MSG="Build finalizando com sucesso"
							mensagem
							break
							exit
						else
							MSG="Erro favor verificar"
							mensagem
							#sleep 3
							break
						fi
		done
}


rom_finalizada(){
	exitCode=$?
	if [ ${exitCode} -eq 0 ]; then
		cout
		RRZIP="$(ls RR*.zip)";
		cd -
		if [ ${RR_BUILDTYPE} == "Nightly" ]; then
			echo -e "Build sucessful, uploading!";
			bash ~/rrkenzobot/kenzo.sh "Build successful, uploading!";
			#curl -T "${OUT}/${RRZIP}" ftp://USERNAME:PASSWORD@localhost/downloads.resurrectionremix.com/${DEVICE}/;
			echo -e "Grab zip at http://downloads.resurrectionremix.com/${DEVICE}/${RRZIP}";
			#~/android-scripts/android-changelog -f html -m ~/tags/current ~/tags/$(date +%Y%m%d) > ~/rr.akhilnarang.me/Changelogs/$(date +%Y%m%d).html
			#~/android-scripts/android-changelog -f html -m ~/tags/first ~/tags/$(date +%Y%m%d) > ~/rr.akhilnarang.me/Changelogs/Changelog.html
			# Make all ssh links into https so people can click on them
			#sed -i -e 's|ssh://git@|https://|g' ~/rr.akhilnarang.me/Changelogs/*;
			cp ~/tags/$(date +%Y%m%d) ~/tags/current
			curl -T ./CHANGELOG.mkdn ftp://USERNAME:PASSWORD/downloads.resurrectionremix.com/${DEVICE}/Changelog.txt;
			#cp CHANGELOG.mkdn ota/akhil/Changelog.txt;
			#cd ota; git add -A;
			#~/rr/script/ota-gen.sh "${RRZIP}";
			bash ~/rrkenzobot/kenzo.sh "[$RRZIP](http://downloads.resurrectionremix.com/${DEVICE}/${RRZIP}) | [Changelog](http://rr.akhilnarang.me/Changelogs)";
		fi
		#rsync -av "${OUT}/${RRZIP}" ~/rr.akhilnarang.me/${DEVICE}/;
		#echo -e "Grab it at http://rr.akhilnarang.me/${DEVICE}/${RRZIP}";
	else
		bash ~/rrkenzobot/kenzo.sh "BUILD FAILED, RIP in pieces.";
	fi
}
delmsg(){
	S=680
	while [[ true ]]; do
		S=$(($S+1))
		echo $S
		curl -s  https://api.telegram.org/bot433288264:AAEgtKVaTSmQ1YOoOhGDxJnD8mp_Tb8fDkg/deleteMessage?chat_id=-1001376475021&message_id=$S


		if [ $S == 2000 ] ; then
			break
		fi
	done


}

rom_limpar(){
	outdir="/home/j144df/rr/out/target/product/sanders"
	echo -e "Clean build on "$ROM" \n"
	echo -e ${blu}" | 1- clean full | 2- dirty"${txtrst}
	read ask
	if [ $ask == 1 ] ; then
			make clean
	fi
	if [ $ask == 2 ] ; then
		rm -rf "$outdir/combinedroot";
		rm -rf "$outdir/data";
		rm -rf "$outdir/recovery";
		rm -rf "$outdir/root";
		rm -rf "$outdir/system";
		rm -rf "$outdir/utilities";
		rm -rf "$outdir/boot"*;
		rm -rf "$outdir/combined"*;
		rm -rf "$outdir/kernel";
		rm -rf "$outdir/ramdisk"*;
		rm -rf "$outdir/recovery"*;
		rm -rf "$outdir/system"*;
		rm -rf "$outdir/obj/ETC/system_build_prop_intermediates";
		rm -rf "$outdir/ota_temp/RECOVERY/RAMDISK";
		#rm -r  "$outdir/*RR*.*";
		rm -r  "$outdir/*.*";

	fi
}


rom_killjava(){
	kill all java

}

enviar_mega() {

	if [ "$ROM" = "rr" ] ; then
		cd $outzip
		echo -e ${ylw}"\n\n  ROM est� sendo enviada para MEGA?\n"${txtrst}
				rmega-up 'RR*.zip' -u 'jadilson12@gmail.com'
	fi
}
enviar_sourceforge() {

	if [ "$ROM" = "rr" ] ; then
		cd ~/rr/out/target/product/sanders
		echo -e ${ylw}"\n\n  ROM est� sendo enviada para sourceforge?\n"${txtrst}
		scp RR*.zip j144df@frs.sourceforge.net:/home/frs/project/j144df/sanders/
		fi
}

extras_atualizar() {

	modirDev=~/apps/devx12/rr

	nomeDev=android_build
	if [ -d $modirDev/$nomeDev ] ; then

		echo -e ${ylw}"\n ▼$nomeDev \n"${txtrst}
		cd $modirDev/$nomeDev
		git pull https://github.com/ResurrectionRemix/android_build oreo
		git push origin oreo

	else
		git clone https://github.com/devx12/android_build -b oreo $modirDev/$nomeDev
	fi

	nomeDev=android_vendor_resurrection
	if [ -d $modirDev/$nomeDev ] ; then

		echo -e ${ylw}"\n ▼$nomeDev \n"${txtrst}
		cd $modirDev/$nomeDev
		git pull https://github.com/ResurrectionRemix/android_vendor_resurrection oreo
		git push origin oreo

	else
		git clone https://github.com/devx12/android_vendor_resurrection -b oreo $modirDev/$nomeDev
	fi

#	nomeDev=ResurrectionOTA
#	if [ -d $modirDev/$nomeDev ] ; then
#
#		echo -e ${ylw}"\n ▼$nomeDev \n"${txtrst}
#		cd $modirDev/$nomeDev
#		git pull https://github.com/ResurrectionRemix/packages_apps_ResurrectionOTA oreo
#		git push origin oreo
#
#	else
#		git clone https://github.com/devx12/packages_apps_ResurrectionOTA -b oreo $modirDev/$nomeDev
#	fi

	nomeDev=android_frameworks_base
	if [ -d $modirDev/$nomeDev ] ; then

		echo -e ${ylw}"\n ▼$nomeDev \n"${txtrst}
		cd $modirDev/$nomeDev
		git pull https://github.com/ResurrectionRemix/android_frameworks_base oreo
		git push origin oreo

	else
		git clone https://github.com/devx12/android_frameworks_base -b oreo $modirDev/$nomeDev
	fi

	nomeDev=Resurrection_packages_apps_Settings
	if [ -d $modirDev/$nomeDev ] ; then

		echo -e ${ylw}"\n ▼$nomeDev \n"${txtrst}
		cd $modirDev/$nomeDev
		git pull https://github.com/ResurrectionRemix/Resurrection_packages_apps_Settings oreo
		git push origin oreo

	else
		git clone https://github.com/devx12/Resurrection_packages_apps_Settings -b oreo $modirDev/$nomeDev
	fi
}



rom_ccache(){
	export USE_CCACHE=1
	export CCACHE_DIR="/home/j144df/.ccache-${ROM}"
	~/$ROM/prebuilts/misc/linux-x86/ccache/ccache -M 50G $1>/dev/null
}
