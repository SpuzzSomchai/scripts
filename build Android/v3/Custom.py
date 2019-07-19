#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import shutil

from settings import *
from menu import *


class Custom:

    @staticmethod
    def updateSource():
        os.chdir(mHOME)
        Custom.getCleanDisplay
        #Errro use 
        # repo sync --force-sync
        #os.system("repo sync -c -f --force-sync  --no-tags --no-clone-bundle --force-broken")
       # os.system("repo sync -f --force-sync  --no-tags  --force-broken && cd ~/aosp/hardware/qcom/audio-caf/msm8996/ && git fetch https://github.com/LineageOS/android_hardware_qcom_audio refs/changes/22/239522/1 && git cherry-pick FETCH_HEAD")
        os.system("repo sync -f --force-sync  --no-tags  --force-broken -j8")

    @staticmethod
    def makeClean():
        ask = int(input("[ 1]- Clean full \n[ 2]- Dirty\n"))
        os.chdir(mHOME)
        if ask == 1:
            os.system("make clean")
            type = "Clean full selected"
        else:
            os.system("rm -rf " + mHOME + outdir + "data")
            os.system("rm -rf " + mHOME + outdir + "recovery")
            os.system("rm -rf " + mHOME + outdir + "root")
            os.system("rm -rf " + mHOME + outdir + "system")
            os.system("rm -rf " + mHOME + outdir + "utilities")
            os.system("rm -rf " + mHOME + outdir + "boot")
            os.system("rm -rf " + mHOME + outdir + "combined")
            os.system("rm -rf " + mHOME + outdir + "kernel")
            os.system("rm -rf " + mHOME + outdir + "ramdisk")
            os.system("rm -rf " + mHOME + outdir + "obj/APPS/Sett*")
            os.system("rm -rf " + mHOME + outdir + "obj/PACKAGING")
            os.system("rm -rf " + mHOME + outdir + "ramdisk")
            os.system("rm -rf " + mHOME + outdir + "vendor")
            os.system("rm -rf " + mHOME + outdir + "obj/ETC/system_build_prop_intermediates")
            os.system("rm -rf " + mHOME + outdir + "ota_temp/RECOVERY/RAMDISK")
            os.system("rm -rf " + mHOME + outdir + "obj/PACKAGING/target_files_intermediates")
            # os.system("rm -rf " + mHOME + outdir + "obj/PACKAGING/apkcerts_intermediates")
            # os.system("rm -rf " + mHOME + outdir + "obj/KERNEL_OBJ")
            # os.system("rm -rf " + mHOME + outdir + "symbols")
            os.system("rm -rf " + mHOME + outdir + "*.*")
            type = "Dirty selected"
        print("Done!!! " + type)

    @staticmethod
    def makeRom():
        os.chdir(mHOME)
        Custom.getCleanDisplay()
        os.system("~/devx12/env.sh")
        # Custom.setMsgBot()
        # Custom.getCcache()

    # os.system(mBuildEnvsetup)

    # print( "Start : %s" % time.ctime())
    # time.sleep(300)
    # os.system("systemctl suspend")

    @staticmethod
    def getCleanDisplay():
        os.system("clear")

    @staticmethod
    def getCcache():
        os.system("~/devx12/env.sh")

    @staticmethod
    def setUpAfh():
        Custom.getCleanDisplay()
        os.chdir(mHOME + outdir)
        os.system("pwd")
        print("▼ ROM está sendo enviada para AFH?\n")
        os.system("curl -T Ha*.zip  ftp://uploads.androidfilehost.com --user j144df:PTVWatWG2rbA")

    @staticmethod
    def setUpsourceforce():
        Custom.getCleanDisplay()
        os.chdir(mHOME + "/" + outdir)
        print("▼ ROM está sendo enviada para AFH?\n")
        os.system("scp RR*.zip jadilson12@frs.sourceforge.net:/home/frs/project/sanders/RR-Pie/")


    @staticmethod
    def getDeviceSource():

        os.chdir(worktree)

        Custom.getCleanDisplay()

        # Device
        print("\n▼ Downloard the device:" + mDEVICE + "\n")
        if os.path.isdir(worktree + 'sanders'):
            print("\n Device has been downloaded")

        else:
            os.system('git clone https://github.com/devx12/device_motorola_sanders -b xtended-pie sanders')

        # Kernel
        print("\n▼ Downloard the Kernel:" + mDEVICE + "\n")
        if os.path.isdir(worktree + 'msm8953'):
            print("\n Kernel has been downloaded")

        else:
            os.system('git clone https://github.com/devx12/kernel_motorola_msm8953 -b 9.0 msm8953')

    @staticmethod
    def getCherryPck():
        os.chdir(worktree + 'msm8953')
        os.system('pwd')
        while True:
            ask = input('HASH: ')
            if ask == '0':
                break
            elif ask =='a':
                os.system('git cherry-pick --abort')
            elif ask =='c':
                os.system('git cherry-pick --continue')
            else:
                os.system('git cherry-pick ' + ask)
