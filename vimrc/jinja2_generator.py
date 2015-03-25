## @file
## @verbatim
## main:
##   - date: created="Wed Oct 22 19:22:35 2014"
##     last: lastmod="Wed Oct 22 19:22:35 2014"
##     desc: |
##         jinja2_generator.py
##         standalone generator for use with pycog-style standalone jinja2 templates
##
##     seealso: |
##        https://github.com/dreftymac/private.lab/tree/master/mystuff/jinja2
##
## @endverbatim

##
if(True):
  ##
  import inspect
  import jinja2
  import os
  import re
  import sys
  import yaml
  
  ## import a python file that acts as a jinja2 template
  srcpython   =   __import__(sys.argv[1])  

##
if(True):
  ## init jinja2
  jjenvironn  =   jinja2.Environment()
  jjrootsigg  =   '<jinja_root_configuration>'
  jjrootdocc  =   str(srcpython.__doc__).encode('utf-8')
  jjrootconf  =   yaml.load(jjrootdocc.split(jjrootsigg)[1])
  jjrootdata  =   yaml.load(open(jjrootconf['data_config_path'],'rb'))
  jjproplist  =   ['block_start_string','block_end_string','variable_start_string','variable_end_string','comment_start_string','comment_end_string']
  ##
  jjpassthru  =   {}
  jjpassthru['jjenvironn'] = jjenvironn
  jjpassthru['jjrootsigg'] = jjrootsigg
  jjpassthru['jjrootdocc'] = jjrootdocc
  jjpassthru['jjrootconf'] = jjrootconf
  jjpassthru['jjrootdata'] = jjrootdata
  jjpassthru['jjproplist'] = jjproplist
  
##
if(True):
  def jinja2_apply_any_custom_properties(jjpassthru):
    '''
    if there are any custom properties defined in the generator, get them now
    '''
    ##
    try:
      for propp in jjpassthru['jjproplist']:
        if jjpassthru['jjrootconf'].get(propp,'') != '':
          setattr(jjpassthru['jjenvironn'],propp,jjpassthru['jjrootconf'].get(propp))
    except Exception as msg:
      pass
    return jjpassthru
  ##enddef

  def jinja2_apply_any_custom_filters(jjpassthru):
    '''
    if there are any custom filters, get them now
    '''
    ## apply custom filters to env
    try:
      jjpassthru['jjenvironn'] = apply_filters(jjpassthru['jjenvironn'])
    except Exception as msg:
      pass
    return jjpassthru
  ##enddef

  def apply_filters(env):
    for item in sys.modules[__name__].__dict__:
      if(item[0:2]!='jj'): continue
      env.filters[item] = getattr(sys.modules[__name__],item)
    pass;
    return env
  ##enddef

