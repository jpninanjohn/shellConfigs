echo "Pull my saved aliases"
git clone git@github.com:jpninanjohn/aliases.git

echo "Checkout the branch for fish shell"
git checkout fish

echo "Install fd-find"
sudo dnf install fd-find -y

echo "Install rg"
sudo dnf install ripgrep -y

echo "Install starship"
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

echo "Install fish"

dnf install fish -y

echo "Replace fish config with the one in this repo"
rm -rf ~/.config/fish
cp fish* ~/.config/fish

echo "Install omf"
curl -L https://get.oh-my.fish | fish

echo "Install fisher"
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

echo "Install pyenv plugin for fish"
echo "Ensure pyenv is installed before this runs"
omf update
omf install pyenv


echo "Install fzf"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install 
fisher install PatrickF1/fzf.fish

echo "Install rustup and rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "Install gg"
git clone git@github.com:thecasualcoder/gg.git ~/gg
cd ~/gg
cargo install --path .
cd -

echo "Cloning all repositories based on saved ggConf"
gg clone


echo "Install terminator"
sudo dnf install terminator -y
rm -rf ~/.config/terminator

echo "Replace terminator config"
cp -r terminator ~/.config/terminator

echo "Setting up using ansible"
cd devSetup

echo "Install ansible"
pip3 install wheel
pip3 install ansible

echo "Using localhost as target"
ansible-playbook -v -i inventory -u root "devbox.yml" -K

echo "Install pgcli"
pip3 install psycopg2
pip3 install pgcli