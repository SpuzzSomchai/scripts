#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from extendes.linux import Linux
from extendes.Youtube import Youtube
from extendes.rom import Rom

from settings import *
import sys

class Menu:

    @staticmethod
    def getbuild():
        os.system("clear")
        lista = {
            0: "Q - Voltar",
            1: "1 - Atualizar rom",
            2: "2 - Limpar build",
            3: "3 - Make build",
            4: "4 - Enviar AFh",
            5: "5 - Enviar Mega",
            6: "6 - Enviar SourceForce",
            7: "7 - Emviar atualização OTA", }
        for n in lista:
            print(lista[n])
        pegunta = str(input(mmsg))

        if pegunta == 'q':
            Menu.getvoltar()
        elif pegunta == '1':
            Rom.atualizar()
        elif pegunta == '2':
            Rom.limpar()
        else:
            Menu.getbuild()

    @staticmethod
    def getlinux():
        os.system("clear")
        lista = {
            0: "Q - Voltar",
            1: "1 - Tela",
            2: "2 - Monitora HD",
            3: "3 - Limpar RAM",
            4: "4 - Trafico de Rede",
            5: "5 - Google drive",
            6: "6 - HostServe"}

        for n in lista:
            print(lista[n])
        pegunta = str(input(mmsg))
        if pegunta == 'l':
            os.system('clear')
        elif pegunta == 'q':
            Menu.getvoltar()
        elif pegunta == '1':
            Linux.tela()
        elif pegunta == '2':
            Linux.monitorahd()
        elif pegunta == '3':
            Linux.limparam()
        elif pegunta == '4':
            Linux.traficorede()
        elif pegunta == '5':
            Linux.gdrive()
        elif pegunta == '6':
            Linux.hostserve()
        else:
            Menu.getlinux()

    @staticmethod
    def getdivisor():
        print("-" * 80)

    @staticmethod
    def getvoltar():
        os.system('clear')
        getprincipal()

    @staticmethod
    def gettool():
        os.system("clear")
        lista = {
            0: "0 - Voltar",
            1: "1 - Lamp"}

        for n in lista:
            print(lista[n])
        pegunta = str(input(mmsg))

        if pegunta == '':
            Menu.getvoltar()
        elif pegunta == '1':
            Linux.lampservice()
        else:
         Menu.gettool()


def getprincipal():
    Menu.getdivisor()
    lista = {
        0: "Q - Sair",
        1: "1 - Build Android",
        2: "2 - Utilidades linux",
        3: "3 - Tool Extras ",
        4: "5 - Youtube",
        5: "6 - Outros"}

    for n in lista:
        print(lista[n])

    pegunta = str(input(mmsg))
    if pegunta == 'q':
        sys.exit(0)
    elif pegunta == '1':
        Menu.getbuild()
    elif pegunta == '2':
        Menu.getlinux()
    elif pegunta == '3':
        Menu.gettool()
    elif pegunta == '4':
        Menu.gettool()
    elif pegunta == '5':
        Youtube.dowloards()
    #Menu.getprincipal()
