#!/usr/bin/env sh

command="convert-snippets"

js_snippets_path="~/dotfiles/vim/snippets/javascript_my.snippets"
vscode_snippets_dir="/Users/Vincent/Library/Application\ Support/Code/User/snippets"
declare -a output_paths=("typescriptreact.json" 
                         "javascriptreact.json"
                         "javascript.json"
                         "typescript.json"
                         )

if ! command -v $command 2>/dev/null; then
  echo "$command: command not found\n"
  echo "Please install it via:"
  echo "> npm i -g convert-snippets"
else
  echo "Installing $js_snippets_path into:"
  for file in "${output_paths[@]}"
  do
    output="$vscode_snippets_dir/$file"
    echo "$output"
    eval "$command $js_snippets_path $output"
  done
  echo "Done"
fi

