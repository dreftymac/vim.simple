"" vim:ft=vim:
"" @file
"" @verbatim
""" main:
"""   - date: created="Sun Jun 15 12:53:11 2014"
"""     last: lastmod="Sun Jun 15 12:59:31 2014"
"""     desc: |
"""         settings.demo.vim
"""         
"""         basic editor settings
"""         
"""         to use these permanently, store them inside a .vimrc file
"""         to activate them for a one-off editing session, edit this file in vim and then source the file
"""            :source %
"""            
"" @endverbatim

"" ------------------------------------------------------------------------
""" region.000.init: | 

"" ------------------------------------------------------------------------
""" region.001.basic.settings: | 

  ""  --------------------------------------------
  "" Basic settings for the appearance and look of Vim
  ""  --------------------------------------------
  set nowrap                  " turn off line wrap
  set linebreak               " turn off mid-word breaks in line wrap mode
  set ruler                   " Show the cursor position all the time
  set number                  " show line numbers
  set hidden                  " allow hidden buffers
  set cursorline              " highlight cursorline
  set previewheight=16        " preview window height

"" ------------------------------------------------------------------------
""" region.001.basic.feedback: | 
  
  ""  --------------------------------------------
  "" Basic Feedback
  ""  --------------------------------------------
  set showcmd                 " show partial commands in status line
  set showmode                " showmode: Show the current mode
  set shortmess=at            " shortmess: Kind of messages to show.
  "set shortmess=atI          " shortens messages to avoid 'press a key' prompt
  set showmatch               " show matching brackets
  set mat=1                   " how many tenths of a second to blink matching brackets for
  set modelines=10            " search up to ten lines into a file to try to fine a VIM modeline
  
"" ------------------------------------------------------------------------
""" region.001.statusline: | 

  ""  --------------------------------------------
  "" Status Line
  ""  --------------------------------------------
  ""  Always display a status line at the bottom of window.
  set laststatus=2
  set statusline=%02{mode()}\ [%02n]\ %f%m%r%w\ %4(%)\ %y[fmt:%{&ff}\ myclip:%{g:myvim_xx_currmcfdomain}]\ [asc:\%03.3b\ hex:\%02.2B]\ [l:%04l\ c:%04v]\ [offs:\ %o,\ %p%%]

"" ------------------------------------------------------------------------
""" region.001.markers: | 

  ""  --------------------------------------------
  ""  Markers
  ""  --------------------------------------------
  let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
  let g:showmarks_enable = 1
  " For marks a-z
  highlight ShowMarksHLl gui=bold guibg=LightBlue guifg=Blue
  " For marks A-Z
  highlight ShowMarksHLu gui=bold guibg=LightRed guifg=DarkRed
  " For all other marks
  highlight ShowMarksHLo gui=bold guibg=LightYellow guifg=DarkYellow
  " For multiple marks on the same line.
  highlight ShowMarksHLm gui=bold guibg=LightGreen guifg=DarkGreen  
  
  
