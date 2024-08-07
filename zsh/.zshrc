source $HOME/.profile

fastfetch

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /home/joyjosr/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/joyjosr/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
unsetopt beep

# Custom aliases
# vim (im lazy)
alias v="nvim"
alias vim="nvim"
alias vi="nvim"

# movements
alias win="cd `cmd.exe /c echo %systemdrive%%homepath% 2> /dev/null | tr -d '\r' | xargs -0 wslpath`"


alias ll="ls -la"


bindkey '^I' autosuggest-accept
export ZSH_AUTOSUGGEST_STRATEGY=(
    history
    completion
)

# wezterm shell integration
. $Home/etc/profile.d/wezterm.sh

# Bind Ctrl+F to the desired command
# Bind Ctrl+F (represented as "^F") to call the fzf_open function
bindkey -s '^F' 'vim $(fzf --preview "bat --style=numbers --color=always {}")\n' 

# fnm
FNM_PATH="/home/joyjosr/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/joyjosr/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi
