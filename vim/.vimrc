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
Plug 'p0209p/naysayer.vim'
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
colorscheme naysayer

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
    nmap <buffer> gs         <plug>(lsp-document-symbol-search)
    nmap <buffer> gS         <plug>(lsp-workspace-symbol-search)

    nnoremap <buffer> <silent> K        :LspHover<CR>
    nnoremap <buffer> <silent> <F2>     :LspNextError<CR>
    nnoremap <buffer> <silent> <S-F2>   :LspPreviousError<CR>
    nnoremap <buffer> <silent> <leader>f :LspDocumentFormat<CR>
    vnoremap <buffer> <silent> <leader>f :LspDocumentRangeFormat<CR>

    nmap <buffer> <expr><c-f> lsp#scroll(+4)
    nmap <buffer> <expr><c-d> lsp#scroll(-4)
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" ==============================================================================
" FIXING NAYSAYER COLORSCHEME
" ==============================================================================

function! s:fix_naysayer_diagnostics() abort
    hi DiagnosticError           guifg=#ff6b6b guibg=#122a2e gui=bold
    hi DiagnosticUnderlineError  guifg=#ff6b6b guibg=#122a2e guisp=#ff6b6b gui=underline
    
    hi DiagnosticWarn            guifg=#f0c674 guibg=#122a2e
    hi DiagnosticUnderlineWarn   guifg=#f0c674 guibg=#122a2e guisp=#f0c674 gui=underline
    
    hi DiagnosticHint            guifg=#e5c07b guibg=#062329
    hi DiagnosticUnderlineHint   guifg=#e5c07b guisp=#e5c07b gui=underline

    hi LspErrorHighlight         guifg=#ff6b6b guibg=#122a2e gui=underline
    hi LspWarningHighlight       guifg=#f0c674 guibg=#122a2e gui=underline
    hi LspInformationHighlight   guifg=#8cde94 guibg=#062329 gui=underline
    hi LspHintHighlight          guifg=#e5c07b guibg=#062329 gui=underline

    hi LspErrorText              guifg=#ff6b6b guibg=#062329 gui=bold
    hi LspWarningText            guifg=#f0c674 guibg=#062329
    hi LspInfoText               guifg=#8cde94 guibg=#062329
    hi LspHintText               guifg=#e5c07b guibg=#062329
endfunction

augroup NaysayerLspFix
    autocmd!
    autocmd ColorScheme naysayer call s:fix_naysayer_diagnostics()
augroup END

call s:fix_naysayer_diagnostics()

augroup FixCCurlyBraces
    autocmd!
    autocmd FileType c,cpp hi link cErrInParen Delimiter
augroup END
