Python Cheat Sheet
==================

## Path Variable

###Setting

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


### Path Variablen Prüfen

**with Python**

`import sys`
`print('\n'.join(sys.path))`

**on MAC**

`echo $PYTHONPATH`
`echo $PATH`


## SITE-PACKAGES
### How to find python site-package

**on MAC**
/Library/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages

**on LINUX**
~/.local/lib/python3.6/site-packages


### Overview about installed Packages
```
pip3 list
```


### Which packages is my code using?
`pipreqs 'Projectfolder'`


### List all instaled Packages
```
pip3 freeze > requirements.txt
```


### Delete all packages
```
pip3 uninstall -r requirements.txt -y
```


### Install a bunch of packages

```
pip3 install -r requirements.txt
```



## VSCODE

###GLOBAL/ USER SETTINGS

/Users/nicolaszabler/Library/Application Support/Code/User/settings.json

**Pylint for Lynting**

- Install and Enable
- Args: --disable=all --enable=F,E,unreachable,duplicate-key,unnecessary-semicolon,global-variable-not-assigned,unused-variable,binary-op-exception,bad-format-string,anomalous-backslash-in-string,bad-open-mode

**autopep8 for Formatting**

- Install and Enable
- Args: --aggressive --max-line-length=350

###VIA TERMINAL

`autopep8 --in-place --aggressive --aggressive --max-line-length=350 <file_name>`


###LOCAL/ WORKSPACE SETTINGS

.vscode/settings.json



###Debugging 

.vscode/launch.json



## PACKAGE DEVELOPMENT

### Structure

- built
  - freeze.py
- doc
  - concept
  - pictures
- src
  - `__init.py__`
  - 'module'
    - `__init.py__`
    - `__main.py__`
- test
- .gitignore
- README.md
- License


