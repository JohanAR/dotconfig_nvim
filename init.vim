set nocompatible
filetype plugin on
let mapleader = " "


" vim-plug
call plug#begin('~/.local/share/nvim/plugged')

  "Plug 'chriskempson/vim-tomorrow-theme'
  "Plug 'nanotech/jellybeans.vim'
  "Plug 'tomasr/molokai'
  Plug 'nlknguyen/papercolor-theme'
  Plug 'itchyny/lightline.vim'
  Plug 'mgee/lightline-bufferline'
  "Plug 'ap/vim-buftabline'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  "Plug 'junegunn/fzf.vim'   also necessary?

call plug#end()


" Main editor look and feel
syntax on
set number
set relativenumber
set noshowmode
set nowrap

set magic
set mouse=a
set showtabline=2

" Buffers and files
set fillchars=vert:¦,fold:-
set hidden
set wildmenu
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
let g:netrw_bufsettings = 'noma nomod nu rel nobl nowrap ro nornu'

" Indentation
set autoindent
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2


" Lightline and lightline-bufferline
let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#unnamed      = '[No Name]'

let g:lightline = {
  \ 'colorscheme': 'PaperColor' ,
  \ 'component_function': {
  \   'readonly': 'LightlineReadonly',
  \   'fugitive': 'LightlineFugitive'
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' }
  \ }
function! LightlineReadonly()
  return &readonly ? '' : ''
endfunction
function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ''.branch : ''
  endif
  return ''
endfunction

let g:lightline.tabline          = {'left': [['buffers']], 'right': []}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

nnoremap <C-K> :bnext<CR>
nnoremap <C-J> :bprev<CR>
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)


" color scheme
set background=dark
colorscheme PaperColor

