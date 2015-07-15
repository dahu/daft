" Vim library for Diagnosing Aberrant FileType plugins
" Maintainer:   Barry Arthur <barry.arthur@gmail.com>
" License:      Vim License (see :help license)
" Location:     autoload/daft.vim
" Website:      https://github.com/dahu/daft
"
" See daft.txt for help.  This can be accessed by doing:
"
" :helptags ~/.vim/doc
" :help daft

" Vimscript Setup: {{{1
let s:save_cpo = &cpo
set cpo&vim

if exists("g:loaded_lib_daft")
      \ || &compatible
  let &cpo = s:save_cpo
  finish
endif
let g:loaded_lib_daft = 1

" Vim Script Information Function: {{{1
function! daft#info()
  let info = {}
  let info.name = 'daft'
  let info.version = 1.0
  let info.description = 'Vim library for Diagnosing Aberrant FileType plugins.'
  let info.dependencies = []
  return info
endfunction

" Library Interface: {{{1

function! daft#scripts()
  redir => scripts
  silent scriptnames
  redir END
  return scripts
endfunction

function! daft#punk(ft)
  let pre = daft#scripts()
  exe 'set ft=' . a:ft
  let post = daft#scripts()
  tabnew
  setlocal buftype=nofile bufhidden=wipe noswapfile
  call setline(1, split(pre, '\n'))
  diffthis
  botright vsplit | enew
  setlocal buftype=nofile bufhidden=wipe noswapfile
  call setline(1, split(post, '\n'))
  diffthis
endfunction

" Teardown:{{{1
"reset &cpo back to users setting
let &cpo = s:save_cpo

" Template From: https://github.com/dahu/Area-41/
" vim: set sw=2 sts=2 et fdm=marker:
