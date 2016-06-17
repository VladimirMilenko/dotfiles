if !has('conceal')
  finish
endif

set conceallevel=2

" syntax keyword jsConcealThis this conceal cchar=@
syntax match jsConcealFunction /\<function\>/ skipwhite conceal cchar=ƒ

" hi def link jsConcealFunction jsFunc
hi def link jsConcealFunction javaScriptIdentifier

" Should make this dyanmic
hi Conceal ctermbg=None ctermfg=245 gui=italic guibg=none guifg=#e06c75

