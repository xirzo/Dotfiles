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
Plug 'xirzo/naysayer.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'xirzo/gruber-darker.vim'
Plug 'ap/vim-css-color'
call plug#end()

syntax enable
filetype plugin indent on

" ==============================================================================
" GENERAL SETTINGS
" ==============================================================================
set termguicolors
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
set number relativenumber
set ruler
set laststatus=2
set showcmd
set scrolloff=3
set t_vb=
set listchars=tab:▸\ ,eol:¬

if has("gui_running")
    colorscheme torte
    set guifont=Iosevka\ Nerd\ Font\ 13
    set guioptions -=T
    set guioptions -=m
    " set lines=49 columns=96
endif

set t_Co=256
set background=dark
" colorscheme naysayer
colorscheme gruber-darker

let g:buftabline_numbers = 2
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

vnoremap ( <esc>`>a)<esc>`<i(<esc>
vnoremap { <esc>`>a}<esc>`<i{<esc>

vnoremap " <esc>`>a"<esc>`<i"<esc>
vnoremap ' <esc>`>a'<esc>`<i'<esc>

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
" TAB JUMPING
" ==============================================================================
nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(10)

" ==============================================================================
" LIVE GREP
" ==============================================================================
nnoremap <silent> <leader>/ :Rg<CR>

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }

function! s:live_grep(query, bang)
  " let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let command_fmt = 'rg --line-number --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}

  let $FZF_DEFAULT_OPTS = '--bind "tab:up,btab:down"'
  
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:bang)
endfunction

command! -nargs=* -bang Rg call s:live_grep(<q-args>, <bang>0)

command! -nargs=0 W write

" ==============================================================================
" VIM DEVELOPMENT KEYBINDINGS
" ==============================================================================

function! SynStack ()
    for i1 in synstack(line("."), col("."))
        let i2 = synIDtrans(i1)
        let n1 = synIDattr(i1, "name")
        let n2 = synIDattr(i2, "name")
        echo n1 "->" n2
    endfor
endfunction

nnoremap <F3> :call SynStack()<CR>
