DIRNAME="$(cd "$(dirname "$0")";pwd -P)"

ln -sf $DIRNAME/config ~/.config/sway/config
ln -sf  ~/dotfiles/sway/kanshi ~/.config/kanshi/config
