" ==============================================================================
" CORE / PLUGINS
" ==============================================================================
let mapleader = "\<Space>"

call plug#begin()
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'tpope/vim-commentary'
call plug#end()

syntax enable
filetype plugin indent on

" ==============================================================================
" GENERAL SETTINGS
" ==============================================================================
set encoding=utf-8
set clipboard=unnamedplus
set mouse=a
set hidden
set modelines=0
set backspace=indent,eol,start
set matchpairs+=<:>
packadd! matchit

" ==============================================================================
" USER INTERFACE
" ==============================================================================
set relativenumber
set ruler
set laststatus=2
set showcmd
set scrolloff=3
set t_vb=
set listchars=tab:▸\ ,eol:¬

if has("gui_running")
    set guifont=Iosevka\ Nerd\ Font\ 18
endif

set t_Co=256
set background=dark
colorscheme monochrome

" ==============================================================================
" SEARCHING
" ==============================================================================
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

nnoremap <silent> <leader><space> :let @/=''<CR>

" ==============================================================================
" WHITESPACE & FORMATTING
" ==============================================================================
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" C/C++
autocmd FileType c,cpp,objc setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab cindent
autocmd FileType c,cpp,objc setlocal formatprg=clang-format\ -style=file equalprg=clang-format\ -style=file

" ==============================================================================
" GENERAL KEYBINDINGS
" ==============================================================================
nnoremap j gj
nnoremap k gk

nnoremap <silent> <Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprevious<CR>

nnoremap <silent> Q :let cb = bufnr('%') \| bnext \| if bufnr('%') == cb \| new \| endif \| execute 'bdelete' cb<CR>

" ==============================================================================
" LSP & AUTOCOMPLETION
" ==============================================================================
" Autocomplete movement
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"

" LSP Actions
nnoremap <silent> <space>ca :LspCodeAction<CR>
nnoremap <silent> <leader>rn <Plug>(lsp-rename)
nnoremap <silent> gd         <Plug>(lsp-definition)
nnoremap <silent> gr         <Plug>(lsp-references)
nnoremap <silent> K          :LspHover<CR>

" LSP Formatting (Normal and Visual modes)
nnoremap <silent> <leader>f :LspDocumentFormat<CR>
vnoremap <silent> <leader>f :LspDocumentRangeFormat<CR>
