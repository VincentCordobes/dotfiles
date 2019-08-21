""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin declarations {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')


"" Common
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-vinegar'

"" Git
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'tpope/vim-rhubarb'
Plug 'gregsexton/gitv'

Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command
Plug 'tomtom/tcomment_vim' " comment stuff out
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'SirVer/ultisnips' 
" Plug 'honza/vim-snippets' " { 'for': 'python' } This slow down...
Plug 'sbdchd/neoformat' " autoformat according to various engine
Plug 'moll/vim-bbye'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'bronson/vim-visual-star-search'

"" Utils
Plug 'jaawerth/nrun.vim' " faster which for node
Plug 'junegunn/vader.vim'

"" Themes
Plug 'chriskempson/base16-vim'
Plug 'albertorestifo/github.vim', {'commit': '5dd1be6' }
Plug 'arcticicestudio/nord-vim'

""" Make & Linting
Plug 'benekastah/neomake' " using neovim's job control functonality

"" Misc syntax support
Plug 'othree/html5.vim',       { 'for': 'html' }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'elzr/vim-json',          { 'for': 'json' }
Plug 'neoclide/jsonc.vim',

"" Python
" Plug 'hdima/python-syntax',          { 'for': 'python' }
" Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
" Plug 'zchee/deoplete-jedi',          { 'for': 'python' }

"" Javascript
Plug 'pangloss/vim-javascript',    { 'for': ['javascript', 'javascript.jsx'] }
Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'typescript.tsx'] }
Plug 'maxmellon/vim-jsx-pretty',   { 'for': ['javascript', 'javascript.jsx','typescript', 'typescript.tsx'] }
" Plug 'statico/vim-javascript-sql', { 'for': ['typescript']}

"" Writing
Plug 'vimwiki/vimwiki'
Plug 'soywod/kronos.vim'
Plug 'voldikss/vim-search-me'
" Plug 'lervag/wiki.vim'
Plug 'lervag/vimtex' ,            { 'for': 'tex' }
Plug 'suan/vim-instant-markdown', { 'for': ['markdown', 'tex'] }
Plug 'vim-scripts/LanguageTool',  { 'for': ['vimwiki', 'markdown', 'tex', 'plaintex', 'asciidoc'] } " just awesome !
Plug 'ron89/thesaurus_query.vim', { 'for': ['markdown', 'vimwiki', 'plaintex'] }
Plug 'junegunn/goyo.vim',        "{ 'for': ['markdown', 'tex', 'plaintex', 'asciidoc'] }
Plug 'VincentCordobes/vim-translate'
Plug 'soywod/vim-phonetics', { 'for': ['markdown', 'vimwiki', 'plaintex'] }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

call plug#end()

" }}}

source ~/dotfiles/vim/utils.vim


""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""
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

set pumheight=12 " 12 is enough, no need to hide my entire screen :p 


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
  autocmd BufNewFile,BufRead .prettierrc set filetype=json
  autocmd BufNewFile,BufRead tsconfig.json set filetype=jsonc
  autocmd BufNewFile,BufRead .gitignore set filetype=config
  autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
  autocmd BufNewFile,BufRead *.css set filetype=scss
  autocmd BufNewFile,BufRead zprofile set filetype=zsh
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


" statusline
set statusline=%<%f\ %h%m%r\ \ \ %{coc#status()}\ %=%y\ \ \ %-10.(%l,%v%)\ %P


"" grep
set grepprg=rg\ --vimgrep\ --smart-case
set grepformat=%f:%l:%c:%m,%f:%l:%m

nnoremap <leader>a :Grep<space>
vnoremap <leader>a "ay :Grep -F <c-r>=EscapeSearch(@a)<cr>
command! -nargs=* -complete=file -range Grep silent grep! <args>
" TODO: maybe highlight the result

fun! EscapeSearch(text) 

  fun! s:trim(str)
    return substitute(a:str, '\n', '', 'g')
  endfun

  if a:text !~# '"'
    let l:escaped = '"' . s:trim(a:text) . '"'
  elseif a:text !~# "'"
    let l:escaped = "'" . s:trim(a:text) . "'"
  else
    let l:escaped = '"' . s:trim(escape(a:text, '"')) . '"'
  endif

  if a:text =~# '^-'
    let l:sep = '-- '
  else
    let l:sep = ''
  endif

  return l:sep . l:escaped
endfun


""""""""""""""""""""""""""""""""""""""""""""""""""""
" Themes {{{
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
  " set background=light
  " colorscheme github 
  " source ~/dotfiles/vim/custom_light.vim

  colorscheme nord

endfunction


call s:configureTheme()

hi CocErrorFloat ctermfg=1 guifg=#BF616A
hi CocErrorSign ctermfg=1 guifg=#BF616A
hi link CocHighlightText CursorColumn
hi link CocWarningSign SpecialChar
hi link CocInfoSign SpecialChar





" }}}


""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings {{{
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
" nnoremap <C-h> :bprevious<CR>
" nnoremap <C-l> :bnext<CR>


"" Language tool check
nnoremap <leader>zn ]s
nnoremap <leader>zp [s


"" Git (fugitive)
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
" set cmdheight=2
set signcolumn=yes



" coconfig
set updatetime=300

let g:coc_status_error_sign="✘ "
let g:coc_status_warning_sign="⚠︎ "

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

inoremap <expr> <c-j> pumvisible() ? "\<C-y>" : "\<C-g>u\<c-j>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

augroup coc
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>i  <Plug>(coc-codeaction)
" Fix autofix problem of current line
" nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>k  :<C-u>CocList diagnostics<cr>
" Manage extensions
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" translate
nnoremap <silent> <leader>tt :Translate<CR>
vnoremap <silent> <leader>tt :TranslateVisual<CR>
vnoremap <silent> <leader>tr :TranslateReplace<CR>
nnoremap <silent> <leader>tw viw :TranslateVisual<CR>
nnoremap <silent> <leader>ts :ThesaurusQueryReplaceCurrentWord<CR>


" }}}


""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""
command! DisableOpenQF execute "let g:neomake_open_qflist = 0"
command! EnableOpenQF execute "let g:neomake_open_qflist = 1"
command! Datef execute ":pu=strftime('%F')"

command! Refs :LspReferences
command! -nargs=? -bar Gshow call setqflist(map(systemlist("git show --pretty='' --name-only <args>"), '{"filename": v:val, "lnum": 1}')) | copen

" temp stuff
command! Pre Neoformat | Neomake

command! CpFilePath :let @+ = expand("%")

command! ShowTag :vimgrep "<!--.*-->" % | wincmd H | vertical resize 110

"}}}


""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins configuration {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""


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


"" Javascript
let g:neomake_jsx_enabled_makers = []
let g:neomake_javascript_enabled_makers = []

let g:neomake_ocaml_enabled_makers = ['merlin']


""" Eslint
let g:eslint_path = nrun#Which('eslint')
if g:eslint_path !=# 'eslint not found'
  let g:neomake_javascript_eslint_exe = g:eslint_path
  let g:neomake_jsx_enabled_makers = ['eslint']
  let g:neomake_javascript_enabled_makers = ['eslint']
endif


"" Neoformat
""""""""""""
augroup fmt
  autocmd!
  autocmd FileType javascript,javascript.jsx,typescript,python
        \ autocmd! BufWritePre * Neoformat

augroup END

let g:neoformat_enabled_json = ['prettier']
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_typescript = ['prettier']


" Misc plugin related config
" (usually small config)
""""""""""""""""""""""""""""

"" fzf
let g:fzf_history_dir = '~/.local/share/fzf-history'

"" vim-jsx
let g:jsx_ext_required = 0 " set filetype=javascript.jsx even on .js

let g:vim_jsx_pretty_colorful_config = 1


"" vim-json
let g:vim_json_syntax_conceal = 0

"" vim-instant-markdown
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0



"" Prose
" languagetool
let g:languagetool_jar='/usr/local/Cellar/languagetool/4.5/libexec/languagetool-commandline.jar'
hi link LanguageToolGrammarError CocErrorHighlight
let g:tq_mthesaur_file="~/.config/nvim/thesaurus/mthesaur.txt"
let g:tq_openoffice_en_file="~/.config/nvim/thesaurus/th_en_US_new"


" ultisnips 
let g:UltiSnipsExpandTrigger='<C-j>'
let g:UltiSnipsSnippetDirectories=['my-snippets']


" Wiki
" let g:wiki_filetypes=['md']
" let g:wiki_journal="diary"


"vimwiki
let g:vimwiki_key_mappings=0
" FIXME: I don't know how to do this for now..
command! VimwikiIndex2
      \ call vimwiki#base#goto_index(2)

command! VimwikiIndex3
      \ call vimwiki#base#goto_index(3)

command! VimwikiMakeDiaryNote3
      \ call vimwiki#diary#make_note(v:count3)

let g:vimwiki_global_ext=0
let s:wiki_perso = {}
let s:wiki_perso.path = '~/Dropbox/wiki/'
let s:wiki_perso.syntax = 'markdown'
let s:wiki_perso.ext= '.md'
let s:wiki_perso.auto_tags = 1 
let s:wiki_perso.nested_syntaxes = {'python': 'python', 'sh': 'sh', 'sql': 'sql'}

"fluo wiki
let s:wiki_fluo = {}
let s:wiki_fluo.path = '~/Dropbox/jobs/fluo/wiki/'
let s:wiki_fluo.nested_syntaxes = {'python': 'python', 'sh': 'sh', 'sql': 'sql'}
let s:wiki_fluo.auto_tags = 1 

"foncia wiki
let s:wiki_foncia = {}
let s:wiki_foncia.path = '~/Dropbox/jobs/foncia/wiki/'
let s:wiki_foncia.syntax = 'markdown'
let s:wiki_foncia.ext= '.md'
let s:wiki_foncia.nested_syntaxes = {'python': 'python', 'sh': 'sh', 'sql': 'sql', 'js': 'javascript'}
let s:wiki_foncia.auto_tags = 1 
let g:vimwiki_list = [s:wiki_perso, s:wiki_fluo, s:wiki_foncia]

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
let g:goyo_width = 80

"" translate
let g:translate#default_languages = {
      \ 'fr': 'en',
      \ 'en': 'fr'
      \ }

" vim-search-me
let g:vsm_default_mappings = 0

" }}}

