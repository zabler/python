Python Cheat Sheet Mac
======================

This Q&A cheat sheet gives useful suggestions for developing Python code using VS Code on Mac.

![](https://imgs.xkcd.com/comics/python_environment.png)


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
    ```

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

### How to add linting for python in VS Code on Mac?
- Install **pylint** package
    ```bash
    pip install pylint
    ```
- Enable it in workpspace settings.json
    ```JSON
    "python.linting.pylintEnabled": true,
    ```
- Use specific arguments for individual linting, as well as adding local packages to avoid import erros
    ```JSON
      "python.linting.pylintArgs": [
        "--max-line-length",
        "200",
        "--disable",
        "line-too-long"
        "--init-hook",
      ]
    ```

### How to change formatting in VS Code on Mac?
- Install **autopep8**
    ```bash
    pip install pep8
    pip install --upgrade autopep8
    ```
- Enable it in workpspace settings.json (FORMAT ON TYPE NOT WORKING)
    ```JSON
    "python.formatting.provider": "autopep8",
    "editor.formatOnType": true,
    "editor.formatOnSave": true,
    ```
- Use specific arguments for individual formatting
    ```JSON
    "python.formatting.autopep8Args": [
        "--max-line-length",
        "200",
        "--aggressive",
        "--aggressive",
    ],
    ```

### How to configure debugging? 
- open locally
    ```bash
    .vscode/launch.json
    ```
- add configuration
    ```JSON
    {
      "name": "Python: Current File",
      "type": "python",
      "request": "launch",
      "program": "${file}",
      "console": "integratedTerminal",
      "args": [
          "--argName",
          "argValue"
        ]
    }
    ```
- or global to settings.json
    ```JSON
        "launch": {
        "version": "0.2.0",
        "configurations": [
            {
                "name": "Python: Current File",
                "type": "python",
                "request": "launch",
                "program": "${file}",
                "console": "integratedTerminal"
            }
        ]
    }
    ```

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
    - .gitignore
    - README.md
    - LICENSE
    - setup.py
    - pyproject.toml

### What to write into __init__.py in an pyhton package?
- Option 1:
    - One top-level __init__.py file in the pacakge folder listing all modules
    ```Python
    from . import module
    from .subfolder import submodule
    ```
    - every subfolder needs to have an empty __init__.py file
- Option 2:
    - Every folder and subfolder inside the package contains an __init__.py file listing all modules of the folder
    ```Python
    from . import module
    ```

### How to run test files on a python package?
- Add a test.py file for the specific modul in /tests
- Add the package path to your PYTHONPATH for debbuging using the launch.json file from VSCODe
    ```JSON
    "env": {
                    "PYTHONPATH": "${workspaceRoot}:src:medipy"
                }
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

