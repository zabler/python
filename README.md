Python Cheat Sheet Mac and VS Code
==================================

This Q&A cheat sheet gives useful suggestions for developing Python code using VS Code on Mac.

![](/fig1.png)


### How to set up Python on Mac?
- Use Homebrew to install pyenv
    - run install skript
        ``` bash
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        ```
    - add path to .zshrc, create file if not there
        ```bash
        touch .zshrc
        echo 'export PATH=/opt/homebrew/bin:$PATH' >> ~/.zshrc
        ```
    - make it available
        ```bash
        source ~/.zshrc
        ```
- Use pyenv to install a (or different) python version incl. pip and make it global, and check it
    ``` bash
    pyenv install X.Y.Z
    pyenv global X.Y.Z
    pyenv version
    ```
- Make it work and check python version
    ``` bash
    echo 'eval "$(pyenv init --path)"' >> ~/.zshrc
    which python
    python -V
    ```
- For each project create an virutalenv with an specific python version and specifc packages

### How to set up Python Path that VS Code recognizes pyenv for every Venv?
- Make pyenv init available for interatice shells (for login shells use .zprofile)
    ```bash
    'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
    'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
    'eval "$(pyenv init -)"' >> ~/.zshrc
    ```

### How to setup an pyenv that has access to core libraries of python to enhance options of building tools like auto-py-to-exe on mac using Python 3.8
- Uninstall current python version
    ```bash
    pyenv uninstall X.X.X
    ```
- Use Homebrew to install tcl-tk tools
    ```bash
    brew install tcl-tk 
    ```
- Add path variable
    ```bash
    echo 'export PATH="/opt/homebrew/opt/tcl-tk/bin:$PATH"' >> ~/.zshrc
    ```
- Reload path file
    ```bash
    source .zshrc
    ```
- Set important variables for correct installation of all core libaries
    ```bash
    export LDFLAGS="-L/opt/homebrew/opt/tcl-tk/lib"
    export CPPFLAGS="-I/opt/homebrew/opt/tcl-tk/include"
    export PKG_CONFIG_PATH="/opt/homebrew/opt/tcl-tk/lib/pkgconfig"
    export PYTHON_CONFIGURE_OPTS="--with-tcltk-includes='-I/opt/homebrew/opt/tcl-tk/include' --with-tcltk-libs='-L/opt/homebrew/opt/tcl-tk/lib -ltcl8.6 -ltk8.6' --enable-framework"
    ```
- Reinstall Python; only works for version 3.8.13
    ```bash
    pyenv install 3.8.13

### How to set up a Virtual Environment
- Go into repository of code, open cmd and run
    ```bash
    python -m venv venv
    ```
- This creates the virtual env with the python version the command was executed, only availabe for the code in the local folder
- For Proof run in the local folder in cmd:
    ```bash
    source venv/bin/activate
    which python
    ```
- Important: It's necessary to have the code in a local folder, not in a synced cloud folder. Otherwise the correct python venv cannot be found or activated.
- To check the installed packages of this virtual env
    ```bash
    pip list
    ```
- To make the dependencies of packages available for other people
    ```bash
    pip freeze > requirements.txt
    ```
- To install packages of foreign Virtual Env
    ```bash
   pip install -r requirements.txt
    ```
- Stop using the virutal env in cmd
    ```bash 
    deactivate
    ```
- Make sure that venv is listed in your .gitignore file
- Virtual Enviroments are automatically detected by VS Code

### Where to find python and its versions?
- List all python versions installed by pyenv
    ```bash
    pyenv versions
    ```
- Location of all python versions installed by pyenv 
    ```bash
    ~/.pyenv/versions/
    ```
- System means all other versions not installed by pyenv; either system's version, homebrew directly installed or other way

### What about pyhton and python3 preinstalled on Mac?
- python
    ```bash
    /usr/bin/python
    ```
- python3
    ```bash
    /usr/bin/python3
    ```
- Just leave them alone; otherwise system wont work

### How to change settings.json in VS Code on Mac?
- Change user settings globally (for the user)
    ```bash
    ~/Library/Application Support/Code/User/settings.json
    ```
- Change user settings locally (in the workspace)
    ```bash
    /.vscode/settings.json
    ```

### What to add to .gitignore?
```
# VSCODE
.vscode

