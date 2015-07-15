" Vim global plugin for Diagnosing Aberrant FileType plugins
" Maintainer:	Barry Arthur <barry.arthur@gmail.com>
" License:	Vim License (see :help license)
" Location:	plugin/daft.vim
" Website:	https://github.com/dahu/daft
"
" See daft.txt for help.  This can be accessed by doing:
"
" :helptags ~/.vim/doc
" :help daft

" Vimscript Setup: {{{1
let s:save_cpo = &cpo
set cpo&vim

if exists("g:loaded_daft")
      \ || &compatible
  let &cpo = s:save_cpo
  finish
endif
let g:loaded_daft = 1

" Commands: {{{1
command! -nargs=1 -bar Punk call daft#punk(<q-args>)

" Teardown: {{{1
let &cpo = s:save_cpo

" Template From: https://github.com/dahu/Area-41/
" vim: set sw=2 sts=2 et fdm=marker:
