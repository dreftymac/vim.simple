"" vim:ft=vim:
"" @file
"" @verbatim
""" main:
"""   - date: created="Sun Jun 15 12:53:11 2014"
"""     last: lastmod="2014-08-25"
"""     desc: |
"""         vim.abbreviation.demo
"""         
"""         sample abbreviations for use with vim
"""         
"""         to use these permanently, store them inside a .vimrc file
"""         to activate them for a one-off editing session, edit this file in vim and then source the file
"""            :source %
"""            
"" @endverbatim

"" TODO: addons
"" https://duckduckgo.com/?q=vim+get+rid+of+caret-m
"" exec "silent! %s/".nr2char(0x0d)."//g"
""

"" ------------------------------------------------------------------------
""" region.001.init: |

"" initialize abbreviations
abclear
    "" if uncommented, the previous line will undefine any and all preexisting abbreviations

"" ------------------------------------------------------------------------
""" region.002a.declare.insert.abbrevs: | 

"" general purpose brevs
iabb teh the

"" ------------------------------------------------------------------------
""" region.002b.declare.insert.abbrevs.ww: | 

"" ww prefixed_abbrevs
iabb wwdate <C-R>=strftime("%Y-%b-%d %X")<CR>
iabb wwline ### --------------------------------------------------------------------------------  
iabb wwline2 ### ********************

"" ------------------------------------------------------------------------
""" region.002c.declare.insert.abbrevs.rr: | 

"" rr prefixed_abbrevs
iabb rrmini - caption:<CR>  date: <C-R>=strftime("%Y-%b-%d %X")<CR><CR>body: \|<CR>    <ESC>3kA
iabb rrtodo - caption: TODO (__category__) __caption__<CR>  date: <C-R>=strftime("%Y-%b-%d %X")<CR><CR>body: \|<CR>    <ESC>3kA
iabb rrweblink - caption: weblink .. __caption__<CR>  date: <C-R>=strftime("%Y-%b-%d %X")<CR><CR>url: \|<CR>tags: \|<CR>note: \|<CR>    <ESC>5kA

"" ------------------------------------------------------------------------
""" region.005.declare.command.abbrevs: | 

cabb insdate r !date \| echo('insdate: insert date'):wa

cabb mosb s=/=\\=g  \| echo('mosb: modify text ;; slash to backslash')
    "" change all slashes on the current line to backslash 

cabb mosf s=\\=/=g  \| echo('mosf: modify text slash to forwardslash')
    "" change all slashes on the current line to forwardslash

cabb mosd s=[/\\]=.=g  \| echo('mosd: modify text ;;  slash to dot')
    "" change all slashes on the current line to dot 

cabb waso wa \| source %
    "" write all files and source the current file
