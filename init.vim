call plug#begin('~/.config/nvim/plugged')

" FUZZY FINDER

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Plug 'mattn/emmet-vim'

Plug 'scrooloose/nerdtree' 
Plug 'mileszs/ack.vim' " search inside files using ack. Same as command line ack utility, but use :Ack
Plug 'vim-airline/vim-airline'  " fancy statusline
Plug 'vim-airline/vim-airline-themes' " themes for vim-airline
Plug 'benekastah/neomake' " neovim replacement for syntastic using neovim's job control functonality
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-surround'

Plug 'othree/html5.vim', { 'for': 'html' } " html5 support
Plug 'mxw/vim-jsx' 
Plug 'pangloss/vim-javascript', { 'branch': 'master' }
Plug 'moll/vim-node', { 'for': 'javascript' } " node support
Plug 'elzr/vim-json', { 'for': 'json' } " JSON support

Plug 'hail2u/vim-css3-syntax', { 'for': 'css' } " CSS3 syntax support

" Plug 'tpope/vim-markdown', { 'for': 'markdown' } " markdown support

Plug 'junegunn/vim-easy-align'
Plug 'tomtom/tcomment_vim' " comment stuff out

Plug 'hynek/vim-python-pep8-indent'
Plug 'hdima/python-syntax'

" autocomplete plugin
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'ervandew/supertab'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install', 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

Plug 'steelsojka/deoplete-flow'
" Plug 'flowtype/vim-flow'
Plug 'Shougo/echodoc.vim'

Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }

" Plug 'mhartington/deoplete-typescript'
" Plug 'leafgarland/typescript-vim'
" Plug 'Quramy/vim-js-pretty-template'

Plug 'mhartington/oceanic-next'
Plug 'w0ng/vim-hybrid'
Plug 'suan/vim-instant-markdown'
Plug 'ruanyl/vim-fixmyjs'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons' "This should be loaded at the end
Plug 'LanguageTool', { 'for': ['markdown', 'tex', 'plaintex'] }
Plug 'ryanoasis/vim-devicons' "This should be loaded at the end
Plug 'jaawerth/nrun.vim'
" Plug 'rhysd/vim-grammarous', { 'for': ['markdown'] }

call plug#end()

" Neovim Settings
set clipboard+=unnamedplus

" Currently needed for neovim paste issue
set pastetoggle=<f6>
set nopaste

filetype on
set noshowmode "we use vim airlin
set relativenumber number
set tabstop=2 shiftwidth=2 expandtab
" set tabstop=4 
" set shiftwidth=4 "number space on reindent << >>
" set expandtab "spaces instead of tab

set conceallevel=0
set scrolloff=3
set showmatch " show matching braces
set encoding=utf8
set hidden                  " current buffer can be put into background
set ttimeoutlen=50 " this is for the timeout on ecape press I hope..
set autoread                    " Automatically reread changed files without asking me anything
set ignorecase               " Search case insensitive...
set smartcase                " ... but not it begins with upper case 

let mapleader = "\<space>"
nnoremap <space> <Nop>

map <ScrollWheelUp> <C-Y>
map <S-ScrollWheelUp> <C-U>
" autocmd BufReadPost,FileReadPost,BufNewFile,BufEnter * call system("tmux rename-window 'vim | " . expand("%:t") . "'")
" autocmd VimLeave * call system("tmux rename-window 'tmux'")

" turn off swap file
set noswapfile
set nobackup

" Keep selection when indenting/outdenting.
vnoremap > >gv
vnoremap < <gv

" Un-highlight search matches
nnoremap <silent><leader><space> :noh<CR>

" Ack
nnoremap <leader>a :Ack


"vim jsx
let g:jsx_ext_required = 0

" vim javascript conf
" let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

"airline-config
let g:airline_powerline_fonts = 1
let g:airline_theme='oceanicnext'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ''
let g:airline_right_alt_sep = '|'

"Themes
syntax on
let g:hybrid_custom_term_colors = 1
set background=dark
colorscheme hybrid
highlight Comment cterm=italic
highlight htmlArg cterm=italic
highlight xmlString cterm=italic



" neomake custom colors
hi NeomakeError guifg=#ff0000 ctermfg=196 gui=undercurl cterm=undercurl
hi NeomakeErrorSign guifg=#ff0000 ctermfg=196

set laststatus=2

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Neomake

" Eslint
let g:neomake_jsx_enabled_makers = []
let g:neomake_javascript_enabled_makers = []

let g:eslint_path = nrun#Which('eslint')
if g:eslint_path != 'eslint not found'
  let g:neomake_javascript_eslint_exe = g:eslint_path
  let g:neomake_jsx_enabled_makers = ['eslint']
  let g:neomake_javascript_enabled_makers = ['eslint']
