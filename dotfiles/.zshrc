# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

ZSH_DISABLE_COMPFIX="true"

plugins=(
	git
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Add this to the end of your ~/.zshrc but make sure to remove all existing nvm.sh related code from ~/.zshrc first.
NVM_SH=""
# nvm.sh location depends on installation method
if [ -s "/usr/local/opt/nvm/nvm.sh" ]; then # Homebrew installer location
  NVM_SH="/usr/local/opt/nvm/nvm.sh"
elif [ -s " ~/.nvm/nvm.sh" ]; then # Direct installer location
  NVM_SH="~/.nvm/nvm.sh"
fi
if [ ! -z "$NVM_SH" ]; then
  export NVM_DIR="~/.nvm"
  nvm_cmds=(nvm node npm)
  for cmd in $nvm_cmds ; do
    alias $cmd="unalias $nvm_cmds && unset nvm_cmds && . $NVM_SH && $cmd"
  done
fi

export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`

bindkey -s ^f "tmux-sessionizer\n"

alias vi=nvim
alias vim=nvim
alias python=python3
