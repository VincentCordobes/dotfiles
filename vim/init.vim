""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin declarations
""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{
call plug#begin('~/.config/nvim/plugged')


"" Common
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
" Plug 'vim-airline/vim-airline' " statusline
Plug 'tpope/vim-vinegar'

"" Git
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'tpope/vim-rhubarb'
Plug 'gregsexton/gitv'

Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command
Plug 'mileszs/ack.vim' " better grep
Plug 'tomtom/tcomment_vim' " comment stuff out
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'SirVer/ultisnips' 
Plug 'honza/vim-snippets' " { 'for': 'python' } This slow down...
Plug 'sbdchd/neoformat' " autoformat according to various engine
Plug 'moll/vim-bbye'
Plug 'ncm2/ncm2'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'ncm2/ncm2-vim-lsp'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-ultisnips'
Plug 'ncm2/ncm2-cssomni', { 'for': 'css' }
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ryanolsonx/vim-lsp-python', { 'for': 'python' }
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
Plug 'bronson/vim-visual-star-search'

"" Utils
Plug 'jaawerth/nrun.vim' " faster which for node
Plug 'junegunn/vader.vim'

"" Themes
Plug 'chriskempson/base16-vim'
Plug 'albertorestifo/github.vim', {'commit': '5dd1be6' }

""" Make & Linting
" Plug 'benekastah/neomake' " using neovim's job control functonality
Plug 'w0rp/ale'


"" Autocomplete
" Plug 'Shougo/deoplete.nvim' ", { 'for': ['javascript', 'javascript.jsx', 'python', 'tex'] }
" Plug 'Shougo/echodoc.vim'

"" Misc syntax support
Plug 'othree/html5.vim',       { 'for': 'html' }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'elzr/vim-json',          { 'for': 'json' }

"" Python
" Plug 'hdima/python-syntax',          { 'for': 'python' }
" Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
" Plug 'zchee/deoplete-jedi',          { 'for': 'python' }

"" Javascript
" Plug 'ruanyl/vim-fixmyjs',      { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx',             { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'moll/vim-node',           { 'for': ['javascript', 'javascript.jsx'] } " node support
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'typescript.jsx'] }
" Plug 'soywod/typescript.vim'

"" Writing
Plug 'vimwiki/vimwiki'
" Plug 'lervag/wiki.vim'
Plug 'lervag/vimtex' ,            { 'for': 'tex' }
Plug 'suan/vim-instant-markdown', { 'for': ['markdown', 'tex'] }
Plug 'vim-scripts/LanguageTool',  { 'for': ['vimwiki', 'markdown', 'tex', 'plaintex', 'asciidoc'] } " just awesome !
Plug 'junegunn/goyo.vim',        "{ 'for': ['markdown', 'tex', 'plaintex', 'asciidoc'] }
Plug 'VincentCordobes/vim-translate'
Plug 'soywod/vim-phonetics'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

call plug#end()

" }}}

source ~/dotfiles/vim/utils.vim


""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings
""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{
set clipboard+=unnamedplus
set termguicolors " true colors

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

set foldmethod=syntax
set foldlevelstart=99


" set previewheight=5 " preview window height

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
" vint: -ProhibitImplicitScopeVariable
let mapleader = "\<space>"
nnoremap <space> <Nop>

autocmd filetype crontab setlocal nobackup nowritebackup

"" Remove auto comment new line..
augroup remove_new_line_comment
  autocmd!
  au FileType * set fo-=c fo-=r fo-=o
augroup END

"" Define some extra filetype recognition
augroup filetypes
  autocmd!
  autocmd BufNewFile,BufRead .babelrc set filetype=json
  autocmd BufNewFile,BufRead .eslintrc set filetype=json
augroup END

augroup customfold
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vader setlocal foldmethod=marker
augroup END

augroup qf
  autocmd!

  "" Always put quickfix to the bottom
  autocmd FileType qf wincmd J

  " we don't want to cycle through quickfix buffer!
  autocmd FileType qf set nobuflisted
  autocmd FileType qf call AdjustWindowHeight(3, 10)

  "" Open quickfix after grep
  autocmd QuickFixCmdPost *grep* cwindow
augroup END

" }}}


""""""""""""""""""""""""""""""""""""""""""""""""""""
" Themes
""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{
syntax on

if has('gui_running')
  let g:hybrid_reduced_contrast = 1
  set guifont=FiraCode-Regular:h15
else
  let g:hybrid_custom_term_colors = 1
endif


" set background=dark
function! s:configureTheme()
  " set background=light
  " colorscheme github 
  " source ~/dotfiles/vim/custom_light.vim

  set background=dark
  colorscheme base16-hopscotch

endfunction


call s:configureTheme()


" }}}


""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

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
nnoremap <leader>s :Ack <C-r><C-w>
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


"" Language tool check
nnoremap <leader>zn ]s
nnoremap <leader>zp [s


"" window switch
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-l> <C-w>l
" nnoremap <C-k> <C-w>k


"" NERDTree
" noremap <silent> <leader>n :NERDTreeToggle<CR>
noremap <silent> <leader>n :Explore<CR>
" let g:netrw_localrmdir='rm -r'
noremap <silent> <leader>f :NERDTreeFind<CR>

"" Git (fugitive)
" nnoremap <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gd :call ToggleGvdiff()<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gs :call ToggleGStatus()<CR>
nnoremap <silent> <leader>gf :GFiles?<CR>

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
set completeopt=noinsert,menuone,noselect
set shortmess+=c


" ncm2
let g:ncm2_look_use_spell = 1
augroup ncm2
  autocmd!
  autocmd BufEnter * call ncm2#enable_for_buffer()
  autocmd filetype markdown let b:ncm2_look_enabled = 1

  " if executable('typescript-language-server')
  "   au User lsp_setup call lsp#register_server({
  "         \ 'name': 'typescript-language-server',
  "         \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
  "         \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
  "         \ 'whitelist': ['typescript', 'javascript', 'javascript.jsx']
  "         \ })
  " endif

  if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
          \ 'name': 'typescript-language-server',
          \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
          \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
          \ 'whitelist': ['typescript', 'javascript', 'javascript.jsx']
          \ })
  endif

  if executable('ocaml-language-server')
    au User lsp_setup call lsp#register_server({
          \ 'name': 'ocaml-language-server',
          \ 'cmd': {server_info->[&shell, &shellcmdflag, 'ocaml-language-server --stdio']},
          \ 'whitelist': ['reason', 'ocaml'],
          \ })
  endif