endif

" let g:neomake_javascript_enabled_makers = ['eslint', 'flow']
" let g:neomake_javascript_enabled_makers = ['eslint']
" let g:neomake_jsx_enabled_makers = ['eslint', 'flow']
" let g:neomake_jsx_enabled_makers = ['eslint']
" let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
" let g:neomake_typescript_tslint_exe = $PWD .'/node_modules/.bin/tslint'
" let g:neomake_javascript_flow_exe = $PWD .'/node_modules/.bin/flow'
" let g:neomake_jsx_flow_exe = $PWD .'/node_modules/.bin/flow'


" let g:neomake_python_enabled_makers = ['pep8', 'pylint', 'flake8']


" let g:neomake_open_list = 2
let g:neomake_list_height = 10

autocmd! BufWritePost * Neomake

" fixmyjs
let g:fixmyjs_engine = 'eslint'
" use linting tool installed locally in node_modules folder
let g:fixmyjs_use_local = 1

" Deoplete completion ------------------------------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1

" javascript completion
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
\]
  " \ 'jspc#omni'
set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ternjs']
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" autocmd FileType javascript nnoremap <silent> <buffer> gd :TernDef<CR>
" close top panel after accept completion
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" python completion
" let g:deoplete#sources#jedi#show_docstring = 1

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" close the preview window when you're not using it
let g:SuperTabClosePreviewOnPopupClose = 1
let g:UltiSnipsExpandTrigger="<C-j>"
let g:SuperTabDefaultCompletionType = "<c-n>"

" ----------------------------------------------------

" remove auto comment new line..
au FileType * set fo-=c fo-=r fo-=o

" fzf
nnoremap <silent> <C-p> :FZF<CR>

" don't hide quotes in json files
let g:vim_json_syntax_conceal = 0


" moving up and down work as you would expect
noremap <Up> gk
noremap <Down> gj
noremap k gk
noremap j gj

autocmd BufNewFile,BufRead .babelrc set filetype=json
autocmd BufNewFile,BufRead .jshintrc set filetype=json
autocmd BufNewFile,BufRead .eslintrc set filetype=json

" template literal coloration 
" autocmd FileType typescript JsPreTmpl markdown
" autocmd FileType javascript JsPreTmpl html
" autocmd FileType typescript syn clear foldBraces

let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0

" auto open if no file specified
" autocmd vimenter * if !argc() | NERDTree | endif

" markdown spellcheck
" autocmd BufRead,BufNewFile *.md setlocal spell

" NERDTress File highlighting
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
" let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '


" mapping nerdtree
" noremap <c-n> :NERDTreeToggle<CR>
" noremap <C-f> :NERDTreeFind<CR>
noremap <silent> <leader>n :NERDTreeToggle<CR>
noremap <silent> <leader>f :NERDTreeFind<CR>


" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif


" flow config


if findfile('.flowconfig', '.;') !=# ''
  let g:flow_path = nrun#Which('flow')
  if g:flow_path != 'flow not found'

    let g:neomake_javascript_flow_maker = {
          \ 'exe': 'sh',
          \ 'args': ['-c', g:flow_path.' --json 2> /dev/null | flow-vim-quickfix'],
          \ 'errorformat': '%E%f:%l:%c\,%n: %m',
          \ 'cwd': '%:p:h' 
          \ }
    let g:neomake_javascript_enabled_makers = g:neomake_javascript_enabled_makers + [ 'flow']
    let g:deoplete#sources#flow#flow_bin = g:flow_path
  endif
endif


" prettier
" autocmd FileType javascript set formatprg=prettier\ --stdin
" autocmd BufWritePre *.js :normal gggqG
" autocmd BufWritePre *.js exe "normal! gggqG\<C-o>\<C-o>"

" Use ag to grep through files
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" always put quickfix to the bottom
autocmd FileType qf wincmd J
nnoremap <C-n> :cn<CR>
nnoremap <C-m> :cp<CR>
" nnoremap ? , 

" Because I often accidentally :W when I mean to :w.
command! W w

nnoremap <C-h> :bprevious<CR>
nnoremap <C-l> :bnext<CR>

" we don't want to cycle through quickfix buffer!
augroup qf
    autocmd!
    autocmd FileType qf set nobuflisted
augroup END

" git open quickfix
autocmd QuickFixCmdPost *grep* cwindow


nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gl :Glog<CR><CR>


let g:languagetool_jar='/usr/local/Cellar/languagetool/3.6/libexec/languagetool-commandline.jar'
