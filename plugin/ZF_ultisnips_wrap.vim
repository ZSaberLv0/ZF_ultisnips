
if has('python3')
    let s:python_EOF='python3 << python_EOF'
elseif has('python')
    let s:python_EOF='python << python_EOF'
else
    let s:python_EOF=''
endif

function! ZF_ultisnips_ListSnippets_onekey() abort
    if empty(s:python_EOF)
        return ''
    endif
execute s:python_EOF


import vim
from UltiSnips import UltiSnips_Manager
from UltiSnips import vim_helper

def list_snippets():
    before = vim_helper.buf.line_till_cursor
    snippets = UltiSnips_Manager._snips(before, True)

    if len(snippets) == 0:
        # UltiSnips_Manager._handle_failure(vim.eval("g:UltiSnipsListSnippets"))
        return True

    # Sort snippets alphabetically
    snippets.sort(key=lambda x: x.trigger)

    if not snippets:
        return True

    if len(snippets) == 1:
        snippet = snippets[0]
        UltiSnips_Manager._do_snippet(snippet, before)
        return True

    return UltiSnips_Manager.list_snippets()

list_snippets()


python_EOF
    return ''
endfunction

