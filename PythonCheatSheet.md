Python Cheat Sheet
==================

Setting Python Path Variable
----------------------------

**on MAC**
- open terminal in home directory ~/
  
    `` sudo nano .zshrc ``

- add at eof

    `` export PYTHONPATH="/Library/Frameworks/Python.framework/Versions/3.1/bin:${PYTHONPATH} ``

    or

    `` export PATH="/Library/Frameworks/Python.framework/Versions/3.1/bin:${PATH} ``

- save the file

**on LINUX**

- open terminal in home directory ~/

  `sudo nano .bashrc`

- add at eof

  `export PYTHONPATH="/Pfad/zu/Codefolder/in/welchem/gitreposbzwModule/liegen:$PYTHONPATH"`

**on WINDOWS**

- lokale Umgebungsvariable in Systemeinstellungen ändern:
  "/Pfad/zu/Codefolder/in/welchem/gitreposbzwModule/liegen"



## Path Variablen Prüfen

**with Python**

`import sys`
`print('\n'.join(sys.path))`

**on MAC**

`echo $PYTHONPATH`
`echo $PATH`



##How to find python site-package

**on MAC**
/Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages

**on LINUX**
~/.local/lib/python3.6/site-packages



## Overview about installed Packages

## Which packages is my code using?

## Reinstall all Packages