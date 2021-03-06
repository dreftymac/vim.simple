"" vim:ft=vim:
"" @file
"" @verbatim
""" main:
"""   - date: created="Sun Jun 15 12:53:11 2014"
"""     last: lastmod="Sun Jun 15 12:59:31 2014"
"""     desc: |
"""         vim.mapping.demo
"""         
"""         sample mapping for use with vim
"""         
"""         to use these permanently, store them inside a .vimrc file
"""         to activate them for a one-off editing session, edit this file in vim and then source the file
"""            :source %
"""            
"" @endverbatim

"" ------------------------------------------------------------------------
""" region.001.init: | 

"" initialize mapping

"" ------------------------------------------------------------------------
""" region.002.editing: | 

"" make gf open in new window by default
nnoremap gf <C-w>gf

"" set current directory to that of active buffer
"" https://duckduckgo.com/?q=vim+current+directory+active+buffer
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

