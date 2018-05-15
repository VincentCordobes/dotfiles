""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin declarations
""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

"" Common
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
" Plug 'vim-airline/vim-airline' " statusline
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command
Plug 'mileszs/ack.vim' " better grep
Plug 'tomtom/tcomment_vim' " comment stuff out
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'SirVer/ultisnips' 
Plug 'honza/vim-snippets' " { 'for': 'python' } This slow down...
Plug 'sbdchd/neoformat' " autoformat according to various engine
Plug 'moll/vim-bbye'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'bronson/vim-visual-star-search'

"" Utils
Plug 'jaawerth/nrun.vim' " faster which for node

"" Themes
Plug 'albertorestifo/github.vim', {'commit': '5dd1be6' }

""" Make & Linting
Plug 'benekastah/neomake' " using neovim's job control functonality


"" Autocomplete
Plug 'Shougo/deoplete.nvim' ", { 'for': ['javascript', 'javascript.jsx', 'python', 'tex'] }

"" Misc syntax support
Plug 'othree/html5.vim',       { 'for': 'html' }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'elzr/vim-json',          { 'for': 'json' }

"" Python
" Plug 'hdima/python-syntax',          { 'for': 'python' }
" Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
" Plug 'zchee/deoplete-jedi',          { 'for': 'python' }

"" Javascript
Plug 'ruanyl/vim-fixmyjs',      { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx',             { 'for': ['javascript', 'javascript.jsx'] }
Plug 'moll/vim-node',           { 'for': ['javascript', 'javascript.jsx'] } " node support
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }

"" Writing
Plug 'vimwiki/vimwiki'
Plug 'lervag/vimtex' ,            { 'for': 'tex' }
Plug 'suan/vim-instant-markdown', { 'for': ['markdown', 'tex'] }
Plug 'vim-scripts/LanguageTool',  { 'for': ['vimwiki', 'markdown', 'tex', 'plaintex', 'asciidoc'] } " just awesome !
Plug 'junegunn/goyo.vim',        "{ 'for': ['markdown', 'tex', 'plaintex', 'asciidoc'] }
Plug 'VincentCordobes/vim-translate', { 'branch': 'dev' }

call plug#end()


source ~/dotfiles/utils.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings
""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard+=unnamedplus
set termguicolors

set pastetoggle=<f6> " Currently needed for neovim paste issue
set nopaste " FIXME: don't remember why it's needed

" filetype on " not required for neovim
set noshowmode " display mode in messages (disable cuz we use vim airlin)
set number " just because

set tabstop=2 shiftwidth=2 expandtab
" set tabstop=4    " Number of spaces that a <Tab> in the file counts for.
" set shiftwidth=4 " number space on reindent << >>
" set expandtab    " spaces instead of tab

set encoding=utf8
set conceallevel=2 " wether hide some char or not
set scrolloff=3    " cursor padding when scrolling

set showmatch      " show matching braces
set hidden         " current buffer can be put into background
set ttimeoutlen=50 " this is for the timeout on ecape press I hope..
set autoread       " Automatically reread changed files without asking me anything
set ignorecase     " Search case insensitive...
set smartcase      " ... but not if it begins with upper case
set guicursor=     " Tell neovim to not change the cursor type in insert mode
set laststatus=2   " Always display the statusline
set mouse=a

let g:python_host_prog = '/Users/vincent/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/vincent/.pyenv/versions/neovim3/bin/python'

"" Scrolling
if !has('gui_running')
    map <ScrollWheelUp> <C-Y>
    map <ScrollWheelDown> <C-E>
endif

"" Turn off swap file
set noswapfile
set nobackup

"" Because I often accidentally :W when I mean to :w.
command! W w

"" use bash
" set shell=/bin/sh

"" We don't want neovim to be in french...
language en_US

"" Leader keyyyyyy
let mapleader = "\<space>"
nnoremap <space> <Nop>

"" Remove auto comment new line..
au FileType * set fo-=c fo-=r fo-=o

"" Define some extra filetype recognition
autocmd BufNewFile,BufRead .babelrc set filetype=json
autocmd BufNewFile,BufRead .eslintrc set filetype=json


augroup qf
    autocmd!

    "" Always put quickfix to the bottom
    autocmd FileType qf wincmd J

    " we don't want to cycle through quickfix buffer!
    autocmd FileType qf set nobuflisted
    autocmd FileType qf call AdjustWindowHeight(3, 10)
augroup END

"" Open quickfix after grep
autocmd QuickFixCmdPost *grep* cwindow



""""""""""""""""""""""""""""""""""""""""""""""""""""
" Themes
""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

