setlocal makeprg=gcc\ -o\ %:p:r\ %:p\ -std=c99\ -W\ -Wall
setlocal errorformat=%f:%l:%c:\ %m,%f:%l:\ %m
noremap <buffer> <F6> :!clear; %:p:r<CR>
" noremap <F9> :make<cr><cr>:botright cwindow<cr>
