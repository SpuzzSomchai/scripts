#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import os

from Custom import *
import sys

class Menu:

    @staticmethod
    def getMenu():

        Menu.separator()
        menu = """
|[ 0] - Setting        |[ 6] - Up for AFH 
|[ 1] - Choice ROM     |[ 7] - Get source the device  
|[ 2] - Update source  |[ 8] - To do Cherry-Pick
|[ 3] - Make Clean     |[ 9] - Up for sourceforce
|[ 5] - Make ROM       |"""
        
        print('\033[32m' + menu + '\033[0;0m')

        Menu.separator()
        ask = str(input(msg))
        if ask == 'q':
            sys.exit(0)
        elif ask == 'l':
            os.system('clear')
        elif ask == '2':
            Custom.updateSource()
        elif ask == '3':
            Custom.makeClean()
        elif ask == '5':
            Custom.makeRom()
        elif ask == '6':
            Custom.setUpAfh()
        elif ask == '7':
            Custom.getDeviceSource()
        elif ask == '8':
            Custom.getCherryPck()
        elif ask == '9':
            Custom.setUpsourceforce()
        Menu.getMenu()

    @staticmethod
    def separator():
        print('\033[32m -\033[0;0m'  * 80, end='')


