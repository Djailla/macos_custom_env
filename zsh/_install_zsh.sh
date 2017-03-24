# Install ZSH
brew install zsh

# Install Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Deploy theme
cp djailla.zsh-theme ~/.oh-my-zsh/themes/

# Deploy ZSH configururation
cp zsh_config.txt ~/.zshrc