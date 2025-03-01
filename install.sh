#!/bin/bash

echo "WELL CUM! digo digo WELCOME..."

echo "installing basic things"
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm base-devel firefox

echo "creating important folders"
mkdir -p "$HOME/work"
mkdir -p "$HOME/personal"

echo "installing yay..."
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

yay -S --noconfirm neovim curl zsh alacritty gcc cmake python python-pip nodejs yarn pnpm go cargo fzf ripgrep tmux brave-bin neofetch nerdfetch ttf-jetbrains-mono
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "installing brew..."
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> "$HOME/.zshrc"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew install franpfeiffer/t2/t2

DOTFILES_REPO="https://github.com/franpfeiffer/.dotfiles.git"
DOTFILES_DIR="$HOME/.dotfiles"

echo "cloning dotfiles..."
git clone "$DOTFILES_REPO" "$DOTFILES_DIR"

echo "moving dotfiles..."
mv -f "$DOTFILES_DIR/alacritty/.config/alacritty" "$HOME/.config/"
mv -f "$DOTFILES_DIR/bin/tmux-sessionizer" "$HOME/.local/bin/"
mv -f "$DOTFILES_DIR/i3/.config/i3" "$HOME/.config/"
mv -f "$DOTFILES_DIR/i3status/.config/i3status" "$HOME/.config/"
mv -f "$DOTFILES_DIR/nvim/.config/nvim" "$HOME/.config/"
mv -f "$DOTFILES_DIR/picom/.config/picom" "$HOME/.config/"
mv -f "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/"
mv -f "$DOTFILES_DIR/zshrc/.zshrc" "$HOME/"
echo "dotfiles moved"

echo "creating a sshkey for github..."
ssh-keygen -t ed25519 -C "franciscopfeiffer.business@gmail.com" -f "$HOME/.ssh/"

echo "REMEMBER TO INSTALL THE WALLPAPERS"
echo "done <3"
