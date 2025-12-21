export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export ZSH="/Users/joaopedro/.oh-my-zsh"

plugins=(git)

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

zinit light spaceship-prompt/spaceship-prompt
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zdharma/fast-syntax-highlighting

# ----------------------------------------
# ZSH - Appearance & Theme Options
# ----------------------------------------

# Avoid printing % character at first line
unsetopt PROMPT_SP

ZSH_THEME="spaceship"
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  exec_time     # Execution time
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "

alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"

source $HOME/.aliases

eval $(/opt/homebrew/bin/brew shellenv)

# pnpm
export PNPM_HOME="/Users/joaopedro/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

export GPG_TTY=$(tty)

# bun completions
[ -s "/Users/joaopedro/.bun/_bun" ] && source "/Users/joaopedro/.bun/_bun"

export GEM_HOME=$HOME/.gem

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

alias claude="/Users/joaopedro/.claude/local/claude"
