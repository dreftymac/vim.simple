## @file
## @verbatim
## main:
##   - date: created="Mon Oct 20 21:13:44 2014"
##     last: lastmod="Mon Oct 20 21:13:44 2014"
##     dependencies: |
##          * href="./jinja2_generator.py"
##          * href="./jinja2_filter_general.py"
##
##     desc: |
##          jinja2 template
##          
##          run this using the following run_string in komodo ide
##         
##            %(python) %D/jinja2_generator.py %b
##
## @endverbatim
'''
{#-
### ------------------------------------------------------------------------
<jinja_root_configuration>
data_config_path:       "./vimrc_exportable.yaml"
<jinja_root_configuration>
-#}
{{ "helloworld" |jjhug('>') }}
{#- init inclusion scopes -#}
{%- set jj_inclusion_scopes = "global windows windows_specific_csm" -%}

{#- iterate -#}
{%- for datarow in main
    if(true
      and datarow.caption != '__blank__'
      and datarow.scope in jj_inclusion_scopes
      )
    -%}
    {%- if not loop.first and datarow.heading -%}{{"\n"}}{%- endif -%}
    {%- if datarow.heading == 'h1' -%}  
"" ------------------------------------------------------------------------ 
"" {{ datarow.caption}}
{% endif %}{{ datarow.body |indent(4,true) }}
{% endfor %}
'''
