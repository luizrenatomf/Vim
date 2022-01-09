set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'sheerun/vim-polyglot'
Plugin 'pangloss/vim-javascript'
Plugin 'joegesualdo/jsdoc.vim'
Plugin 'mattn/emmet-vim'

call vundle#end()
filetype plugin indent on
syntax on

let mapleader = ','
set mouse=
set showcmd

" Identação
set tabstop=2
set shiftwidth=2

" Comportamento usual de backspace
set backspace=2

" Numeração de linhas
set number
set ruler
set relativenumber

" Atalho arquivo configuração Vim
map <leader>ev :vs ~/.vimrc<CR>
map <leader>sv :source ~/.vimrc<CR>

" Busca incremental
set incsearch
set hlsearch

" Tema
let g:solarized_termcolors=256
set t_Co=256 
set background=dark
colorscheme solarized

" Airline
set laststatus=2
let g:airline_powerline_fonts = 1 
let g:airline_solarized_bg='dark'

" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-m> :NERDTreeMirror<CR>:NERDTreeFocus<CR>
nnoremap <C-f> :NERDTreeFind<CR>
autocmd VimEnter * NERDTree
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Terminal
function Terminal()
	" Verificar se há buffer bash aberto:
	let meuterminal = bufname('bash')
	if meuterminal == ''
		below term ++rows=15
	else
		let bnr = bufnr(meuterminal)
		exec ':bwipe!'bnr
	endif
endfunction

map <C-t> :call Terminal()<CR>
au TerminalOpen * if &buftype == 'terminal' | setlocal nobuflisted | endif