if has('gui_running')
    let g:hybrid_reduced_contrast = 1
    set guifont=FiraCode-Regular:h15
else
    let g:hybrid_custom_term_colors = 1
endif

" set background=dark
function! s:configureTheme()
  set background=light
  colorscheme github 
endfunction
call s:configureTheme()


hi DiffAdd guibg=#eff7d7
hi DiffChange guibg=#eff7d7
hi DiffDelete guifg=#a9312a guibg=#ffeef0
hi DiffText guibg=#e6ee9c

hi SpellCap guibg=#ffcdd2
hi SpellBad guibg=#ffcdd2
hi SpellRare guibg=#ffcdd2
hi SpellLocal guibg=#ffcdd2
hi Visual guibg=#eeeeff
hi SignColumn guibg=#e0e0e0
hi NeomakeWarningSignDefault guifg=#a71d5d guibg=#e0e0e0

hi Folded guifg=#464a4d guibg=LightGrey
hi FoldColumn guifg=#464a4d guibg=#e0e0e0


""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""

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

"" Grep
nnoremap <leader>a :Ack!
let g:ack_apply_qmappings=0

"" EasyAlign
"" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
"" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"" Cycle through completion with tab (no need supertab!!)
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

"" Toggle Qf and LocList
nmap <silent> <leader>l :call ToggleList("Location List", 'l')<CR>
nmap <silent> <leader>q :call ToggleList("Quickfix List", 'c')<CR>

"" QF or LF navigation
nnoremap <silent><c-k> :call ListNavigate('previous')<CR>
nnoremap <silent><c-j> :call ListNavigate('next')<CR>

"" Buffer navigation
nnoremap <C-h> :bprevious<CR>
nnoremap <C-l> :bnext<CR>

"" NERDTree
noremap <silent> <leader>n :NERDTreeToggle<CR>
noremap <silent> <leader>f :NERDTreeFind<CR>

"" Git (fugitive)
" nnoremap <leader>gs :Gstatus<CR>
nnoremap <silent><leader>gc :Gcommit<CR>
nnoremap <silent><leader>gd :call ToggleGvdiff()<CR>
nnoremap <silent><leader>gb :Gblame<CR>
nnoremap <silent><leader>gs :call ToggleGStatus()<CR>
nnoremap <silent><leader>gf :GFiles?<CR>

"" Dont go to the next occurence when we search *
nnoremap * :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

"" FZF
if !has('gui_running')
  nnoremap <silent> <C-p> :FZF<CR>
endif
imap <c-x><c-f> <plug>(fzf-complete-file-ag)
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>c :History:<CR>

"" execute q macro on selected lines
xnoremap Q :'<,'>:normal @q<CR>

" Language client
nnoremap <leader>v :call LanguageClient_textDocument_hover()<CR>
nnoremap gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <leader>r :call LanguageClient_textDocument_rename()<CR>
nnoremap <leader>s :call LanguageClient_textDocument_documentSymbol()<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands
""""""""""""""""""""""""""""""""""""""""""""""""""""
command! DisableOpenQF execute "let g:neomake_open_qflist = 0"
command! EnableOpenQF execute "let g:neomake_open_qflist = 1"
command! Datef execute ":pu=strftime('%F')"

command! TFrEn Translate 'fr:en'
command! TEnFr Translate 'en:fr'
command! TClear TranslateClear

nnoremap <silent><leader>t :Translate 'en:fr'<CR>
nnoremap <silent><leader>e :TranslateClear<CR>


command! Refs call LanguageClient_textDocument_references()


" temp stuff
command! Pre Neoformat | Neomake

command! CpFilePath :let @+ = expand("%")


""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""

" Airline
"""""""""
let g:airline_powerline_fonts = 1
let g:airline_theme='github'
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

"" close vim if the only window left open is a NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"" open NERDTree automatically when vim starts up on opening a directory
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif



" Neomake
"""""""""
function! HandleNeomakeJobFinished()
  let winnr = winnr()
  cwindow
  lwindow 
  if winnr() != winnr
    wincmd p
  endif
endfunction

augroup neomake
  autocmd!
  autocmd User NeomakeFinished :call HandleNeomakeJobFinished()
  autocmd BufWritePost * :Neomake
augroup END

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

" "" Python
" let g:neomake_python_enabled_makers = ['pep8', 'pylint', 'flake8']
"
"" ELM
" let g:neomake_elm_enabled_makers = ['elmMake']


" LanguageClient
""""""""""""""""
" let g:LanguageClient_autoStart = 1
" let g:LanguageClient_diagnosticsEnable=0
let g:LanguageClient_selectionUI = 'fzf'
let g:LanguageClient_diagnosticsList='Disabled'
let g:LanguageClient_serverCommands = {
  \ 'javascript': ['javascript-typescript-stdio'],
  \ 'javascript.jsx': ['javascript-typescript-stdio'],
  \ 'typescript': ['javascript-typescript-stdio'],
  \ }

  " \ 'javascript': ['flow-language-server', '--stdio'],
  " \ 'javascript.jsx': ['flow-language-server', '--stdio'],

