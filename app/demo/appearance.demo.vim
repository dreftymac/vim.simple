"" vim:ft=vim:
"" @file
"" @verbatim
""" main:
"""   - date: created="Sun Jun 15 12:53:11 2014"
"""     last: lastmod="Sun Jun 15 12:59:31 2014"
"""     desc: |
"""         appearance.demo.vim
"""         
"""         appearance settings for gvim (desktop vim)
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

    ""  begin_: file metadata
    ""  <region-file_info>
    ""  main:
    ""    - name : ___name
    ""      date : created="2008-05-11 19:24:10"
    ""      last : lastmod="2008-05-11 19:24:14"
    ""      desc : configuration changes for the vim buffer
    ""  </region-file_info>

    ""  begin_: changes to the vim editor buffer
    ""  --------------------------------------------
    ""  p__: word completion
    ""  see_also :help complete
    ""  href="c:/sm/docs/app_data/__m/myclip/mcf20/_dev/mcf20_Publish_Myvim_Myclip_SupportFunctions.pl"`complete`
    set complete        =.,w,b,u,t,i,d

    ""  p__: indent
    set autoindent      " simply get indent from previous line with no cleverness

    ""  p__: search
    set nohlsearch      " no highlight search
    set incsearch       " highlight search tag while typing
    set ignorecase      " ignore the case in search patterns
    set smartcase       " consider case only if the srch pattern contains uppercase chars

    ""  p__: text formatting and layout
    set fo=tcqn         " see :h fo-table
    set encoding=utf-8  " see :h Unicode

    ""  p__: non-printing chars
        ""  specify display of 'invisible' nonprinting characters
        ""  to show/hide non printing chars, use the commands (:set list) and (:set nolist)
        "set list listchars=tab:Â»Â·,trail:Â·
    set listchars=trail:Â·,extends:>,eol:Â¶

    ""  p__: buffers
    ""  suppress the NoFile buffer
    set nobuflisted
    setlocal noswapfile
        "set buftype=nofile
        "set bufhidden=hide

    ""  p__: Font
        ""  set default font (depending on platform)
    if has("unix")
        set gfn=Lucidatypewriter\ 12
    endif
    if has("win32")
        set gfn=Courier_New:h10:cANSI
    endif


  
