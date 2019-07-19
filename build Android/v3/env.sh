#!/usr/bin/env bash

export USE_CCACHE=1
export CCACHE_DIR=$HOME/.ccache-pie/aosp/
days_to_log=0

source  ~/devx12/funcions.sh

rr_scripts() {
	cp -a -R  ~/etc/BKscripts/changelog.sh ~/aosp/vendor/rr/tools/
	cp -a -R  ~/etc/BKscripts/rr_variant.sh ~/aosp/vendor/rr/tools/
}

sendMsg(){
    MSG="Build call you attencion"
    mensagem
}

mensagem(){

	curl --silent --output /dev/null \
    --data-urlencode "chat_id=$chat_id" \
	--data-urlencode "text=$MSG" \
	--data-urlencode "parse_mode=Markdown" \
	"https://api.telegram.org/bot$token/sendMessage"
}

make(){

#. build/envsetup.sh && lunch aosip_sanders-userdebug && time mka kronic -j16
# . build/envsetup.sh && lunch havoc_sanders-userdebug && mka bacon -j32
 . build/envsetup.sh && brunch havoc_sanders-userdebug -j16 -c        
 #. build/envsetup.sh && lunch rr_sanders-userdebug -j16 -c

}

enviar_sourceforge() {

	if [ "$ROM" = "rr" ] ; then
		cd ~/aosp/out/target/product/sanders
		echo -e ${ylw}"\n\n ▼ ROM está sendo enviada para sourceforge?\n"${txtrst}
		scp RR*.zip jadilson12@frs.sourceforge.net:/home/frs/project/sanders/RR-Pie/
		fi
}

#export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx7500M"
./prebuilts/misc/linux-x86/ccache/ccache -M 40G $1>/dev/null

# Jack server
export ANDROID_JACK_VM_ARGS="-Xmx7g -XX:+TieredCompilation -Dfile.encoding=UTF-8"
export SERVER_NB_COMPILE=2
export ANDROID_JACK_VM_ARGS=$JACK_SERVER_VM_ARGUMENT
./prebuilts/sdk/tools/jack-admin kill-server $1>/dev/null
rm -rf ~/.jack* $1>/dev/null

./prebuilts/sdk/tools/jack-admin install-server $1>/dev/null \
./prebuilts/sdk/tools/jack-launcher.jar $1>/dev/null \
./prebuilts/sdk/tools/jack-server-4.11.ALPHA.jar $1>/dev/null \
./prebuilts/sdk/tools/jack-admin start-server $1>/dev/null

token="433288264:AAEgtKVaTSmQ1YOoOhGDxJnD8mp_Tb8fDkg"
chat_id='-1001376475021'
 
#export RR_BUILDTYPE=Unofficial
#export days_to_log=0

#rr_scripts
make

# Send messenger for telegram
sendMsg
