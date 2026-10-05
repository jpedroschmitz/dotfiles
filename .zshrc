export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

eval "$(/opt/homebrew/bin/brew shellenv)"

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

SPACESHIP_PROMPT_ASYNC=false

zinit light spaceship-prompt/spaceship-prompt
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zdharma-continuum/fast-syntax-highlighting

# ----------------------------------------
# ZSH - Appearance & Theme Options
# ----------------------------------------

# Avoid printing % character at first line
unsetopt PROMPT_SP

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

source $HOME/.aliases

export XDG_CONFIG_HOME="$HOME/.config"
export GPG_TTY=$(tty)

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Ruby gem executables (kamal)
export GEM_HOME=$HOME/.gem
export PATH="$HOME/.gem/bin:$PATH"

export PATH="/opt/homebrew/opt/postgresql@18/bin:$PATH"

# Claude Code, Cursor Agent
export PATH="$HOME/.local/bin:$PATH"

# Prefer Homebrew binaries
export PATH="/opt/homebrew/bin:$PATH"

# Google Cloud SDK (manual install or Homebrew cask)
GCLOUD_SDK="$HOME/google-cloud-sdk"
[ -d "$GCLOUD_SDK" ] || GCLOUD_SDK="$HOMEBREW_PREFIX/share/google-cloud-sdk"
[ -f "$GCLOUD_SDK/path.zsh.inc" ] && source "$GCLOUD_SDK/path.zsh.inc"
[ -f "$GCLOUD_SDK/completion.zsh.inc" ] && source "$GCLOUD_SDK/completion.zsh.inc"
