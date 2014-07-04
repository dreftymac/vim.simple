"" vim:ft=vim:
"" @file
"" @verbatim
"" main:
""   - date: created="Sun Jun 15 12:53:11 2014"
""     last: lastmod="Sun Jun 15 12:59:31 2014"
""     desc: |
""         vim.abbreviation.demo
""         
""         sample abbreviations for use with vim
""         
""         to use these permanently, store them inside a .vimrc file
""         to activate them for a one-off editing session, edit this file in vim and then source the file
""            :source %
""            
"" @endverbatim

"" ------------------------------------------------------------------------
"" begin_: initialize

abclear
    "" uncomment the previous line to undefine any and all preexisting abbreviations

"" ------------------------------------------------------------------------
"" begin_: declare insert abbrevs

"" ww namespace
iabb wwdate <C-R>=strftime("%Y-%b-%d %X")<CR>
iabb wwline ### --------------------------------------------------------------------------------  
iabb wwline2 ### ********************

"" rr namespace
iabb rrmini - caption:<CR>  date: <C-R>=strftime("%Y-%b-%d %X")<CR><CR>body: \|<CR>    <ESC>3kA
iabb rrtodo - caption: TODO (__category__) __caption__<CR>  date: <C-R>=strftime("%Y-%b-%d %X")<CR><CR>body: \|<CR>    <ESC>3kA
iabb rrweblink - caption: weblink .. __caption__<CR>  date: <C-R>=strftime("%Y-%b-%d %X")<CR><CR>url: \|<CR>tags: \|<CR>note: \|<CR>    <ESC>5kA

"" ------------------------------------------------------------------------
"" begin_: declare command abbrevs

cabb waso wa \| source %
    "" write all files and source the current file

cabb mosf s=\\=/=g  \| echo('mosf: modify text slash to forwardslash')
    "" change all slashes on the current line to forwardslash

cabb mosb s=/=\\=g  \| echo('mosb: modify text ;; slash to backslash')
    "" change all slashes on the current line to backslash 

cabb mosd s=[/\\]=.=g  \| echo('mosd: modify text ;;  slash to dot')
    "" change all slashes on the current line to dot 

