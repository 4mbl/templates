project_type=$1
project_name=$2

if [ -z "$project_type" ] || [ -z "$project_name" ]; then
    echo "Usage: $0 <type> <project-name>"
    exit 1
fi

init_file="https://raw.githubusercontent.com/4mbl/templates/refs/heads/main/t/$project_type/init.sh"
content=$(curl $init_file -Ls)

if [ -z "$content" ]; then
    echo "Project type not found."
    exit 1
fi

echo "$content" | bash -s $project_name