" Deoplete
""""""""""
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1 " buffer relative file path

" autocmd CompleteDone * pclose! 

" if !exists('g:deoplete#omni#input_patterns')
"     let g:deoplete#omni#input_patterns = {}
" endif
" if exists('g:vimtex#re#deoplete')
"   let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete
" endif

"" Neoformat
""""""""""""
"" javascript (prettier)
" let g:neoformat_javascript_prettier = {
"             \ 'exe': 'prettier',
"             \ 'stdin': 1,
"             \ }
" let g:neoformat_enabled_javascript = ['prettier']
" \ 'args': ['--stdin', '--single-quote', '--trailing-comma', 'es5', '--parser', 'babylon'],

" Use formatprg when available
" let g:neoformat_try_formatprg = 1

" augroup fmt
"   autocmd!
"   autocmd BufWritePre * undojoin | Neoformat
" augroup END


" ELM
"""""
" let g:elm_format_autosave = 1
" let g:deoplete#omni#functions = {}
" let g:deoplete#omni#functions.elm = ['elm#Complete']
" let g:deoplete#omni#input_patterns = {}
" let g:deoplete#omni#input_patterns.elm = '[^ \t]+'
" let g:deoplete#sources = {}
" let g:deoplete#sources.elm = ['omni', 'file', 'ultisnips']



" Misc plugin related config
" (usually small config)
""""""""""""""""""""""""""""

"" fzf
let g:fzf_history_dir = '~/.local/share/fzf-history'

"" vim-javascript
let g:javascript_plugin_flow = 1 

"" vim-jsx
let g:jsx_ext_required = 0 " set filetype=javascript.jsx even on .js


"" vim-json
let g:vim_json_syntax_conceal = 0

"" vim-instant-markdown
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0

"" ack
"" Use ag to grep through files
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
" set grepprg=ag\ --vimgrep\ $*
" set grepformat=%f:%l:%c:%m
endif

" languagetool
let g:languagetool_jar='/usr/local/Cellar/languagetool/4.1/libexec/languagetool-commandline.jar'

" ultisnips 
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my-snippets"]

"vimwiki
" FIXME: I don't know how to do this for now..
command! VimwikiIndex2
      \ call vimwiki#base#goto_index(2)

command! VimwikiIndex3
      \ call vimwiki#base#goto_index(3)

command! VimwikiMakeDiaryNote3
      \ call vimwiki#diary#make_note(v:count3)

let wiki_perso = {}
let wiki_perso.path = '~/Dropbox/wiki/'
let wiki_perso.syntax = 'markdown'
let wiki_perso.ext= '.md'
let wiki_perso.auto_tags = 1 
let wiki_perso.nested_syntaxes = {'python': 'python', 'markdown': 'markdown', 'sh': 'sh', 'sql': 'sql'}

"fluo wiki
let wiki_fluo = {}
let wiki_fluo.path = '~/Dropbox/job/fluo/wiki/'
let wiki_fluo.nested_syntaxes = {'python': 'python', 'sh': 'sh', 'sql': 'sql'}
let wiki_fluo.auto_tags = 1 

"payfit wiki
let wiki_payfit = {}
let wiki_payfit.path = '~/Dropbox/job/payfit/wiki/'
let wiki_payfit.nested_syntaxes = {'python': 'python', 'sh': 'sh', 'sql': 'sql'}
let wiki_payfit.auto_tags = 1 
let g:vimwiki_list = [wiki_perso, wiki_fluo, wiki_payfit]

function! VimwikiLinkHandler(link)
  " Use Vim to open external files with the 'vfile:' scheme.  E.g.:
  "   1) [[vfile:~/Code/PythonProject/abc123.py]]
  "   2) [[vfile:./|Wiki Home]]
  let link = a:link
  if link =~# '^vfile:'
    let link = link[1:]
  else
    return 0
  endif
  let link_infos = vimwiki#base#resolve_link(link)
  if link_infos.filename == ''
    echomsg 'Vimwiki Error: Unable to resolve link!'
    return 0
  else
    exe 'edit ' . fnameescape(link_infos.filename)
    return 1
  endif
endfunction


"" Goyo
autocmd! User GoyoLeave nested call s:configureTheme()
