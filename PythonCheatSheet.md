Python Cheat Sheet
==================

### How to set up Python on Mac?
- Use Homebrew to install pyenv
    - run install skript
        ``` 
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        ```
    - add path to .zshrc, create file if not there
        ```
        touch .zshrc
        echo 'export PATH=/opt/homebrew/bin:$PATH' >> ~/.zshrc
        ```
    - make it available
        ```
        source ~/.zshrc
        ```
- Use pyenv to install a (or different) python version incl. pip and make it global, and check it
    ``` 
    pyenv install X.Y.Z
    pyenv global X.Y.Z
    pyenv version
    ```
- Make it work and check python version
    ``` 
    echo 'eval "$(pyenv init --path)"' >> ~/.zshrc
    which python
    python -V
    ```
- For each project create an virutalenv with an specific python version and specifc packages

### How to set up a Virtual Environment
- Go into repository of code, open cmd and run
    ``` 
    python -m venv venv
    ```
- This creates the virtual env with the python version the command was executed, only availabe for the code in the local folder
- For Proof run in the local folder in cmd:
    ``` 
    source venv/bin/activate
    which python
    ```
- To check the installed packages of this virtual env
    ``` 
    pip list
    ```
- To make the dependencies of packages available for other people
    ``` 
    pip freeze > requirements.txt
    ```
- To install packages of foreign Virtual Env
    ``` 
   pip install -r requirements.txt
    ```
- Stop using the virutal env in cmd
    ``` 
    deactivate
    ```
- Make sure that venv is listed in your .gitignore file
- Virtual Enviroments are automatically detected by VS Code

### Where to find python and its versions?
- List all python versions installed by pyenv
    ``` 
    pyenv versions
    ```
- Location of all python versions installed by pyenv 
    ``` 
    ~/.pyenv/versions/
    ```

### What about pyhton and python3 preinstalled on Mac?
- python
    ``` 
    /usr/bin/python
    ```
- python3
    ``` 
    /usr/bin/python3
    ```
- Just leave them alone; otherwise system wont work

### How to change settings.json in VS Code on Mac?
- Change user settings globally (for the user)
    ```
    ~/Library/Application Support/Code/User/settings.json
    ```
- Change user settings locally (in the workspace)
    ```
    /.vscode/settings.json
    ```

### How to add linting for python in VS Code on Mac?
- Install **pylint** package
    ```
    pip install pylint
    ```
- Enable it in workpspace settings.json
    ```
    "python.linting.pylintEnabled": true,
    ```
- Use specific arguments for individual linting, as well as adding local packages to avoid import erros
    ```
      "python.linting.pylintArgs": [
        "--max-line-length",
        "200",
        "--disable",
        "line-too-long"
        "--init-hook",
	    "import sys; sys.path.append('Path/To/Local/SrcFolder1')"
      ]
    ```

### How to change formatting in VS Code on Mac?
- Install **autopep8**
    ```
    pip install pep8
    pip install --upgrade autopep8
    ```
- Enable it in workpspace settings.json (FORMAT ON TYPE NOT WORKING)
    ```
    "python.formatting.provider": "autopep8",
    "editor.formatOnType": true,
    "editor.formatOnSave": true,
    ```
- Use specific arguments for individual formatting
    ```
    "python.formatting.autopep8Args": [
        "--max-line-length",
        "200",
        "--aggressive",
        "--aggressive",
    ],
    ```

### How to configure debugging? 
- open locally
    ```
    .vscode/launch.json
    ```
- add configuration
    ```
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
    ```
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
    ```
    import sys
    print('\n'.join(sys.path))
    ```

### Overview about installed Packages
  ```
  pip list
  ```

### Which packages is my code using?
  ```
  pipreqs 'PathToProjectFolder'
  ```

### List all installed packages
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

### How to structure a python package?
  - venv
  - built
  - doc
    - concept
    - pictures
  - src
    - `__init.py__`
    - 'module'
        - `file.py`
        - `__init.py__`
        - `__main.py__`
            - subfolder
                - `__init.py__`
                - `subfile.py`
  - test
  - .gitignore
  - README.md
  - LICENSE

### How to add local developed modules/packages?
- edit .zshrc in a shell
    ```
    sudo nano .zshrc
    ```
- add PYTHONPATH to .zshrc so that python can find it
    ```
    export PYTHONPATH="Path/To/Local/SrcFolder1":"Path/To/Local/SrcFolder2":$PYTHONPATH
    ```
- To avoid error warning in terms of lynting, add in VScode settings.json
    ```
      "python.linting.pylintArgs": [
        "--init-hook",
	    "import sys; sys.path.append('Path/To/Local/SrcFolder1')"
      ]
    ```
- To avoid errors with PyLance add in VScode settings.json
    ```
    "python.analysis.extraPaths": ["Path/To/Local/SrcFolder1"]
    ```

### What to write into __init__.py?
- To get access to the packages python files and its functions write into top-level __init__.py
    ```
    import file
    ```
- To get access to subpackages write into top-level __init__.py
    ```
    from . import subfolder
    ```
- To get access to to the subpackages' python files and its functions write into second-level __init__.py
    ```
    import subfile
    ```

### How to use modules and functions from local packages in my code?
- Import of the whole package 
    ```
    import package as pkg
    ````
- Use of functions
    ```
    return = pkg.file.function(variable1, variable2)
    return = pkg.subfolder.file.function(variable1, variable2)

### How to implement test for code?