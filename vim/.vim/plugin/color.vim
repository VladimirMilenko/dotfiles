if has('termguicolors')
  set termguicolors
end

augroup MyCustomColors
  autocmd!
  autocmd ColorScheme * hi! Tabline cterm=NONE gui=NONE
        \| hi! TablineFill cterm=NONE gui=NONE
        \| hi! TablineSel cterm=reverse gui=reverse
        \| hi! Comment cterm=italic gui=italic
        \| hi! link Conceal NonText
  " Highlight long lines
  " autocmd ColorScheme * hi! OverLength ctermbg=red ctermfg=white guibg=#592929

  autocmd ColorScheme codedark,plain hi! link Error ErrorMsg
        \| hi! link ALEError ErrorMsg
        \| hi! link ALEErrorSign ErrorMsg
        \| hi! link ALEWarning GitGutterChange
        \| hi! link ALEWarningSign GitGutterChange

  autocmd ColorScheme codedark,plain hi! link StartifyHeader Normal
        \| hi! link StartifyFile Directory
        \| hi! link StartifyPath LineNr
        \| hi! link StartifySlash StartifyPath
        \| hi! link StartifyBracket StartifyPath
        \| hi! link StartifyNumber Title
augroup END

let g:gruvbox_contrast_dark='hard'
let g:gruvbox_invert_selection=0
let g:gruvbox_italicize_comments=1
let g:one_allow_italics = 1

let s:hour = strftime('%H')
let s:month = strftime('%m')
let s:summerNight = (s:month >= 4 && s:month < 10) && (s:hour <= 21 && s:hour > 7)
let s:winterNight = s:hour <= 18 && s:hour > 8

if s:summerNight || s:winterNight
  set background=dark
else
  set background=light
endif

try
  colorscheme plain
catch
endtry

