"" vim:ft=vim:
"" @file
"" @verbatim
""" main:
"""   - date: created="Sun Jun 15 12:53:11 2014"
"""     last: lastmod="Sun Jun 15 12:59:31 2014"
"""     desc: |
"""         colorscheme.demo.vim
"""         
"""         editor colorscheme
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
    "" configure vim colors
    ""  --------------------------------------------
    ""  Default Color Scheme
    ""  Frequently Used colorscheme
    ""      desert  golden  midnight2   neon biogoo2
    ""      murphy  sea zenburn simpleandfriendly2
    ""      potts textpad emacs molokai vibrantink002
    let bTemp     = 0
    let sTemp01   = "molokai"
    let sTemp02   = "solarized"
    let sTemp03   = "desert"
    let sTemp     = sTemp03

    if(bTemp == 0)
        :try
        :   exec "colorscheme ".sTemp
        :   let bTemp = 1
        :catch
        :endtry
    endif

    "" p__:  Syntax Coloring
    syntax on                   " syntax highlighting

    "" p__: Bracket match coloring
    :hi MatchParen ctermbg=blue guibg=NONE gui=bold

  
