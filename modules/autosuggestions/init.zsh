#
# Integrates zsh-autosuggestions into Prezto.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# disable suggestions entirely for console mode?
#if [[ "$TERM" = linux ]] ; then
    #return
#fi

# Load dependencies.
pmodload 'editor'

# Source module files.
source "${0:h}/external/zsh-autosuggestions.zsh" || return 1

#
# Highlighting
#

# Set highlight color, default 'fg=8'.
zstyle -s ':prezto:module:autosuggestions:color' found \
  'ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE' || ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# Disable highlighting.
if ! zstyle -t ':prezto:module:autosuggestions' color; then
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=''
fi

# set a specific color for console or terminal with few colors, since otherwise it will be very unreadable
if [[ "$TERM" = linux ]] || [[ "$( tput colors 2>/dev/null )" -lt 256 ]] ; then
    # blue
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'
fi


#
# Key Bindings
#

if [[ -n "$key_info" ]]; then
  # vi
  bindkey -M viins "$key_info[Control]F" vi-forward-word
  bindkey -M viins "$key_info[Control]E" vi-add-eol
fi
