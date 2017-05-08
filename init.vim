call plug#begin('~/.config/nvim/plugged')

"" Common
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree' " filetree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'vim-airline/vim-airline' " statusline
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command
Plug 'mileszs/ack.vim' " better grep
Plug 'tomtom/tcomment_vim' " comment stuff out
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" Plug 'mattn/emmet-vim' useless as I am using utlisnips right ?
Plug 'sbdchd/neoformat' " autoformat according to various engine

""" Utils
Plug 'jaawerth/nrun.vim' " faster which for node

"" Themes
Plug 'mhartington/oceanic-next'
Plug 'w0ng/vim-hybrid'

""" Make & Linting
Plug 'benekastah/neomake' " using neovim's job control functonality
" Plug 'w0rp/ale'

"" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'ervandew/supertab'

"" Misc syntax & indent support
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'elzr/vim-json', { 'for': 'json' }

"" Python
Plug 'hdima/python-syntax', { 'for': 'python' }
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }

"" Elixir
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }

"" Javascript
Plug 'ruanyl/vim-fixmyjs'
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'moll/vim-node', { 'for': ['javascript', 'javascript.jsx'] } " node support
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'ternjs/tern_for_vim', { 'do': 'npm install', 'for': ['javascript', 'javascript.jsx'] }
" Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'wokalski/autocomplete-flow', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'flowtype/vim-flow', { 'for': ['javascript', 'javascript.jsx'] }

"" Typescript
" Plug 'mhartington/deoplete-typescript'
" Plug 'leafgarland/typescript-vim'
" Plug 'Quramy/vim-js-pretty-template'

"" Writing
Plug 'suan/vim-instant-markdown', { 'for': ['markdown', 'tex'] }
Plug 'LanguageTool', { 'for': ['markdown', 'tex', 'plaintex', 'asciidoc'] } " just awesome !

"" Reason
" Plug 'reasonml/vim-reason-loader'

"" ELM
" Plug 'elmcast/elm-vim'

" Plug 'ryanoasis/vim-devicons' "This should be loaded at the end
call plug#end()

""""""""""""""""""""""""""""""""""""""
" General settings
""""""""""""""""""""""""""""""""""""""
set clipboard+=unnamedplus

set pastetoggle=<f6> " Currently needed for neovim paste issue
set nopaste " FIXME: don't remember why it's needed

" filetype on " not required for neovim
set noshowmode " display mode in messages (disable cuz we use vim airlin)
set relativenumber number " just because

" set tabstop=2 shiftwidth=2 expandtab
set tabstop=4    " Number of spaces that a <Tab> in the file counts for.
set shiftwidth=4 " number space on reindent << >>
set expandtab    " spaces instead of tab

set encoding=utf8
set conceallevel=0
set scrolloff=3 " cursor padding when scrolling

set showmatch      " show matching braces
set hidden         " current buffer can be put into background
set ttimeoutlen=50 " this is for the timeout on ecape press I hope..
set autoread       " Automatically reread changed files without asking me anything
set ignorecase     " Search case insensitive...
set smartcase      " ... but not if it begins with upper case
set guicursor=     " Tell neovim to not change the cursor type in insert mode
set laststatus=2   " Always display the statusline
set mouse=a

"" Turn off swap file
set noswapfile
set nobackup

"" Because I often accidentally :W when I mean to :w.
command! W w

"" We don't want neovim to be in french...
language en_US

"" Leader keyyyyyy
let mapleader = "\<space>"
nnoremap <space> <Nop>

"" Remove auto comment new line..
au FileType * set fo-=c fo-=r fo-=o

"" Always put quickfix to the bottom
autocmd FileType qf wincmd J

" we don't want to cycle through quickfix buffer!
augroup qf
    autocmd!
    autocmd FileType qf set nobuflisted
augroup END

"" Define some filetypes
autocmd BufNewFile,BufRead .babelrc set filetype=json
autocmd BufNewFile,BufRead .jshintrc set filetype=json
autocmd BufNewFile,BufRead .eslintrc set filetype=json

