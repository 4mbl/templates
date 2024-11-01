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
git sparse-checkout set t/golang/
git checkout main
rm -rf .git
rm init.sh
mv t/golang/* .
rm -rf t


# init go module
go mod init github.com/4mbl/$project_name

# project structure
# inspired by:
# https://github.com/golang-standards/project-layout
# https://gist.github.com/ayoubzulfiqar/9f1a34049332711fddd4d4b2bfd46096

mkdir -p cmd/$project_name/
touch cmd/app-name/main.go

mkdir -p cmd/another-app/
touch cmd/another-app/main.go

mkdir internal/config/ -p
touch internal/config/config.go

mkdir internal/database/ -p
touch internal/database/database.go

mkdir pkg/mypackage/ -p
touch pkg/mypackage/mypackage.go

mkdir api/handler/ -p
touch api/handler/handler.go

mkdir api/middleware/ -p
touch api/middleware/middleware.go

mkdir web/static/css/ -p
mkdir web/static/js/ -p

mkdir web/templates/html/ -p
touch web/templates/html/index.html

mkdir scripts/ -p
touch scripts/build.sh
touch scripts/deploy.sh

mkdir configs/ -p
touch configs/development.yml
touch configs/production.yml

mkdir tests/unit/ -p
mkdir tests/integration/ -p

mkdir docs/ -p


echo "Created project with the following structure:
./
├── cmd/
│   ├── app-name/
│   │   ├── main.go         # Application entry point
│   │   └── ...             # Other application-specific files
│   └── another-app/
│       ├── main.go         # Another application entry point
│       └── ...
├── internal/               # Private application and package code
│   ├── config/
│   │   ├── config.go       # Configuration logic
│   │   └── ...
│   ├── database/
│   │   ├── database.go     # Database setup and access
│   │   └── ...
│   └── ...
├── pkg/                    # Public, reusable packages
│   ├── mypackage/
│   │   ├── mypackage.go    # Public package code
│   │   └── ...
│   └── ...
├── api/                     # API-related code (e.g., REST or gRPC)
│   ├── handler/
│   │   ├── handler.go       # HTTP request handlers
│   │   └── ...
│   ├── middleware/
│   │   ├── middleware.go    # Middleware for HTTP requests
│   │   └── ...
│   └── ...
├── web/                     # Front-end web application assets
│   ├── static/
│   │   ├── css/
│   │   ├── js/
│   │   └── ...
│   └── templates/
│       ├── index.html
│       └── ...
├── scripts/                 # Build, deployment, and maintenance scripts
│   ├── build.sh
│   ├── deploy.sh
│   └── ...
├── configs/                 # Configuration files for different environments
│   ├── development.yaml
│   ├── production.yaml
│   └── ...
├── tests/                   # Unit and integration tests
│   ├── unit/
│   │   ├── ...
│   └── integration/
│       ├── ...
├── docs/                    # Project documentation
├── .gitignore               # Gitignore file
├── go.mod                   # Go module file
├── go.sum                   # Go module dependencies file
└── CHANGELOG.md             # Project changelog
└── LICENSE                  # Project license
└── README.md                # Project README
"


# readme
curl https://4mbl.link/files/readme-template -Ls --output README.md


# changelog
curl https://4mbl.link/files/changelog-template -Ls --output CHANGELOG.md


# reminders
echo ""
echo "# Reminders"
echo "* Search for 'TODO' in the project and update the configuration according to your project."
echo "* New project defaults to MIT license, make sure this is okay for the project."
echo "* Checkout GitHub Workflow templates: https://4mbl.link/gist/github-actions."
echo ""

cd $prev_cwd