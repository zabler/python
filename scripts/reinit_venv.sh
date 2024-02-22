#!/bin/zsh
# Creating Virtual Environment
codeFolder="/Users/nicolaszabler/Code/"
cd $codeFolder
echo "Which pythonVersion?"
pyenv versions
read pythonVersion
echo "Which gitRepo (Get Code remotly by providing ssh url or just reinit the venv without updating the code providing the name)"
ls
read gitRepo
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