"" Open quickfix after grep
autocmd QuickFixCmdPost *grep* cwindow


""""""""""""""""""""""""""""""""""""""
" Themes
""""""""""""""""""""""""""""""""""""""
syntax on
let g:hybrid_custom_term_colors = 1
set background=dark
colorscheme hybrid
highlight Comment cterm=italic
highlight htmlArg cterm=italic
highlight xmlString cterm=italic


""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""

"" Moving up and down work as you would expect
noremap <Up> gk
noremap <Down> gj
noremap k gk
noremap j gj

"" Keep selection when indenting/outdenting.
vnoremap > >gv
vnoremap < <gv

"" Un-highlight search matches
nnoremap <silent><leader><space> :noh<CR>

"" Ack
nnoremap <leader>a :Ack

"" Scrolling
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

"" EasyAlign
"" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
"" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"" deoplete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"" Toggle Qf and LocList
nmap <silent> <leader>l :call ToggleList("Location List", 'l')<CR>
nmap <silent> <leader>q :call ToggleList("Quickfix List", 'c')<CR>

"" QF navigation
nnoremap <C-n> :cn<CR>
nnoremap <C-m> :cp<CR>

"" LocList navigation
nnoremap <C-j> :lnext<CR>
nnoremap <C-k> :lprevious<CR>

"" Buffer navigation
nnoremap <C-h> :bprevious<CR>
nnoremap <C-l> :bnext<CR>

"" NERDTree
noremap <silent> <leader>n :NERDTreeToggle<CR>
noremap <silent> <leader>f :NERDTreeFind<CR>

"" Git (fugitive)
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gl :Glog<CR><CR>

"" Dont go to the next occurence when *
nnoremap * :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>


""""""""""""""""""""""""""""""""""""""
" Plugins configuration
""""""""""""""""""""""""""""""""""""""

" Airline
"""""""""
let g:airline_powerline_fonts = 1
let g:airline_theme='oceanicnext'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ''
let g:airline_right_alt_sep = '|'

" NERDTree
""""""""""

"" NERDTress File highlighting
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
" let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
" let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

"" close vim if the only window left open is a NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif


" Ale
"""""
let g:ale_lint_on_text_changed = 'never' " lint only on save
let g:ale_lint_on_enter = 0
let g:ale_open_list = 1 " open list window when errors
let g:ale_set_quickfix = 1
" " let g:ale_sign_error = '╳'
" let g:ale_sign_warning = '⚠️'
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Neomake
"""""""""
autocmd! BufWritePost * Neomake! | Neomake
let g:neomake_list_height = 10
" let g:neomake_open_list = 2 " auto open list if error

" Neomake custom colors
hi NeomakeError guifg=#ff0000 ctermfg=196 gui=undercurl cterm=undercurl
hi NeomakeErrorSign guifg=#ff0000 ctermfg=196

"" Javascript
let g:neomake_jsx_enabled_makers = []
let g:neomake_javascript_enabled_makers = []

""" Eslint
let g:eslint_path = nrun#Which('eslint')
if g:eslint_path != 'eslint not found'
  let g:neomake_javascript_eslint_exe = g:eslint_path
  let g:neomake_jsx_enabled_makers = ['eslint']
  let g:neomake_javascript_enabled_makers = ['eslint']
endif

"" Python
let g:neomake_python_enabled_makers = ['pep8', 'pylint', 'flake8']

"" ELM
" let g:neomake_elm_enabled_makers = ['elmMake']


" Deoplete
""""""""""
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1

autocmd CompleteDone * pclose! 

"" cycle through the pmenu with tabs
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

"" javascript completion
" let g:deoplete#omni#functions = {}
" let g:deoplete#omni#functions.javascript = [
"   \ 'tern#Complete',
" \]
  " \ 'jspc#omni'
" let g:deoplete#sources = {}
" let g:deoplete#sources['javascript.jsx'] = ['file', 'ternjs']
" let g:deoplete#sources['javascript.jsx'] = ['file']
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]


