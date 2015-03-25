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

" -------------------------------------------------------------------
" preferences.files

  " ********************
  " backup
  if has("vms")
    set nobackup		" do not keep a backup file, use versions instead
  else
    set backup		  " keep a backup file
    set backupdir=$HOME/.backup
    set nowritebackup
    "set noswapfile  
  endif

  " ********************
  " diffs
  " Convenient command to see the difference between the current buffer and the
  " file it was loaded from, thus the changes you made.
  " Only define it when not defined already.
  if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
  endif
