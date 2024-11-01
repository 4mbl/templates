project_name=$1
prev_cwd=$PWD

if [ -z "$project_name" ]; then
    echo "Usage: $0 <project-name>"
    exit 1
fi


# clone base
git clone --no-checkout https://github.com/4mbl/templates $project_name
cd $project_name
git sparse-checkout init --cone
git sparse-checkout set t/python/
git checkout main
rm -rf .git
rm init.sh
mv t/python/* .
rm -rf t


# virtualenv
(virtualenv .venv || python3 -m venv .venv) && . .venv/bin/activate
pythom3 -m pip install -e .


# readme
curl https://4mbl.link/files/readme-template -Ls --output README.md


# changelog
curl https://4mbl.link/files/changelog-template -Ls --output CHANGELOG.md


# testing
mkdir -p tests/


# reminders
echo ""
echo "# Reminders"
echo "* Search for 'TODO' in the project and update the configuration according to your project."
echo "* New project defaults to MIT license, make sure this is okay for the project."
echo "* Python modules should use short, lowercase names for modules, preferably without underscores (PEP8)."
echo "* Checkout GitHub Workflow templates: https://4mbl.link/gist/github-actions."
echo ""

cd $prev_cwd