"" python completion
" let g:deoplete#sources#jedi#show_docstring = 1

"" ocaml reason 
" let g:deoplete#omni_patterns = {}
" let g:deoplete#omni_patterns.reason = '[^. *\t]\.\w*\|\h\w*|#'
" let g:deoplete#sources = {}
" let g:deoplete#sources.reason = ['omni', 'buffer']

" FlowType
"""""""""""""
if findfile('.flowconfig', '.;') !=# ''
  let g:flow_path = nrun#Which('flow')
  if g:flow_path != 'flow not found'

      "" vim-flow
      let g:flow#flowpath = g:flow_path
      let g:flow#enable = 0
      let g:flow#autoclose = 1
      " let g:flow#omnifunc = 0
      " let g:flow#timeout = 4
      nnoremap <leader>d :FlowJumpToDef<CR>
      nnoremap <leader>t :FlowType<CR>

      "" Neomake
      " let g:neomake_javascript_flow_exe = g:flow_path
      " let g:neomake_jsx_enabled_makers = g:neomake_jsx_enabled_makers + ['flow']
      " let g:neomake_javascript_enabled_makers = g:neomake_javascript_enabled_makers + ['flow']

      "" Neomake! (QF)
      let g:neomake_flow_maker = neomake#makers#ft#javascript#flow()
      let g:neomake_flow_exe = g:flow_path
      let g:neomake_enabled_makers = ['flow']


      "" deoplete
      "" use vim-flow omnifunc in deoplete
      let g:deoplete#omni#input_patterns = {}
      let g:deoplete#omni#input_patterns['javascript.jsx'] = '[.\w]+'

      let g:deoplete#sources = {}
      let g:deoplete#sources['javascript.jsx'] = ['omni', 'file', 'ultisnips']
  endif
endif


" Prettier
""""""""""

" autocmd FileType javascript set formatprg=prettier\ --stdin
" autocmd BufWritePre *.js :normal gggqG
" autocmd BufWritePre *.js exe "normal! gggqG\<C-o>\<C-o>"


"" Neoformat
""""""""""""
"" javascript (prettier)
let g:neoformat_javascript_prettier = {
            \ 'exe': 'prettier',
            \ 'args': ['--stdin', '--parser flow', '--single-quote', '--trailing-comma', 'es5'],
            \ 'stdin': 1,
            \ }
" let g:neoformat_enabled_javascript = ['prettier']

" Use formatprg when available
let g:neoformat_try_formatprg = 1


" ELM
"""""
" let g:elm_format_autosave = 1
" let g:deoplete#omni#functions = {}
" let g:deoplete#omni#functions.elm = ['elm#Complete']
" let g:deoplete#omni#input_patterns = {}
" let g:deoplete#omni#input_patterns.elm = '[.\w]+'
" let g:deoplete#sources = {}
" let g:deoplete#sources.elm = ['omni', 'file', 'ultisnips']



" Misc plugin related config
" (usually small config)
""""""""""""""""""""""""""""

"" vim-javascript
let g:javascript_plugin_flow = 1 
" let g:javascript_plugin_jsdoc = 1

"" fixmyjs
let g:fixmyjs_engine = 'eslint'
let g:fixmyjs_use_local = 1 " use the node_modules one 

"" vim-jsx
let g:jsx_ext_required = 0 " set filetype=javascript.jsx even on .js

"" vim-json
let g:vim_json_syntax_conceal = 0 " don't hide quotes in json files

"" FZF
nnoremap <silent> <C-p> :FZF<CR>

"" vim-instant-markdown
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0

"" ack
"" Use ag to grep through files
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" languagetool
let g:languagetool_jar='/usr/local/Cellar/languagetool/3.6/libexec/languagetool-commandline.jar'

" ultisnips 
let g:UltiSnipsExpandTrigger="<C-j>"


" Functions
"""""""""""

function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction
