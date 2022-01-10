set -e

printf "\033[0;32mDeploying updates to git.its...\033[0m\n"

msg="updating $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi

git add .
git commit --allow-empty -m "$msg" --
git push -u origin master
