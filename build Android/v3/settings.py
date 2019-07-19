#!/usr/bin/env python3

import getpass
import os

mUSER="/home/j144df"
# Build
mSOURCE="aosp"
mHOME="/home/j144df/" + mSOURCE
mDEVICE="sanders"
outdir = '/out/target/product/sanders/'
mBuildEnvsetup = ". build/envsetup.sh &&   lunch " + mSOURCE + "_" + mDEVICE + "-userdebug  && make " + mSOURCE + " -j16"

#CCache
#mCCACHE="export USE_CCACHE=1"
#mCCACHE_DIR="export CCACHE_DIR=/home/j144df/.ccache-pie/" + mSOURCE
#mCCACHE_SIZE="50"  #GB
#mCCACHE_SET= mHOME + "/prebuilts/misc/linux-x86/ccache/ccache -M " + mCCACHE_SIZE + "G"

# Specify token to telegram
botoken = "433288264:AAEgtKVaTSmQ1YOoOhGDxJnD8mp_Tb8fDkg"
botchat_id = '-1001376475021'

# Mega sync
dirmega = "etc/documentos/Mega/"

# Menu
msg = '\nEscolha no menu Q para sair L para limpar a tela >>> '

# custom source
worktree = mUSER + '/etc/'

