" execute either cprevious/cnext or lprevious/lnext 
" QuickFix has higher priority than LocList if both are open
function! ListNavigate(cmd)
  let l:nearby_cmd = {
        \ 'next': 'below',
        \ 'previous': 'above'
        \ }
  try
    if s:isbufopen('Quickfix List')
      exec('c'.a:cmd)
    elseif s:isbufopen('Location List')
      exec('l'.a:cmd)
    else
      exec('l'.nearby_cmd[a:cmd])
    endif
  catch /E553/
  catch /E42/
    echohl ErrorMsg | echo 'No Errors' | echohl None
  catch /E776/
    echohl ErrorMsg | echo 'No location list' | echohl None
  endtry
endfunction


function! Diagnostics()
  let l:winnr = winnr()
  LspDocumentDiagnostics
  if (l:winnr != winnr())
    wincmd p
  endif
endfunction

function! ToggleList(bufname, pfx)
  if s:isbufopen(a:bufname)
    exec(a:pfx.'close')
    return
  endif
  let l:winnr = winnr()
  try | exec(a:pfx.'window') | catch /E776/ | endtry
  if winnr() == l:winnr
    echohl ErrorMsg | echo a:bufname.' is Empty' | echohl None
  else
    wincmd p
  endif
endfunction

function! s:isbufopen(bufname)
  let l:buflist = s:getbuflist()
  for l:bufnum in map(filter(split(l:buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(l:bufnum) != -1
      return 1
    endif
  endfor
  return 0
endfunction

function! s:getbuflist()
  redir =>l:buflist
  silent! ls!
  redir END
  return l:buflist
endfunction


" https://gist.github.com/juanpabloaj/5845848
function! AdjustWindowHeight(minheight, maxheight)
  let l:l = 1
  let l:n_lines = 0
  let l:w_width = winwidth(0)
  while l:l <= line('$')
    " number to float for division
    let l:l_len = strlen(getline(l:l)) + 0.0
    let l:line_width = l:l_len/l:w_width
    let l:n_lines += float2nr(ceil(l:line_width))
    let l:l += 1
  endw
  exe max([min([l:n_lines, a:maxheight]), a:minheight]) . 'wincmd _'
endfunction

function! ToggleGStatus()
  " close the diff anyway
  let l:gitBuf = bufname('.git//0/')
  if buflisted(l:gitBuf) | exe 'bd ' . l:gitBuf | endif

  if buflisted(bufname('.git/index'))
    bd .git/index
  else
    10Gstatus
  endif
endfunction

function! ToggleGvdiff()
  let l:gitBuf = bufname('.git//0/')
  if buflisted(l:gitBuf)
    exe 'bd ' . l:gitBuf
  else
    Gvdiff
    wincmd p
  endif
endfunction

