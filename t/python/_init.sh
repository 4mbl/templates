# virtualenv
virtualenv .venv || python3 -m venv .venv
.venv/scripts/activate

# readme
curl https://4mbl.link/files/readme-template -Ls --output README.md

# changelog
curl https://4mbl.link/files/changelog-template -Ls --output CHANGELOG.md

# testing
mkdir -p tests/


# reminders
echo "Search for 'TODO' in the project and update the configuration according to your project."
echo "New project defaults to MIT license, make sure this is okay for the project."
echo "Python modules should use short, lowercase names for modules, preferably without underscores (PEP8)."