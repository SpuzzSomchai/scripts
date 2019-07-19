#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from menu import *
try:

    Menu.getMenu()
except KeyboardInterrupt:
    print('\nScript closed!!')
    sys.exit()