### ------------------------------------------------------------------------
##
if(True):
  ##
  def jjdsv_pretty(jjinput,sDelim=';;',sPad=' '):
    '''
    ### <region-function_docs>
    ### main:
    ###   - name: jjdsv_pretty
    ###     date: lastmod="Mon 2014-10-20 16:45:46"
    ###     desc: |
    ###         line up the delimiters in a DSV string
    ###
    ###     mytags: [pretty, dsv, delims, printf, format]
    ###
    ###     example_before: |
    ###         {% filter jjdsv_pretty(';;') %}
    ###           alpha ;; xbravo ;; charlie ;; e ;; dee
    ###           one ;; two ;; three ;; ee ;; d
    ###           uno;;dos;;tres ;; eee ;; d
    ###           un;;deux;;troi ;; eeee ;; d
    ###           ein;;swei ;; drei ;; eeeee ;; d
    ###           wahid;;ithnan;;thalatha ;; eeeeee ;; d
    ###         {% endfilter %}
    ###
    ###     example_after: |
    ###         alpha  ;; xbravo   ;;  charlie  ;;  e       ;;  dee
    ###         one    ;; two      ;;  three    ;;  ee      ;;  d  
    ###         uno    ;; dos      ;; tres      ;;  eee     ;;  d  
    ###         un     ;; deux     ;; troi      ;;  eeee    ;;  d  
    ###         ein    ;; swei     ;;  drei     ;;  eeeee   ;;  d  
    ###         wahid  ;; ithnan   ;; thalatha  ;;  eeeeee  ;;  d  
    ###
    ### dependencies:
    ###   - import os
    ###   - import re
    ###   - import sys
    ###   - DsvToAoa
    ### params:
    ###   - param: jjinput ;; required ;; raw dsv string
    ###   - param: sDelim ;; optional  ;; dsv delimiter (default=';;')
    ###   - param: sPad   ;; optional  ;; padding character to attach to dsv delim (default=' ')
    ### dreftymacid: couch_source_sunday       
    ### </region-function_docs>
    '''
    ### p__: init vars
    aFields     = []
    sFormat     = ''
    sOutput     = ''
  
    ### p__: FIXME ;; this doesnt seem to work with dsv that has no fieldnames
    try:
      ### p__: convert dsv to aoa, setup vars
          ### assumes first row contains fieldnames
      oaTable         = [];
      jjinput         = jjinput.lstrip().rstrip()
      oSplitter       = re.compile('\s*'+sDelim.strip()+'\s*');
      sDelim          = sPad+sDelim.strip()+sPad;
      
      ### p__:
      for sLine in jjinput.split("\n"):
        oRec = oSplitter.split(sLine.lstrip());
        if len(oRec) > 1:
          oaTable.append( oRec );
  
      ### p__:
      iNumFlds    = len(oaTable[0])
      aFields     = oaTable[0]
      aMaxes      = []
  
      ### p__: get field-sizes
      aMaxes = [0] * iNumFlds
  
      ### p__: get widths
      for icc, skey in enumerate(aFields):
        aMaxes[icc] = max([len(vTT[icc]) for vTT in oaTable])
  
      ### p__: build format string
      aFormats    = []
      for icc, skey in enumerate(aFields):
        aFormats.append("%-"+str(aMaxes[icc])+"s")
      sFormat = sDelim.join(aFormats)
  
      ### p__: build output based on format string
      for icc, vlist in enumerate(oaTable):
        sOutput += sFormat % tuple([item for item in vlist]) + '\n'
    except Exception as msg:
      sOutput = ''
      print 'UNEXPECTED TERMINATION msg@%s'%(msg.__repr__())
      exc_type, exc_obj, exc_tb = sys.exc_info()
      fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
      print(exc_type, fname, exc_tb.tb_lineno)
    ## p__: return
    return sOutput;
  ##enddef
  
  def jjhug(jjinput,sshug='qq'):
    '''
    ### <region-function_docs>
    ### main:
    ###   - name: jjhug
    ###     date: lastmod="Mon 2014-10-20 16:45:46"
    ###     desc: |
    ###             wrap balanced chars around a string
    ###
    ###     mytags: [pretty, dsv, delims, printf, format]
    ###
    ###     example_before: |
    ###        __blank__ 
    ###
    ###     example_after: |
    ###        __blank__ 
    ###
    ### dependencies:
    ###   - import os
    ###   - import re
    ###   - import sys
    ###   - DsvToAoa
    ### params:
    ###   - param: jjinput ;; required ;; raw dsv string
    ###   - param: sshug   ;; optional  ;; wrap character indicator
    ###   - param: sPad   ;; optional  ;; padding character to attach to dsv delim (default=' ')
    ### dreftymacid: logan_silently_solo    
    ### </region-function_docs>    
    '''
    ##
    vout = jjinput.__str__()
    
    ##
    if(sshug=='qq')                     :   vout = '"'+vout+'"'       
    if(sshug=='q')                      :   vout = "'"+vout+"'"      
    if(sshug=='[' or sshug==']')        :   vout = "["+vout+"]"       
    if(sshug=='{' or sshug=='}')        :   vout = "{"+vout+"}"       
    if(sshug=='{{' or sshug=='}}')      :   vout = "{{"+vout+"}}"       
    if(sshug=='<' or sshug=='>')        :   vout = "<"+vout+">"       
    if(sshug=='(' or sshug==')')        :   vout = "("+vout+")"       
    if(sshug=='/*' or sshug=='*/')      :   vout = "/*"+vout+"*/"     
    if(sshug=='<%' or sshug=='%>')      :   vout = "<%"+vout+"%>"     
    if(sshug=='[%' or sshug=='%]')      :   vout = "[%"+vout+"%]"     
    if(sshug=='<!--' or sshug=='-->')   :   vout = "<!--"+vout+"-->"  
    if(sshug=='<!---' or sshug=='--->') :   vout = "<!---"+vout+"--->"
    
    ##
    return vout
  ##enddef
    
  def jjslashfor(jjinput):
    '''
    ### <region-function_docs>
    ### main:
    ###   - name: jjslashfor
    ###     date: lastmod="Mon 2014-10-20 16:45:46"
    ###     desc: |
    ###             convert all slashes to forward slash
    ###
    ###     mytags: [slash, munge,]
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
    vout = vout.replace("\\","/",)
    ##
    return vout
  ##enddef
  
  def jjslashbak(jjinput):
    '''
    ### <region-function_docs>
    ### main:
    ###   - name: jjslashbak
    ###     date: lastmod="Mon 2014-10-20 16:45:46"
    ###     desc: |
    ###             convert all slashes to back slash
    ###
    ###     mytags: [slash, munge,]
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
    vout = vout.replace("/","\\",)
    ##
    return vout
  ##enddef
  
  def jjtofile(jjinput,outpath):
    '''
    ### <region-function_docs>
    ### main:
    ###   - name: jjtofile
    ###     date: lastmod="Mon 2014-10-20 16:45:46"
    ###     desc: |
    ###       output to a file
    ###
    ###     mytags: [stringtofile,]
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
    ###   - param: outpath ;; required ;; output path for file
    ### dreftymacid: __blank__
    ### </region-function_docs>    
    '''
    ##
    vout = jjinput.__str__()
    
    ##
    try:
      oFile   = open(outpath,'w')
      oFile.write(vout)
      oFile.close();
      vout = outpath;        
    except Exception as msg:
      print 'UNEXPECTED TERMINATION msg@%s'%(msg.__repr__())
      exc_type, exc_obj, exc_tb = sys.exc_info()
      fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
      print(exc_type, fname, exc_tb.tb_lineno)
    ##
    return vout
  ##enddef   

##
if(True):
  ## ------------------------------------------------------------------------
  ## setup
  jjpassthru = jinja2_apply_any_custom_properties(jjpassthru)
  jjpassthru = jinja2_apply_any_custom_filters(jjpassthru)
  
  ## ------------------------------------------------------------------------
  ## render
  srcpython = jjenvironn.from_string(jjrootdocc)
  print srcpython.render(jjrootdata).encode('utf-8')


