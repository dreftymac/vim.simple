# vim:essentials

[Jacob Mattingley](http://www.stanford.edu/~jacobm/)

Rather than just another list of things you _can_ do in
[vim](http://www.vim.org/), these are things I use constantly -- they've stood
the test of time and really improve my efficiency. Try some of these things!
If you think I should remove anything or if you have other comments, please
[let me know](mailto:jacobm@stanford.edu). Also try
[vimtutor](http://www.vim.org/htmldoc/usr_01.html#tutor), especially in your
early vim days.

## Indispensable

  * . repeats the previous command.

  * ~ toggles the case of the character under the cursor.

  * ctrl+n completes half-typed words. Move forwards and backwards through the choices with ctrl+n and ctrl+p.

  * ctrl+x then l or f completes entire lines or filenames.

  * J joins two lines.

## Editing

  * i, a, I and A start insert mode before the cursor, after the cursor, at the start of a line or at the end of a line.

  * Combine movement, deletion and insertion by _changing_ text. (Replace c with d or y in any of these examples to delete or yank instead of change.)

    * cw changes until the end of a word (by deleting, then placing you in insert mode).

    * c$ changes until the end of a line.

    * cl changes the character under the cursor.

    * ct+ changes until the next + (replace + with any character).

    * ciw, ci( and ci[ change inside a word, a () block or a [] block. Replace i with a to include the space around a word or the brackets themselves. Example: change a whole parenthetical expression by moving inside it and ci(. 

  * Use numeric arguments (with almost any command!).

    * d5d deletes five lines.

    * d3t) changes until the third ).

## Movement

  * Get comfortable with h, j, k and l instead of the arrow keys. They keep your fingers ready for many useful commands.

  * Reduce repetitive movement.

    * w and b move backwards or forwards one word.

    * ^ and $ move to the start or end of a line.

    * H, M and L move to the top, middle or bottom of the screen.

    * gg and G go to the start or end of a file.

    * Perform small searches to move to new locations (eg /jandal to move to the word jandal).

## Yanking and pasting

Move text by cutting (deleting) or copying (yanking), then pasting it
elsewhere. Delete with d, yank with y and paste before or after the cursor
with p or P.

  * Copy the remainder of a line with y$. Paste it somewhere else with p.

  * dd and Y delete or yank the current line.

  * Use V to enter visual line mode. Select several lines. Yank them with y.

## Jumping around

  * * and # search forwards or backwards for the word under the cursor.

  * ctrl+o restores the cursor position before the last jump.

  * g; and g, step backwards or forwards through previous change locations.

## Visual block mode

Use ctrl+v to enter visual block mode to select a rectangular block of text.

  * Remove comment markers from a set of lines. Go to the start of the line with ^, enter visual block mode with ctrl+v and select the comment markers. Hit x and they're all gone.

  * Insert comment markers for multiple lines. Go to the start of the line with ^, press ctrl+v, select a column of text at the start of the lines (eg with j) and hit I. Type the comment marker for one line and press escape, and the comment marker will appear on every line.

## Miscellaneous

  * xp swaps two transposed characters.

  * ctrl+a and ctrl+x increment or decrement the next number on the line. 5ctrl+a adds five.

  * = re-indents text.

  * gq re-flows text. Example: set the maximum line width with :set tw=80, select some lines with V and type gq.

  * :set hls! toggles search highlighting.

  * :!rm filename runs the external command rm filename.

## Remaps

Try these lines in your vimrc file (see :help .vimrc).

  * nmap <space> i_<esc>r makes space let you insert a single character.

  * nmap K i<cr><esc>k$ makes K split lines (the opposite of J).

  * nmap s :w <enter> makes s save.

  * nmap Q :q <enter> makes Q quit.

## Other great stuff

Ordered top picks: tabs, recording, marks, undo-branches, options, modelines,
tags. Use the excellent :help to learn more -- inside help, follow tags with
ctrl+] and return with ctrl+o.

Page generated 2010-11-08 22:16:05 PST, by [jemdoc](http://jemdoc.jaboc.net/).

