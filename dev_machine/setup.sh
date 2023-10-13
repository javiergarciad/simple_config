# update the system
sudo apt update && sudo apt upgrade -y
sudo apt autoremove -y

# install python3
sudo apt install python3 -y
sudo apt install python3-pip -y
sudo apt install python3-venv -y
sudo apt install curl -y
sudo apt install zsh -y

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# make default shell
chsh -s $(which zsh)
# install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

# download from github my default.zshrc
curl https://raw.githubusercontent.com/andrewtavis/dev_machine_setup/master/default.zshrc > ~/.zshrc

