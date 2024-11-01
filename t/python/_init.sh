# virtualenv
virtualenv .venv || python3 -m venv .venv
.venv/scripts/activate

# readme
curl https://4mbl.link/files/readme-template -Ls --output README.md

# changelog
curl https://4mbl.link/files/changelog-template -Ls --output CHANGELOG.md

# testing
mkdir -p tests/
