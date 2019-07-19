#!/usr/bin/env python3
import os

# Specify token to telegram


botoken = "433288264:AAEgtKVaTSmQ1YOoOhGDxJnD8mp_Tb8fDkg"
botchat_id = '-1001376475021'

# Mega sync
dirmega = "etc/documentos/Mega/"

# Google drive
gduser1 = "jadilson"
gduser2 = "si1720"
caminho = " ~/etc/documentos/G-Drive/"
opcao = " -label "

# Build
rom_custom = "rr"
device = "sanders"
outdir = "/out/target/product/sanders"
dirDev = "/apps/devx12/" + rom_custom

# linux
# user = os.getlogin()
# dir = "/home/" + user + "/etc/DevScripts/"
home = os.getenv("HOME")

# Menu
mmsg = 'Escolha no menu Q para sair L para limpar a tela >>> '
