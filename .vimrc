set nu
syntax on
colors monokai
set mouse=a

" 'normale' Funktion der Backspace-Taste
set backspace=indent,eol,start

" intelligentes Einrücken beim Programmieren
set softtabstop=4
set shiftwidth=4
set autoindent
set expandtab
set smartindent

" Kommt noch
" autocmd FileType python map <buffer> <space> :w<CR>:exec '!python3' shellescape (@%, 1) <CR>
" autocmd FileType python imap <buffer> <space> <esc>:w<CR>:exec '!python3' shellescape (@%, 1)<CR>

" Auskommentieren mit ,cc
" Einkommentieren mit ,cu
augroup commenting_blocks_of_code
  autocmd!
  autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
  autocmd FileType sh,ruby,python   let b:comment_leader = '# '
  autocmd FileType conf,fstab       let b:comment_leader = '# '
  autocmd FileType tex              let b:comment_leader = '% '
  autocmd FileType mail             let b:comment_leader = '> '
  autocmd FileType vim              let b:comment_leader = '" '
augroup END
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