augroup END


" augroup language_client
"   autocmd!
"   autocmd FileType javascript.jsx,typescript,ocaml nnoremap <silent> <leader>v :call LanguageClient_textDocument_hover()<CR>
"   autocmd FileType javascript.jsx,typescript,ocaml nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
"   autocmd FileType javascript.jsx,typescript,ocaml nnoremap <silent><leader>r :call LanguageClient_textDocument_rename()<CR>
"   autocmd FileType javascript.jsx,typescript,ocaml nnoremap <silent><leader>s :call LanguageClient_textDocument_documentSymbol()<CR>
" augroup END

nnoremap <silent> gd :LspDefinition<CR>
nnoremap <silent> <leader>v :LspHover<CR>
nnoremap <silent><leader>r :LspRename<CR>


" translate
nnoremap <silent> <leader>tt :Translate<CR>
vnoremap <silent> <leader>tt :TranslateVisual<CR>
vnoremap <silent> <leader>tr :TranslateReplace<CR>
nnoremap <silent> <leader>tc :TranslateReplace<CR>


" }}}


""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands
""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{
command! DisableOpenQF execute "let g:neomake_open_qflist = 0"
command! EnableOpenQF execute "let g:neomake_open_qflist = 1"
command! Datef execute ":pu=strftime('%F')"

command! Refs :LspReferences
command! Grep Ack!
command! -nargs=? -bar Gshow call setqflist(map(systemlist("git show --pretty='' --name-only <args>"), '{"filename": v:val, "lnum": 1}')) | copen

" temp stuff
command! Pre Neoformat | Neomake

command! CpFilePath :let @+ = expand("%")

"}}}


""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

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
" let g:NERDTreeWinSize = 60




" Neomake
"""""""""
function! HandleNeomakeJobFinished()
  let l:winnr = winnr()
  let l:qfopen = IsBufOpen('Quickfix List')
  lwindow 
  if winnr() != l:winnr
    wincmd p
  endif
endfunction

" augroup neomakee
"   autocmd!
"   autocmd User NeomakeFinished :call HandleNeomakeJobFinished()
"   autocmd BufWritePost * :Neomake
" augroup END

let g:neomake_list_height = 10
" let g:neomake_open_list = 2 " auto open list if error


" Ale
"""""""""
" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0

"" Javascript
let g:neomake_jsx_enabled_makers = []
let g:neomake_javascript_enabled_makers = []


""" Eslint
let g:eslint_path = nrun#Which('eslint')
if g:eslint_path !=# 'eslint not found'
  let g:neomake_javascript_eslint_exe = g:eslint_path
  let g:neomake_jsx_enabled_makers = ['eslint']
  let g:neomake_javascript_enabled_makers = ['eslint']
endif


" LanguageClient
""""""""""""""""
" let g:LanguageClient_selectionUI = 'fzf'
" " let g:LanguageClient_diagnosticsList='Disabled'
" let g:LanguageClient_diagnosticsList='Location'
" let g:LanguageClient_serverCommands = {
"   \ 'javascript': ['javascript-typescript-stdio'],
"   \ 'javascript.jsx': ['javascript-typescript-stdio'],
"   \ 'typescript': ['javascript-typescript-stdio'],
"   \ 'ocaml': ['ocaml-language-server', '--stdio'],
"   \ }
"
  " \ 'javascript': ['flow-language-server', '--stdio'],
  " \ 'javascript.jsx': ['flow-language-server', '--stdio'],

" Deoplete
""""""""""
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1 " buffer relative file path

imap <C-Space> <Plug>(ncm2_manual_trigger)
" imap <C-Space> <Plug>(cm_force_refresh)

"" Neoformat
""""""""""""
augroup fmt
  autocmd!
  autocmd FileType javascript,javascript.jsx,typescript
        \ autocmd! BufWritePre * Neoformat
augroup END


" Misc plugin related config
" (usually small config)
""""""""""""""""""""""""""""

"" fzf
let g:fzf_history_dir = '~/.local/share/fzf-history'

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
let g:UltiSnipsExpandTrigger='<C-j>'
let g:UltiSnipsSnippetDirectories=['UltiSnips', 'my-snippets']

"vimwiki
" FIXME: I don't know how to do this for now..
command! VimwikiIndex2
      \ call vimwiki#base#goto_index(2)

command! VimwikiIndex3
      \ call vimwiki#base#goto_index(3)

command! VimwikiMakeDiaryNote3
      \ call vimwiki#diary#make_note(v:count3)

let s:wiki_perso = {}
let s:wiki_perso.path = '~/Dropbox/wiki/'
let s:wiki_perso.syntax = 'markdown'
let s:wiki_perso.ext= '.md'
let s:wiki_perso.auto_tags = 1 
let s:wiki_perso.nested_syntaxes = {'python': 'python', 'markdown': 'markdown', 'sh': 'sh', 'sql': 'sql'}

"fluo wiki
let s:wiki_fluo = {}
let s:wiki_fluo.path = '~/Dropbox/job/fluo/wiki/'
let s:wiki_fluo.nested_syntaxes = {'python': 'python', 'sh': 'sh', 'sql': 'sql'}
let s:wiki_fluo.auto_tags = 1 

"payfit wiki
let s:wiki_payfit = {}
let s:wiki_payfit.path = '~/Dropbox/job/payfit/wiki/'
let s:wiki_payfit.nested_syntaxes = {'python': 'python', 'sh': 'sh', 'sql': 'sql', 'js': 'javascript'}
let s:wiki_payfit.auto_tags = 1 
let g:vimwiki_list = [s:wiki_perso, s:wiki_fluo, s:wiki_payfit]

let g:vimwiki_listsyms = ' .oOx'

function! VimwikiLinkHandler(link)
  " Use Vim to open external files with the 'vfile:' scheme.  E.g.:
  "   1) [[vfile:~/Code/PythonProject/abc123.py]]
  "   2) [[vfile:./|Wiki Home]]
  let l:link = a:link
  if l:link =~# '^vfile:'
    let l:link = l:link[1:]
  else
    return 0
  endif
  let l:link_infos = vimwiki#base#resolve_link(l:link)
  if l:link_infos.filename ==# ''
    echomsg 'Vimwiki Error: Unable to resolve link!'
    return 0
  else
    exe 'edit ' . fnameescape(l:link_infos.filename)
    return 1
  endif
endfunction


"" Goyo
" vint: -ProhibitAutocmdWithNoGroup
autocmd! User GoyoLeave nested call s:configureTheme()

"" translate
let g:translate#default_languages = {
      \ 'fr': 'en',
      \ 'en': 'fr'
      \ }

" }}}
