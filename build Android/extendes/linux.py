#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from extendes.rom import *


class Linux:

    @staticmethod
    def tela():
        pegunta = int(input("0 - Desligar\n1 - Ligar\n"))
        if pegunta == 0:
            os.system("xset -display :0.0 dpms force off")

        if pegunta == 1:
            os.system("xset -display :0.0 dpms force on")

    @staticmethod
    def monitorahd():
        os.system("watch -n 0,1 df -t ext4")

    @staticmethod
    def limparam():
        os.system("free -m")
        os.system("sudo sysctl -w vm.drop_caches=3")
        os.system("free - m")
        os.system('pause')

    @staticmethod
    def traficorede():
        os.system("sudo nethogs")

    @staticmethod
    def hostserver(p):
        if p =='1':
            print("O apache/mysql foi iniciado")
            os.system("sudo systemctl start httpd")
            os.system("sudo systemctl start mysqld")
        elif p =='0':
            print("O apache/mysql foi parado")
            os.system("sudo systemctl stop httpd")
            os.system("sudo systemctl stop mysqld")


    @staticmethod
    def upsourceforge():

        if rom_custom == "rr":
            os.chdir(home + rom_custom + outdir)
            os.system("scp RR*.zip nomeuser@frs.sourceforge.net:/home/frs/project/nomeuser/" + device + "/")

    @staticmethod
    def upalteracoes():
        # nomeDev = novidades
        if rom_custom == "rr":
            os.chdir(home + rom_custom + outdir)
            os.system("scp RR*.zip nomeuser@frs.sourceforge.net:/home/frs/project/nomeuser/" + device + "/")

    @staticmethod
    def gdrive():

        gask = int(input("O que você precisa? \n1 - Ativar \n2 - Desativar \n "))
        if gask == 1:
            Linux.gdrivemount()
        elif gask == 2:
            Linux.gdriveunmount()

    @staticmethod
    def gdrivemount():
        os.system("clear")
        options = " -label "

        gask = int(input("Qual o drive que você montar? \n1 - Jadilson \n2 - Si1720 \n "))
        if gask == 1:
            os.system("google-drive-ocamlfuse " + options + gduser1 + caminho + gduser1)
        elif gask == 2:
            os.system("google-drive-ocamlfuse " + options + gduser2 + caminho + gduser2)

        print("\nGoogle drive foi montando com sucesso\n")

    @staticmethod
    def gdriveunmount():
        os.system("clear")

        gasku = int(input("Qual o drive que você Desmontar? \n1 - Jadilson \n2 - Si1720 \n "))
        if gasku == 1:
            os.system("fusermount -u " + caminho + gduser1)
        elif gasku == 2:
            os.system("fusermount -u " + caminho + gduser2)

        print("\nGoogle drive foi Desmontando com sucesso\n")

    @staticmethod
    def lampservice():
        os.system("clear")
        dir = "/opt/lamp"

        gasku = int(input("1 - iniciar\n2 - Parar\n3 - Status\n4 - Abrir a Interface"))
        if gasku == 1:
            os.system("sudo " + dir + "/ctlscript.sh start")
        elif gasku == 2:
            os.system("sudo " + dir + "/ctlscript.sh stop")
        elif gasku == 3:
            os.system("sudo " + dir + "/ctlscript.sh status")
        else:
            os.system("sudo " + dir + "/manager-linux-x64.run ")


    @staticmethod
    def hostserve():
        os.system("clear")
        gasku = int(input("1 - iniciar\n2 - Parar\n3 - Status"))
        if gasku == 1:
            os.system("sudo systemctl start httpd")
            os.system("sudo systemctl start mysqld")
        elif gasku == 2:
            os.system("sudo systemctl stop httpd")
            os.system("sudo systemctl stop mysqld")
        elif gasku == 3:
            gasku = int(input("1 - Apache\n2 - Mariadb"))
            if gasku == 1:
                os.system("sudo systemctl status httpd");
            elif gasku == 2:
                os.system("sudo systemctl status mysqld");





