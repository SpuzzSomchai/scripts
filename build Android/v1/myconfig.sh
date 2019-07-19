#!/usr/bin

mROM=aosp
mDEVICE=sanders
After_Date=`date --date="" +%Y%m%d`
mOUT=~/$mROM/out/target/product/$mDEVICE
mBUILDZIP="Ha*.zip"
export USE_CCACHE=1
export CCACHE_DIR=$HOME/.ccache-pie/aosp/

token="433288264:AAEgtKVaTSmQ1YOoOhGDxJnD8mp_Tb8fDkg"
chat_id='-1001376475021'


# node ~/etc/bot/server.js 1>/dev/null
#export LC_ALL=C  #Obrigatorio quando usa novo sistema

