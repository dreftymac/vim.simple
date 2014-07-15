" -------------------------------------------------------------------
" main:
"   - date: created="Tue Sep 04 15:36:52 2012"
"     last: lastmod="Tue Sep 04 15:36:52 2012"
"     desc: |
"         .vimrc
"
"         vimrc file
"
"         smosley@uoregon.edu
" 
"         /cygdrive/c/sm/docs/appdata/home/smosley/.vimrc
"         c:/sm/docs/appdata/home/smosley/.vimrc
"         

" -------------------------------------------------------------------
" initialize vim
  set nocompatible       "" turn off vi compatibility
  set shellcmdflag=-lic  "" allow use of bash aliases with vim :read !{cmd} (see :help read )
  
" -------------------------------------------------------------------
" preferences.annoyance_busters

  " ********************
  " errorbells: 
  " set noerrorbells
  " set t_vb=
  " set visualbell
  set noerrorbells visualbell t_vb=
  if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
  endif  
