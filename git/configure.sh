
echo "Configuring git..."

git config --global user.name "Vincent Cordobes"
git config --global user.email "vincent.cordobes@gmail.com"
git config --global core.editor nvim
git config --global pull.rebase true
git config --global merge.tool vimdiff
git config --global push.followTags true
git config --global rebase.autoStash true
# git config --global user.signingkey 925DE1BD044AA56D
# git config --global commit.gpgsign true

if diff-so-fancy --colors &>/dev/null; then
  git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
fi

if delta --help &> /dev/null; then 
  git config --global core.pager delta
  git config --global interactive.diffFilter "delta --color-only"
  git config --global delta.navigate true
  git config --global delta.minus-style "#e9d8d8 #5a414d"
  git config --global delta.minus-emph-style "#e9d8d8 #794a56"
  git config --global delta.plus-style "#dfe9d8 #405543"
  git config --global delta.plus-emph-style "#dfe9d8 #47704c"
  git config --global delta.syntax-theme Nord
fi
