#!/usr/bin/env bash


donerom(){ 
	exitCode=$?
	if [ ${exitCode} -eq 0 ]; then
	    cd $
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

enviar_afh() {


		cd ~/rr/out/target/product/sanders
		#echo -e ${ylw}"\n\n ▼ ROM está sendo enviada para AFH?\n"${txtrst}
		curl -T RR*.zip ftp://uploads.androidfilehost.com --user j144df:PTVWatWG2rbA


}