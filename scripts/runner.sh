# Run script from project folder after updating and activating venv
# TODO: make this script more variable with options to be selected rather than be written
echo "Run Script from Project"
codeFolder=~/Code/
cd $codeFolder
echo "Which Project?"
ls
read project
cd $project
git pull
cd src
echo "Which Script?"
ls
read script
cd ..
source venv/bin/activate
python -u ./src/$script