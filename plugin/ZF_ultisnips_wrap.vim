
function! ZF_ultisnips_ListSnippets_onekey() abort
python3 << EOF


import vim
from UltiSnips import UltiSnips_Manager
from UltiSnips import vim_helper

def list_snippets():
    before = vim_helper.buf.line_till_cursor
    snippets = UltiSnips_Manager._snips(before, True)

    if len(snippets) == 0:
        UltiSnips_Manager._handle_failure(vim.eval("g:UltiSnipsListSnippets"))
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


EOF
    return ""
endfunction

