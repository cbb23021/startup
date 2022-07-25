# ======================== #
# === 取消限制安裝來源 === #
# ======================== #
sudo spctl --master-disable
 #sudo spctl --master-enable

# ======================== #
# === 取消Terminal招呼 === #
# ======================== #
touch ~/.hushlogin
# rm ~/.hushlogin

# ======================== #
# === Homebrew =========== #
# ======================== #
# 安裝
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# 更新
brew update

# ======================== #
# === packages =========== #
# ======================== #
# 安裝 python3
brew install python3
# 安裝自動跳轉
brew install autojump

# ======================== #
# === Font =============== #
# ======================== #
# 增加文字源安裝
brew tap homebrew/cask-fonts
# 安裝 inconsolata
brew cask install font-inconsolata
# 安裝 Non-ASCII font
brew cask install font-hack-nerd-font

# ======================== #
# === App ================ #
# ======================== #
# 安裝 iTerm2
brew cask install iterm2

# ======================== #
# === Vim ================ #
# ======================== #
# 安裝 Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# 安裝 狀態列插件
pip3 install powerline-status
# 安裝 Jedi 補齊
pip3 install jedi-vim
# 安裝 Jedi python補齊增益
pip3 install python-language-server
# 覆寫設定檔案
cp vimrc ~/.vimrc

# ======================== #
# === Zsh ================ #
# ======================== #
# 安裝 zsh
brew install zsh
# 更新 zsh
brew upgrade zsh
# 修改預設shell為zsh
chsh -s /usr/local/bin/zsh
# 安裝 oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# 安裝 zsh-completions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
# 安裝 zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# 安裝 zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# 安裝 zsh-vi-mode
git clone https://github.com/jeffreytse/zsh-vi-mode ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-vi-mode

# ======================== #
# === rectangle  ========= #
# ======================== #
brew install --cask rectangle

# ======================== #
# === appcleaner  ======== #
# ======================== #
brew install --cask appcleaner

# ======================== #
# === cheatsheet  ======== #
# ======================== #
brew install --cask cheatsheet

# ======================== #
# === 啟動iTerm ========== #
# ======================== #
open -a /Applications/iTerm.app








