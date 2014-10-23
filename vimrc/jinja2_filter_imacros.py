### begin_: coding: utf-8
"""
  ### @file
  ### @verbatim
  ### main:
  ###   - date: created="Tue Sep 03 19:03:17 2013"
  ###     last: lastmod="Tue Sep 03 19:02:25 2013"
  ###     desc: |
  ###         desc
  ###
  ###
  ### @endverbatim
  """

### ------------------------------------------------------------------------
### begin_: init python
if(True):
  ## std lib
  import re
  import sys

### ------------------------------------------------------------------------
### begin_: main
if(True):

  def jjiim(jjinput):
    '''
    ### <region-function_docs>
    ### main:
    ###   - name: jjiim
    ###     date: lastmod="Mon 2014-10-20 16:45:46"
    ###     desc: |
    ###       apply standard imacros-style-escaping
    ###       convert a string to an imacros-whitespace-compatible version
    ###
    ###     mytags: [imacros,]
    ###
    ###     example_before: |
    ###        __blank__ 
    ###
    ###     example_after: |
    ###        __blank__ 
    ###
    ### dependencies:
    ###   - None
    ### params:
    ###   - param: jjinput ;; required ;; raw input string
    ### dreftymacid: __blank__
    ### </region-function_docs>    
    '''
    ##
    vout = jjinput.__str__()
    
    ##
    oRR  = re.compile( '(^\s|\s$)')
    vout = oRR.sub('', vout)
    oRR  = re.compile('(\s+)')
    vout = oRR.sub('<SP>', vout)
    oRR  = re.compile('\n')
    vout = oRR.sub('<BR>', vout)
    
    ##
    return vout
  ##enddef 