#!/bin/bash

ITERM_THEMES=(
"https://raw.githubusercontent.com/morhetz/gruvbox-generalized/master/iterm2/gruvbox-light.itermcolors"
"https://raw.githubusercontent.com/morhetz/gruvbox-generalized/master/iterm2/gruvbox-dark.itermcolors"
"https://raw.githubusercontent.com/chriskempson/base16-iterm2/master/base16-tomorrow.dark.256.itermcolors"
"https://raw.githubusercontent.com/chriskempson/base16-iterm2/master/base16-eighties.dark.256.itermcolors"
"https://raw.githubusercontent.com/chriskempson/base16-iterm2/master/base16-ocean.dark.256.itermcolors"
"https://raw.githubusercontent.com/w0ng/dotfiles/master/iterm2/hybrid.itermcolors"
"https://raw.githubusercontent.com/anunez/one-dark-iterm/master/one-dark.itermcolors"
"https://raw.githubusercontent.com/tyrannicaltoucan/vim-deep-space/master/term/deep-space.itermcolors"
"https://raw.githubusercontent.com/AlessandroYorba/Despacio/tree/master/terminal_colors/despacio.itermcolors"
"https://raw.githubusercontent.com/AlessandroYorba/Despacio/tree/master/terminal_colors/despacio_Midnight.itermcolors"
"https://raw.githubusercontent.com/AlessandroYorba/Despacio/tree/master/terminal_colors/despacio_Sunset.itermcolors"
"https://raw.githubusercontent.com/AlessandroYorba/Despacio/tree/master/terminal_colors/despacio_Pitch.itermcolors"
"https://raw.githubusercontent.com/AlessandroYorba/Despacio/tree/master/terminal_colors/despacio_Twilight.itermcolors"
)

for app in $(find $HOME/Applications -name 'iTerm.app'); do
  for t in "${ITERM_THEMES[@]}"; do
    local NAME="$(basename -s .itermcolors "$t")"
    defaults write -app  $app 'Custom Color Presets' -dict-add "$NAME" "$(curl -sf "$t")"
  done
done

unset -v ITERM_THEMES
