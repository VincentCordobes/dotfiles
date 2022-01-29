DIRNAME="$(cd "$(dirname "$0")";pwd -P)"

ln -sf $DIRNAME/config ~/.config/sway/config
ln -sf  ~/dotfiles/sway/kanshi ~/.config/kanshi/config
ln -sf  ~/dotfiles/sway/sway-session.target ~/.config/systemd/user/sway-session.target
ln -sf  ~/dotfiles/sway/swayidle.service ~/.config/systemd/user/swayidle.service
