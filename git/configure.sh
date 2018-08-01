
echo "Configuring git..."

git config --global user.name "Vincent Cordobes"
git config --global user.email vincent.cordobes@gmail.com
git config --global core.editor nvim
git config --global pull.rebase true
git config --global merge.tool vimdiff
git config --global push.followTags true

if diff-so-fancy --colors &>/dev/null; then
  git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
fi
