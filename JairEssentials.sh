# Dependencies
pacman -S neovim    --nocofirm
pacman -S npm       --nocofirm
pacman -S python    --nocofirm
pacman -S tmux      --nocofirm
npm i -g yarn
pip install neovim

git clone https://github.com/jsec/tmux-night-owl.git
tmux source-file "/path/to/repository/tmux-night-owl.conf"

# Fonts
git clone https://aur.archlinux.org/ttf-iosevka.git
cd ttf-iosevka
makepkg -si
cd $HOME
# wget Repo to custom alacritty.yml



# Oh My Zsh Config
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh) $(whoami)
# wget repo to .zshrc
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

cd $HOME

# Neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# wget Repo to vimrc Dirs
nvim +'PlugInstall --sync' +qa

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
