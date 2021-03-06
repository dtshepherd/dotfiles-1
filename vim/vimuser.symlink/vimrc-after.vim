function! CustomSetupMake()
    call SetupMake()

    " Expand tabs by default, since indentation in function bodies is by far
    " more common than creating a new recipe which demands a leading tab.  This
    " is experimental for now, but it's very helpful to avoid putting tabs into
    " function bodies and ending up with mixed tabs and spaces (which will
    " promote a tab damage problem if others use ts != 8).
    " To insert a real tab character, type <C-V><Tab>.
    setlocal et sw=2 sts=2
endfunction
command! -bar SetupMake call CustomSetupMake()

function! CustomSetupRuby()
    call SetupRuby()

    setlocal tw=120 ts=2 sts=2 sw=2 et ai
    Highlight nolonglines
endfunction
command! -bar SetupRuby call CustomSetupRuby()

function! CustomSetupCpp()
    call SetupCpp()

    setlocal tw=120
    Highlight nolonglines
endfunction
command! -bar SetupCpp call CustomSetupCpp()

function! CustomSetupC()
    call SetupC()

    setlocal tw=120
    Highlight nolonglines
endfunction
command! -bar SetupC call CustomSetupC()

function! CustomSetupPython()
    call SetupPython()

    setlocal tw=120
    Highlight nolonglines
endfunction
command! -bar SetupPython call CustomSetupPython()

call extend(g:airline_symbols, {
        \ 'readonly': "RO",
        \ 'whitespace': "\u2632",
        \ 'linenr': "\u2630",
        \ 'maxlinenr': "\u33D1",
        \ 'branch': "\u16A0",
        \ 'nonexists': "\u0246",
        \ }, 'keep')

nnoremap <Space>bb          :<C-u>CtrlPBuffer<CR>
nnoremap <Space>bd          :BW<CR>

nnoremap <Space>wc          <C-w>c
nnoremap <Space>ww          <C-w>w

nnoremap <Space>ff          :<C-u>CtrlPCurFile<CR>
nnoremap <Space>pf          :<C-u>CtrlPRoot<CR>

Noxmap   <Space>xdw         :StripTrailingWhitespace<CR>

" Use cpsm matcher for CtrlP.
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
let g:cpsm_query_inverting_delimiter = ' '

" So the left status column doesn't always show in Vim 8.2
let g:ale_sign_column_always = 0
