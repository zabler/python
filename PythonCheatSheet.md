Python Cheat Sheet
==================

### How to set up Python on Mac?
- Use Homebrew to install pyenv
- genauer beschreiben
- Use pyenv to install a (or different) python version incl. pip and make it global
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
- Use specific arguments for individual linting
    ```
      "python.linting.pylintArgs": [
        "--max-line-length",
        "200",
        "--disable",
        "line-too-long"
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
- open 
    ```
    .vscode/launch.json
    ```
- add configuration
    ```
    {
      "name": "DebugConfig",
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
    - 
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
  - LICENSE

### How to add dependecies of modules?
- edit .zshrc in a shell
    ```
    sudo nano .zshrc
    ```
- add PYTHONPATH and its export at eof
    ```
    PYTHONPATH = "PathToFolder1" : "PathToFolder2"
    export PYTHONPATH
    ```

### How to implement test for code?