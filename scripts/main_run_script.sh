# Run script from project folder after updating and activating venv
codeFolder=~/Code/
cd $codeFolder
echo "Run Script from Project"
echo "Which Project?"
ls
read project
cd $project
git pull
cd src
echo "Which Script?"
ls
read script
source /venv/bin/activate
python /src/$script