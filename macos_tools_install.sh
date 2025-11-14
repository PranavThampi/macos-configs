#! /bin/bash

# Install Homebrew
if ! command -v brew &> /dev/null
then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

# Set Zsh as default shell if not already set
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "Setting Zsh as default shell..."
    brew install zsh
    # Install Oh My Zsh
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    chsh -s $(which zsh)
else
    echo "Zsh is already the default shell."
fi


# Install Homebrew packages
brew install git
brew install zsh-syntax-highlighting
brew install zsh-autosuggestions
brew install --cask localsend
brew install fastfetch
cp -r ./fastfetch ~/.config/
brew install htop
brew install lazydocker
brew install uv
brew install tree
brew install --cask raycast
brew install --cask rectangle
brew install stats
brew install scroll-reverser

#  Install wallpapers
echo "Installing wallpapers..."
read -p "Enter the directory where you want to download wallpapers [default: \$HOME/Pictures]: " WALLPAPER_DIR
WALLPAPER_DIR="${WALLPAPER_DIR:-$HOME/Pictures}"

if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "Creating directory: $WALLPAPER_DIR"
    mkdir -p "$WALLPAPER_DIR"
else
    echo "Directory already exists: $WALLPAPER_DIR"
fi
cd $WALLPAPER_DIR
git clone --depth=1 https://github.com/mylinuxforwork/wallpaper.git
echo "Wallpapers downloaded to: $WALLPAPER_DIR/wallpaper"