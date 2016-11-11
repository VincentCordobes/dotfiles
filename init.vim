call plug#begin('~/.config/nvim/plugged')

" FUZZY FINDER
" Plug 'ctrlpvim/ctrlp.vim' " fuzzy file finder, mapped to <leader>t

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'mattn/emmet-vim'

Plug 'scrooloose/nerdtree' 
" Plug 'Xuyuanp/nerdtree-git-plugin'  " file drawer
Plug 'mileszs/ack.vim' " search inside files using ack. Same as command line ack utility, but use :Ack
Plug 'vim-airline/vim-airline'  " fancy statusline
Plug 'vim-airline/vim-airline-themes' " themes for vim-airline
Plug 'benekastah/neomake' " neovim replacement for syntastic using neovim's job control functonality
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command

Plug 'othree/html5.vim', { 'for': 'html' } " html5 support
Plug 'mxw/vim-jsx' 
" Plug 'othree/yajs.vim', { 'for': 'javascript' } " JavaScript syntax plugin
" Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' } " ES6 and beyond syntax
Plug 'pangloss/vim-javascript', { 'branch': 'master' }
" Plug 'gavocanov/vim-js-indent', { 'for': 'javascript' } " JavaScript indent support
Plug 'moll/vim-node', { 'for': 'javascript' } " node support
Plug 'elzr/vim-json', { 'for': 'json' } " JSON support

Plug 'hail2u/vim-css3-syntax', { 'for': 'css' } " CSS3 syntax support

Plug 'tpope/vim-markdown', { 'for': 'markdown' } " markdown support

Plug 'junegunn/vim-easy-align'
Plug 'mattn/emmet-vim'
Plug 'tomtom/tcomment_vim' " comment stuff out
Plug 'elixir-lang/vim-elixir'


" autocomplete plugin
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install', 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'zchee/deoplete-jedi'

Plug 'steelsojka/deoplete-flow'
Plug 'Shougo/echodoc.vim'

Plug 'mhartington/deoplete-typescript'
Plug 'leafgarland/typescript-vim'
" Plug 'Quramy/vim-js-pretty-template'

Plug 'mhartington/oceanic-next'
Plug 'w0ng/vim-hybrid'
Plug 'suan/vim-instant-markdown'
Plug 'ruanyl/vim-fixmyjs'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons' "This should be loaded at the end

call plug#end()

" Neovim Settings
set clipboard+=unnamedplus

" Currently needed for neovim paste issue
set pastetoggle=<f6>
set nopaste

set noshowmode
filetype on
set relativenumber number
set tabstop=2 shiftwidth=2 expandtab
" set conceallevel=0
set scrolloff=3
set showmatch " show matching braces
set encoding=utf8
set ttimeoutlen=50 " this is for the timeout on ecape press I hope..


"vim jsx
let g:jsx_ext_required = 0

" vim javascript conf
" let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

"airline-config
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1

"Themes
syntax on
let g:hybrid_custom_term_colors = 1
set background=dark
colorscheme hybrid
highlight Comment cterm=italic
highlight htmlArg cterm=italic
highlight xmlString cterm=italic


let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_theme='oceanicnext'

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
	
" Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
let g:neomake_typescript_tslint_exe = $PWD .'/node_modules/.bin/tslint'
autocmd! BufWritePost * Neomake

" fixmyjs
let g:fixmyjs_engine = 'eslint'
" use linting tool installed locally in node_modules folder
let g:fixmyjs_use_local = 1

" Deoplete completion ------------------------------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
" let g:tern_request_timeout = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]
" let g:deoplete#enable_ignore_case = 1
set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]


" let g:deoplete#sources#flow#flow_bin = 'flow' 
autocmd FileType javascript nnoremap <silent> <buffer> gd :TernDef<CR>

" close top panel after accept completion
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" close the preview window when you're not using it
let g:SuperTabClosePreviewOnPopupClose = 1
let g:UltiSnipsExpandTrigger="<C-j>"

" ----------------------------------------------------

" remove auto comment new line..
au FileType * set fo-=c fo-=r fo-=o

" fzf
nnoremap <silent> <C-p> :FZF<CR>

" don't hide quotes in json files
let g:vim_json_syntax_conceal = 0

" let g:ycm_path_to_python_interpreter="/usr/local/bin/python3"
let g:python3_host_prog = '/usr/local/bin/python3'


" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

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
autocmd BufRead,BufNewFile *.md setlocal spell

" NERDTress File highlighting
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
" let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '


" mapping nerdtree
map <C-n> :NERDTreeToggle<CR>

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif


" function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
" exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
" exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
" endfunction
"
" call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
" call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
" call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
" call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
" call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
" call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
" call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
" call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
" call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
" call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
" call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
" call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')
