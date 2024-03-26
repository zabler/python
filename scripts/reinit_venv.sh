#!/bin/zsh
# Change for linux to #!/usr/bin/bash

# Creating Virtual Environment
codeFolder=~/Code/
cd $codeFolder
echo "Which pythonVersion should be used for this venv?"
pyenv versions
read pythonVersion
# TODO: Add check if pythonVersion exist, add stop it 
echo "Which gitRepo should be used?"
echo "Reinit the venv without updating the code typing the name or get code remotly by providing ssh url"
ls
read gitRepo
# TODO: Add check if gitRepo exist
# Maybe two scripts; Update local venv vs update from remote; becuase it will overwrite
if [[ $gitRepo == *"github.com"* ]]; then
	git clone $gitRepo
	repoName=$(echo "$gitRepo" | awk -F/ '{print $2}' | sed 's/\.git//')
	cd $repoName
else
	cd $gitRepo
fi
export PYENV_VERSION=$pythonVersion 
echo "Running Python $pythonVersion"
echo "Creating Virtual Enviroment"
python -m venv venv
source venv/bin/activate
pip install --upgrade pip
if [ -e "requirements.txt" ]; then
    pip install -r requirements.txt
	echo "Installed reqs"
else
    pip freeze > requirements.txt
	pip install -r requirements.txt
	echo "Created and installed reqs"
fi
deactivate
echo "Done"