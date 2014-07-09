"" vim:ft=vim:
"" @file
"" @verbatim
""" main:
"""   - date: created="Sun Jun 15 12:53:11 2014"
"""     last: lastmod="Sun Jun 15 12:59:31 2014"
"""     desc: |
"""         gui.demo.vim
"""         
"""         gui settings for gvim (desktop vim)
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

""  begin_:  GUI
  ""  --------------------------------------------
  ""  p__: scrollbars and menu
  set guioptions+=mrb

  ""  p__: GUI mod script
  ""  href="./Myvim_gui_upgrade_config.vim"
  call GUIMod000_xx_ModMenu001()    

  ""  p__: window position and size 
  :winpos 13 11
  :winsize 100 40

""  begin_: GUI Tabs :: tabpage
  ""  --------------------------------------------
  ""  p__: set tabpage buffer_tabs TabPage_AnnoyanceBust

  ""  p__: see also :help statusline
  set guitablabel=%04.20{expand(\"\%:t\")}
  set tabpagemax=20

  