# MAC
.DS_Store
._.DS_Store
**/.DS_Store
**/._.DS_Store
```

### How to add linting for python in VS Code on Mac?
- Install **pylint** as extension or install it as package
    ```bash
    pip install pylint
    ```
- Define which of them to use: Default uses extension (useBundle)
    ```JSON
    "pylint.importStrategy": "useBundle",
    ```
    ```JSON
    "pylint.importStrategy": "fromEnvironment"
    ```
- Customize it
    ```JSON
    "pylint.cwd": "${workspaceFolder}/src",
    "pylint.args": [
        "--max-line-length=200",
    ],
    ```

### How to configure formatting in VS Code on Mac?
- Install **autopep8** as extension or install it as package
    ```bash
    pip install autopep8
    ```
- Define which of them to use: Default uses extension (useBundle)
    ```JSON
    "autopep8.importStrategy": "useBundle",
    ```
    ```JSON
    "autopep8.importStrategy": "fromEnvironment",
    ```
- Enable it in workspace settings.json 
    ```JSON
    "[python]": {
        "editor.defaultFormatter": "ms-python.autopep8",
        "editor.formatOnSave": true,
    },
    ```
- Customize it
    ```JSON
    "autopep8.args": [
        "--max-line-length","200",
        "--aggressive", "--aggressive"],
    ```

### How to configure debugging in VS Code on Mac? 
- open locally
    ```bash
    .vscode/launch.json
    ```
- add configuration in workpspace's .vscode/settings.json (or launch.json)
    ```JSON
    {
      "name": "Debug Python Code",
      "type": "debugpy",
      "request": "launch",
      "program": "${file}",
      "console": "integratedTerminal",
      "args": [
          "--argName",
          "argValue"
        ]
    }
    ```
- If you're using older python version 3.8 or 3.9, use ```"type": "python"``` to avoid errors

### How to check dependecies with Python?
- run python in a shell
    ```Python
    import sys
    print('\n'.join(sys.path))
    ```

### Overview about installed Packages
  ```bash
  pip list
  ```

### Which packages is my code using?
  ```bash
  pipreqs 'PathToProjectFolder'
  ```

### List all installed packages
  ```bash
  pip3 freeze > requirements.txt
  ```

### Delete all packages
  ```bash
  pip3 uninstall -r requirements.txt -y
  ```

### Install a bunch of packages
  ```bash
  pip3 install -r requirements.txt
  ```

### How to structure a python package?
  - github_repo
    - venv
    - dist
    - doc
        - concept
        - pictures
    - src
        - package
            - `__init.py__`
            - `module.py`
            - subfolder
                - `__init.py__`
                - `submodule.py`
    - tests
        - `example.py`
    - .gitignore
    - README.md
    - LICENSE
    - setup.py
    - pyproject.toml

### How to structure a python project
  - github_repo
    - venv
    - doc
        - concept
        - pictures+
    - archive
        - `old_script_a.py`
    - src
        - `mainscript_a.py`
        - `mainscript_b.py`
        - `mainscript_c.py`
        - packageA
            - `__init.py__`
            - `module.py`
            - subfolder
                - `__init.py__`
                - `submodule.py`
        - packageB
            - `__init.py__`
            - `module.py`
            - subfolder
                - `__init.py__`
                - `submodule.py`
        - notpackageC
            - `module.py`
    - tests
        - `test.py`
    - .gitignore
    - README.md
    - LICENSE

### How can files access each other in Python vs. VSCode?
- VS Code: Add the workspace or the src folder to your PYTHONPATH using the launch.json file from VS Code
    ```JSON
    "env": {
                    "PYTHONPATH": "${workspaceRoot}:src"
                }
    ```
    - Using this method all moduls and subfolders are added to PYTHONPATH and can be seen by each other
- Python Only (favorite): Place the main scripts as top-level file directly after the root `src`, so that when pyhton inits the script all folders below are automatically added to PYTHONPATH
- Main Difference: If main-scripts are nested in folders, moduls in parallel folders cannot be assessed when using pyhton only, while in VS Code everything can be found by adding the workspace. In case the code is used without the VS Code IDE, it's still can be used, when the scripts are place top-level, the pythonic way.

### How should I use local developed packages inside my repo?
- Develope them as you wish, but try not to use methods from one package in others, which would cause problems regarding linking to each other when VS Code workspace is not in use 
- On the longterm this subpackages can be outsourced to be there own packages

### How should I use local developed packages from other repos?
- Install local packages by using the -e parameter to benefit from the most recent changes in this packages without having them distributed in knew releases
    ```BASH
    python install -e  path/to/repo/incl/setuppyfile
    ```

### How to run test files on a python package?
- Add a test.py or example.py file for the specific modul in /tests or directly in the specific folder
- Be aware which folder's can be assesed by this file

### What to write into __init__.py in an pyhton package?
- Option 0:
    - Don't create a __init__.py file at all, a modul can also be assesed without
    - But it's helpful to make 
- Option 1:
    - One top-level __init__.py file in the pacakge folder listing all modules
    ```Python
    from . import module
    from .subfolder import submodule
    ```
    - every subfolder needs to have an empty __init__.py file
- Option 2 (favorite):
    - Every folder and subfolder inside the package contains an __init__.py file listing all modules of the folder
    ```Python
    from . import module
    ```

### How to build a python package using setuptools.py?
- Define setup.py
    - IMPORTANT exclude testfiles
    ```Python
        from setuptools import setup

        setup(
            name='package',
            version='0.1.0',    
            description='A example Python package',
            url='https://github.com/shuds13/pyexample',
            author='Stephen Hudson',
            author_email='shudson@anl.gov',
            license='BSD 2-clause',
            packages=['pyexample'],
            install_requires=['mpi4py>=2.0',
                            'numpy',                     
                            ],

            classifiers=[
                'Development Status :: 1 - Planning',
                'Intended Audience :: Science/Research',
                'License :: OSI Approved :: BSD License',  
                'Operating System :: POSIX :: Linux',        
                'Programming Language :: Python :: 2',
                'Programming Language :: Python :: 2.7',
                'Programming Language :: Python :: 3',
                'Programming Language :: Python :: 3.4',
                'Programming Language :: Python :: 3.5',
            ],
        )
    ```
- Define the build system in pyproject.toml
- Start build process after upgrading build package
    ```bash
    python -m pip install --upgrade build
    python -m build 
    ```
- IMPORTANT
    - Result should be on top level folder
    - EEG.info in the package folder

### How to install a local built package in another environment?
- Install the wheel file, stored in the dist folder of the built package
    ```bash
    pip install path/to/local/wheelfile.whl
    ```
- If you want that changes in the local built immidiately affects your code
    ```bash
    pip install -e path/to/local/wheelfile.whl
    ```

### How to make a (new version of my) python package available on pip using twine?
- Before distributing the package on test pypa, name should be test!
pypa
python -m twine upload --repository 'package' dist/*
user: __token__
password: TOKENKEY
pip install -i https://test.pypi.org/simple/ package_test==version
- 
python -m twine upload dist/*
user: username
passwort: passwort
pip install package

### How to run a python script inside a virtual env using cmd?
```bash
source "./venv/bin/activate"
python -u background_script.py
```

### How to add local developed modules/packages? (not recommended)
- edit .zshrc in a shell
    ```bash
    sudo nano .zshrc
    ```
- add PYTHONPATH to .zshrc so that python can find it
    ```bash
    export PYTHONPATH="Path/To/Local/SrcFolder1":"Path/To/Local/SrcFolder2":$PYTHONPATH
    ```
- To avoid error warning in terms of lynting, add in VScode settings.json
    ```JSON
      "python.linting.pylintArgs": [
        "--init-hook",
	    "import sys; sys.path.append('Path/To/Local/SrcFolder1')"
      ]
    ```
- To avoid errors with PyLance add in VScode settings.json
    ```JSON
    "python.analysis.extraPaths": ["Path/To/Local/SrcFolder1"]
    ```

