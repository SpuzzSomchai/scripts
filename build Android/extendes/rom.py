#!/usr/bin/env python3

from settings import *


class Rom:

    @staticmethod
    def atualizar():
        os.chdir(home + "/"+ rom_custom)
        os.system("repo sync -c -f --force-sync  -j32 --no-tags --no-clone-bundle --force-broken")

    @staticmethod
    def limpar():
        os.chdir(home + rom_custom + outdir)
        pegunta = int(input("1- Limpeza completa \n2- parcial\n"))
        if pegunta == 1:
            os.system("make clean")
            tipo = "Completo"
        else:
            os.system("rm -rf " + home + outdir + "combinedroot")
            os.system("rm -rf " + home + outdir + "data")
            os.system("rm -rf " + home + outdir + "recovery")
            os.system("rm -rf " + home + outdir + "root")
            os.system("rm -rf " + home + outdir + "system")
            os.system("rm -rf " + home + outdir + "utilities")
            os.system("rm -rf " + home + outdir + "boot")
            os.system("rm -rf " + home + outdir + "combined")
            os.system("rm -rf " + home + outdir + "kernel")
            os.system("rm -rf " + home + outdir + "ramdisk")
            os.system("rm -rf " + home + outdir + "system")
            os.system("rm -rf " + home + outdir + "obj/ETC/system_build_prop_intermediates")
            os.system("rm -rf " + home + outdir + "ota_temp/RECOVERY/RAMDISK")
            os.system("rm -rf " + home + outdir + "$outdir/*.*")
            tipo = "Parcial"
        print("Foi limpo com sucesso  do tipo " + tipo)
