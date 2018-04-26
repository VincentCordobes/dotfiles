" execute either cprevious/cnext or lprevious/lnext 
" QuickFix has higher priority than LocList if both are open
function! ListNavigate(cmd)
    try
        if IsBufOpen("Quickfix List")
            exec('c'.a:cmd)
        else
            exec('l'.a:cmd)
        endif
    catch /E553/
        echohl ErrorMsg | echo "No more items" | echohl None
    catch /E42/
        echohl ErrorMsg | echo "No Errors" | echohl None
    catch /E776/
        echohl ErrorMsg | echo "No location list" | echohl None
    endtry
endfunction

function! ToggleList(bufname, pfx)
  if IsBufOpen(a:bufname)
    exec(a:pfx.'close')
    return
  endif
  let winnr = winnr()
  exec(a:pfx.'window')
  if winnr() == winnr
    echohl ErrorMsg | echo a:bufname.' is Empty' | echohl None
  else
    wincmd p
  endif
endfunction

function! IsBufOpen(bufname)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      return 1
    endif
  endfor
  return 0
endfunction

function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction


" https://gist.github.com/juanpabloaj/5845848
function! AdjustWindowHeight(minheight, maxheight)
  let l = 1
  let n_lines = 0
  let w_width = winwidth(0)
  while l <= line('$')
    " number to float for division
    let l_len = strlen(getline(l)) + 0.0
    let line_width = l_len/w_width
    let n_lines += float2nr(ceil(line_width))
    let l += 1
  endw
  exe max([min([n_lines, a:maxheight]), a:minheight]) . "wincmd _"
endfunction


function! Translate()
  let l:tempFile = tempname()
  sil exe '%!trans fr:en -no-ansi'
endfunction

function! ToggleGStatus()
  if buflisted(bufname('.git/index'))
    bd .git/index
  else
    Gstatus
  endif
endfunction
