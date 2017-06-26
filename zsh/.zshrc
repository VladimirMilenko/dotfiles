# vim:ft=zsh:

##############################################################
# Profiling.
##############################################################

# uncomment to profile & run `zprof`
# zmodload zsh/zprof

##############################################################
# zPlug.
##############################################################

if [[ ! -f ~/.zplug/init.zsh ]]; then
  if (( $+commands[git] )); then
    git clone https://github.com/zplug/zplug ~/.zplug
  else
    echo 'git not found' >&2
    exit 1
  fi
fi

source ~/.zplug/init.zsh

zplug "zplug/zplug", hook-build:"zplug --self-manage"
NVM_LAZY_LOAD=true
# NVM_AUTO_USE=true
zplug "lukechilds/zsh-nvm"

zplug "zimframework/zim", depth:1, use:"init.zsh", hook-build:"ln -sf $ZPLUG_ROOT/repos/zimframework/zim ~/.zim"
# Zim settings
zmodules=(
  directory
  environment
  history
  meta
  input
  utility
  spectrum
  syntax-highlighting
  history-substring-search
  prompt
  completion
)

zplug "modules/osx", depth:1, from:prezto
zplug "ahmedelgabri/pure", depth:1, use:"{async,pure}.zsh"
zplug "knu/z", use:"z.sh", depth:1, defer:1
zplug "lukechilds/zsh-better-npm-completion", defer:1
zplug "maxmellon/yarn_completion", defer:1
zplug "zsh-users/zsh-autosuggestions", defer:1
zplug "b4b4r07/emoji-cli"

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# zplug load --verbose
zplug load

zprompt_theme="pure"
ztermtitle="%n@%m:%~"
zdouble_dot_expand="true"
zhighlighters=(main brackets pattern cursor root)
ZSH_AUTOSUGGEST_USE_ASYNC=true
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=default,fg=red,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=default,fg=blue,bold'

##############################################################
# CONFIG.
##############################################################

for config (~/.dotfiles/zsh/config/*.zsh) source $config
for func (~/.dotfiles/zsh/config/functions/*.zsh) source $func

##############################################################
# ENV OVERRIDES
##############################################################
# Make some commands not show up in history
HISTIGNORE="ls:ls *:cd:cd -:pwd;exit:date:* --help"
HISTSIZE=100000
SAVEHIST=$HISTSIZE

##############################################################
# Custom/Plugins
###############################################################
export GITHUB_USER="ahmedelgabri"
export PROJECTS="$HOME/Sites/dev"

export FZF_DEFAULT_OPTS='--min-height 30 --height 50% --reverse --tabstop 2 --multi --margin 0,3,3,3'
export FZF_DEFAULT_COMMAND='rg --no-messages --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
if [ -x ~/.vim/plugged/fzf.vim/bin/preview.rb ]; then
  export FZF_CTRL_T_OPTS="--preview '~/.vim/plugged/fzf.vim/bin/preview.rb {} | head -200'"
fi
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview' --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort' --header 'Press CTRL-Y to copy command into clipboard' --border"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

export HOMEBREW_CASK_OPTS="--appdir=$HOME/Applications"
export HOMEBREW_INSTALL_BADGE="🍕"
export HOMEBREW_NO_ANALYTICS=1
# export HOMEBREW_NO_INSECURE_REDIRECT=1
# export HOMEBREW_CASK_OPTS=--require-sha

SYMBOLS=(
"λ"
"ϟ"
"▲"
"∽"
)

export PURE_PROMPT_SYMBOL="${SYMBOLS[$RANDOM % ${#SYMBOLS[@]}]}"

##############################################################
# TOOLS.
##############################################################

(( $+commands[grc] )) && source "`brew --prefix`/etc/grc.bashrc"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

##############################################################
# LOCAL.
##############################################################

[ -f ~/.zshrc.local ] && source ~/.zshrc.local

