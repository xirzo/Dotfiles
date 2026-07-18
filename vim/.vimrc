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
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ap/vim-buftabline'
Plug 'jiangmiao/auto-pairs'
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

let g:buftabline_numbers = 1
let g:buftabline_indicators = 1

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

let g:ctrlp_prompt_mappings = {
    \ 'PrtSelectMove("j")':   ['<s-tab>', '<c-j>', '<down>'],
    \ 'PrtSelectMove("k")':   ['<tab>', '<c-k>', '<up>'],
    \ 'ToggleFocus()':        [],
    \ 'PrtExpandDir()':       [],
    \ }

" ==============================================================================
" LSP & AUTOCOMPLETION
" ==============================================================================
" Autocomplete movement
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

    nmap <buffer> <space>ca <plug>(lsp-code-action)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> gd         <plug>(lsp-definition)
    nmap <buffer> gr         <plug>(lsp-references)
    nmap <buffer> K          <plug>(lsp-hover)

    nnoremap <buffer> <silent> <F2>   :LspNextError<CR>
    nnoremap <buffer> <silent> <S-F2> :LspPreviousError<CR>

    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)

    nnoremap <buffer> <silent> <leader>f :LspDocumentFormat<CR>
    vnoremap <buffer> <silent> <leader>f :LspDocumentRangeFormat<CR>

    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)
endfunction
