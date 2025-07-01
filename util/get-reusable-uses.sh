# Usage: ./get-reusable-uses.sh .github/workflows/reusable.yaml
filepath="$1"
branch="main"  # Change if your default branch is not 'main'

# Get the origin URL and extract owner/repo
remote_url=$(git config --get remote.origin.url)
# Remove .git suffix if present, extract owner/repo
repo=$(echo "$remote_url" | sed -E 's/.*[:\/]([^\/]+\/[^\/\.]+)(\.git)?$/\1/')

filename=$(basename "$filepath")
echo "${repo}/.github/workflows/${filename}@${branch}"
