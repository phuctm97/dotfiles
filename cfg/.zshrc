# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Custom aliases.
function gcmDb {
  git fetch --all --prune

  local -r b="$(git rev-parse --abbrev-ref HEAD)"
  if [ "$b" != "master" ]; then
    git fetch origin master:master
    git checkout master
    git branch -D "$b"
  fi
}

# Apply Antigen.
source /usr/local/share/antigen/antigen.zsh
antigen init $HOME/.antigenrc

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
