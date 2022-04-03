""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin declarations {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

"" Common
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-vinegar'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

"" Git
Plug 'tpope/vim-fugitive' 
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'

Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command
Plug 'tomtom/tcomment_vim' " comment stuff out
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'SirVer/ultisnips' 
Plug 'sbdchd/neoformat'
Plug 'moll/vim-bbye'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'bronson/vim-visual-star-search'

"" Utils
" Plug 'jaawerth/nrun.vim' " faster which for node
" Plug 'junegunn/vader.vim'

"" Themes
Plug 'albertorestifo/github.vim', {'commit': '5dd1be6' }
Plug 'arcticicestudio/nord-vim'

""" Make & Linting
Plug 'benekastah/neomake' " using neovim's job control functonality

"" Misc syntax support
Plug 'ocaml/vim-ocaml'
Plug 'othree/html5.vim',          { 'for': 'html' }
Plug 'hail2u/vim-css3-syntax',    { 'for': 'css' }
Plug 'elzr/vim-json',             { 'for': 'json' }
Plug 'neoclide/jsonc.vim',
Plug 'neovimhaskell/haskell-vim', {'for': 'haskell'}

"" Python
" Plug 'hdima/python-syntax',          { 'for': 'python' }
" Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
" Plug 'zchee/deoplete-jedi',          { 'for': 'python' }


"" rust
Plug 'cespare/vim-toml'

"" Writing
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'lervag/wiki.vim'
Plug 'junegunn/goyo.vim', { 'for': ['markdown', 'tex', 'plaintex', 'asciidoc'] }
Plug 'voldikss/vim-search-me'
Plug 'lervag/vimtex' ,            { 'for': 'tex' }
Plug 'PratikBhusal/vim-grip'
Plug 'vim-scripts/LanguageTool',  { 'for': ['vimwiki', 'markdown', 'tex', 'plaintex', 'asciidoc'] } " just awesome !
Plug 'VincentCordobes/vim-translate'
" Plug '~/code/vim-translate'
Plug '~/code/phonetics.vim' 
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

Plug 'ledger/vim-ledger', { 'for': 'ledger' }

call plug#end()

" }}}

source ~/dotfiles/vim/utils.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard+=unnamedplus
set termguicolors " true colors

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
set pumheight=12 " 12 is enough, no need to hide my entire screen :p 
set completeopt=noinsert,menuone,noselect
set shortmess+=c
set signcolumn=yes
set title

" let g:python_host_prog = '/Users/vincent/.pyenv/versions/neovim2/bin/python'
" let g:python3_host_prog = '/Users/vincent/.pyenv/versions/neovim3/bin/python'

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
  " autocmd BufNewFile,BufRead *.css set filetype=scss
  autocmd BufNewFile,BufRead zprofile set filetype=zsh
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

" statusline
set statusline=%<%f\ %h%m%r\ \ \ %{coc#status()}\ %=%y\ \ %{&fileencoding?&fileencoding:&encoding}\ \ %-10.(%l,%v%)\ %P

"" grep
set grepprg=rg\ --vimgrep\ --smart-case
set grepformat=%f:%l:%c:%m,%f:%l:%m

fun! EscapeSearch(text) 
  let l:text = trim(a:text)
  let l:text = substitute(l:text, '^-', '\\-', '')
  let l:text = substitute(l:text, '\n', '\\\n', 'g')

  let l:opts = ['F']
  if l:text =~# '\n'
    let l:opts = l:opts + ['U'] 
  endif

  if l:text !~# '"'
    let l:escaped = '"' . l:text . '"'
  elseif l:text !~# "'"
    let l:escaped = "'" . l:text . "'"
  else
    let l:escaped = '"' . escape(l:text, '"') . '"'
  endif

  return l:escaped . ' -' . join(l:opts, '')
endfun

nnoremap <leader>a :Grep<space>
vnoremap <leader>a "ay :Grep <c-r>=EscapeSearch(@a)<cr>
command! -nargs=+ -complete=file_in_path -range Grep silent exe "grep!" escape(<q-args>, '|#%')

fun! s:foldMethodComplete(ArgLead, CmdLine, CursorPos)
  return ["indent",  "syntax", "expr"]
endfun

command! -nargs=1 -complete=customlist,s:foldMethodComplete FoldMethod silent setlocal foldmethod=<args>


" TODO: remove once https://github.com/neovim/neovim/issues/11330 is resolved
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"

" }}}

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
function! s:configureTheme(color)
  if $COLORSCHEME == 'light' || a:color == 'light'
    set background=light
    colorscheme github 
    source ~/dotfiles/vim/custom_light.vim
  else
    colorscheme nord
    hi DiffDelete guifg=NONE guibg=#5a414d gui=NONE
    " hi DiffDelete guifg=#383E50 guibg=#333947 
    hi DiffAdd guifg=NONE guibg=#4c5b6f
    hi DiffChange guifg=NONE guibg=#3f4a5a
    hi DiffText guifg=NONE guibg=#4c5b6f
    "
  endif
endfunction

let g:nord_uniform_diff_background = 1
let g:nord_italic = 1
let g:nord_underline = 1

call s:configureTheme('dark')

command! -nargs=? GoLight :call s:configureTheme('light')

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

"" Cycle through completion with tab
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

"" Dont go to the next occurence when we search *
nnoremap * :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

"" execute q macro on selected lines
xnoremap Q :'<,'>:normal @q<CR>

nmap <c-l> <Plug>(GitGutterNextHunk)
nmap <c-h> <Plug>(GitGutterPrevHunk)
let g:gitgutter_sign_added = '│'
let g:gitgutter_sign_modified = '│'


command! CopyToSlack execute ':!pandoc -f gfm -t ~/scripts/slack.lua "'. expand('%') . '"' . ' | wl-copy'


" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""

command! AbsolutePath execute "echo expand('%:p')"
command! DisableOpenQF execute "let g:neomake_open_qflist = 0"
command! EnableOpenQF execute "let g:neomake_open_qflist = 1"
command! Datef execute ":pu=strftime('%F')"

command! -nargs=? -bar Gshow call setqflist(map(systemlist("git show --pretty='' --name-only <args>"), '{"filename": v:val, "lnum": 1}')) | copen

" temp stuff
command! Pre Neoformat | Neomake
command! CpFilePath :let @+ = expand("%")
command! ShowTag :vimgrep "<!--.*-->" % | wincmd H | vertical resize 110

command! TitleFileName put! =expand('%:t:r')

command! CreateCard execute '!prep add-file "' . expand('%') .'"'

command! -nargs=? Prose call s:enable_prose(<q-args>)
command! NoProse call s:disable_prose()

command! WhatIsThisHiGroup :let s = synID(line('.'), col('.'), 1) | echo synIDattr(s, 'name') . ' -> ' . synIDattr(synIDtrans(s), 'name')

fun s:enable_prose(lang)
  if &filetype == ''
    set filetype=markdown
  endif
  let l:lang = a:lang != '' ? a:lang : "en_us"
  let &spelllang = l:lang
  " set spell

  CocEnable
  call coc#config('languageserver', {
        \ 'prose': {
        \ 'command': '~/code/prose-language-server/build/index.js',
        \ 'args': ['--stdio'],
        \ 'trace.server': 'verbose',
        \ 'filetypes': ['markdown', 'vimwiki'],
        \ }
        \})
endfun

fun s:disable_prose()
  LanguageToolClear
  set nospell
  CocDisable
endfun
"}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins configuration {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""

" nvim-treesitter {{{
set foldexpr=nvim_treesitter#foldexpr()

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "rust", "c", "javascript", "typescript", "tsx", "css", "ocaml", "ocamllex", "bash", "python" },
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  indent = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      scope_incremental = "<TAB>",
      node_incremental = "<CR>",
      node_decremental = "<BS>",
    },
  },
}
EOF
" }}}

" vim-markdown {{{
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_strikethrough = 1
" }}}

" Neomake {{{
function! HandleNeomakeJobFinished()
  let l:winnr = winnr()
  let l:qfopen = s:isbufopen('Quickfix List')
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

" let g:neomake_open_list = 2 " auto open list if error
let g:neomake_list_height = 10
let g:neomake_jsx_enabled_makers = []
let g:neomake_javascript_enabled_makers = []
let g:neomake_ocaml_enabled_makers = ['merlin']
" }}}

" Neoformat {{{
augroup fmt
  autocmd!
  " autocmd FileType javascript,javascript.jsx,typescript,python
  "       \ autocmd! BufWritePre * Neoformat

augroup END

let g:neoformat_enabled_json = ['prettier']
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_typescript = ['prettier']
" }}}

" fzf {{{
autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

let g:fzf_preview_window = ''
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_layout = { 'down': '~40%' }

nnoremap <silent> <C-p> :FZF<CR>
nnoremap <silent> <leader>ff :FZF<CR>
nnoremap <silent> <leader>fb :Buffers<CR>
nnoremap <silent> <leader>fr :History<CR>
nnoremap <silent> <leader>fg :call fzf#vim#gitfiles('?', {'options': ['--no-preview']})<CR>
nnoremap <silent> <leader>is :Snippets<CR>
nnoremap <silent> <leader>x :Commands<CR>

imap <c-x><c-f> <plug>(fzf-complete-file-ag)
" }}}

" vim-jsx {{{
let g:jsx_ext_required = 0 
let g:vim_jsx_pretty_colorful_config = 1
" }}}

" vim-json {{{
let g:vim_json_syntax_conceal = 0
" }}}

" languagetool {{{
let g:languagetool_jar='/usr/local/Cellar/languagetool/4.8_1/libexec/languagetool-commandline.jar'
hi link LanguageToolGrammarError CocErrorHighlight

nnoremap <leader>zn ]s
nnoremap <leader>zp [s
" }}}

" thesaurus_query {{{
let g:tq_mthesaur_file="~/.config/nvim/thesaurus/mthesaur.txt"
let g:tq_openoffice_en_file="~/.config/nvim/thesaurus/th_en_US_new"
let g:tq_language=['en', 'fr']
let g:tq_enabled_backends=["openoffice_en", "mthesaur_txt", "synonymo_fr"]

nnoremap <silent> <leader>tes :ThesaurusQueryReplaceCurrentWord<CR>
" }}}

" ultisnips  {{{
let g:UltiSnipsExpandTrigger='<C-j>'
let g:UltiSnipsSnippetDirectories=['my-snippets']
" }}}

" vim-translate {{{
let g:translate#default_languages = {
      \ 'fr': 'en',
      \ 'en': 'fr'
      \ }

nnoremap <silent> <leader>tt :Translate<CR>
vnoremap <silent> <leader>tt :TranslateVisual<CR>
vnoremap <silent> <leader>tr :TranslateReplace<CR>
nnoremap <silent> <leader>tw viw :TranslateVisual<CR>
nmap <leader>ts <Plug>Translate
nmap <leader>tr <Plug>TranslateReplace
" }}}

" vim-search-me {{{
let g:vsm_default_mappings = 0
" }}}

" vim-easy-align {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

" vim-fugitive {{{
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gd :call ToggleGvdiff()<CR>
nnoremap <silent> <leader>gb :Git blame<CR>
nnoremap <silent> <leader>gs :call ToggleGStatus()<CR>
" }}}

" vim.wiki {{{
nnoremap <C-space> :WikiListToggle<CR>
nnoremap <C-Up> <plug>(wiki-journal-previous)
nnoremap <C-Down> <plug>(wiki-journal-next)
" map <cr> <Plug>VimwikiToggleListItem
" }}}

"coc.nvim {{{
hi CocErrorFloat ctermfg=1 guifg=#BF616A
hi CocErrorSign ctermfg=1 guifg=#BF616A
hi link CocHighlightText CursorColumn
hi link CocWarningSign SpecialChar
hi link CocInfoSign SpecialChar

set updatetime=300

let g:coc_status_error_sign="✘ "
let g:coc_status_warning_sign="⚠︎ "

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent> <expr> <cr> pumvisible() ? coc#_select_confirm() : "\<cr>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> <leader>cD <Plug>(coc-references)
nmap <silent> <leader>ci <Plug>(coc-implementation)
nmap <silent> <leader>cr <Plug>(coc-rename)
nmap <silent> <leader>ca  <Plug>(coc-codeaction-line)
vmap <silent> <leader>ca  <Plug>(coc-codeaction-selected)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
vnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    call CocAction('doHover')
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word

augroup coc
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

augroup end


" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>k  :<C-u>CocList diagnostics<cr>
" Manage extensions
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
" Find symbol of current document
nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

command! Refs :LspReferences
command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! EslintFix CocCommand eslint.executeAutofix

"}}}

" ledger {{{
let g:ledger_default_commodity = '€'

fun s:ledger_align()
  let save_pos = getpos(".")
  %LedgerAlign
  call setpos('.', save_pos)
endfun

augroup ledger
  autocmd!
  autocmd FileType ledger autocmd! BufWritePre * call s:ledger_align()
  autocmd FileType ledger inoremap <silent> <c-space> <C-r>=ledger#autocomplete_and_align()<CR>
  autocmd FileType ledger vnoremap <silent> <buffer> <Tab> :LedgerAlign<CR>
augroup END
" }}}

" wiki {{{
let g:wiki_root = '~/Dropbox/wiki'
let g:wiki_filetypes = ['md']

let g:vimwiki_autowriteall=0
let g:vimwiki_global_ext=0
let s:wiki_perso = {}
let s:wiki_perso.path = '~/Dropbox/wiki/'
let s:wiki_perso.syntax = 'markdown'
let s:wiki_perso.ext= '.md'
let s:wiki_perso.auto_tags = 1 
let s:wiki_perso.nested_syntaxes = {'python': 'python', 'sh': 'sh', 'sql': 'sql'}


" Foncia
let s:wiki_foncia = {}
let s:wiki_foncia.path = '~/Dropbox/jobs/foncia/wiki/'
let s:wiki_foncia.syntax = 'markdown'
let s:wiki_foncia.ext= '.md'
let s:wiki_foncia.nested_syntaxes = {'python': 'python', 'sh': 'sh', 'sql': 'sql', 'js': 'javascript'}
let s:wiki_foncia.auto_tags = 1 

let g:vimwiki_list = [s:wiki_perso, s:wiki_foncia]
let g:vimwiki_listsyms = ' .oOx'

let g:neoformat_enabled_vimwiki = ['prettier']
let g:neoformat_vimwiki_prettier = {
        \ 'exe': 'prettier',
        \ 'args': ['--stdin-filepath', '"%:p"'],
        \ 'stdin': 1,
        \ }

function! VimwikiLinkHandler(link)
  " Use Vim to open external files with the 'file:' scheme.  E.g.:
  "   1) [[vfile:~/Code/PythonProject/abc123.py]]
  "   2) [[vfile:./|Wiki Home]]
  let l:link = a:link
  if l:link =~# '^file:'
    let l:link = l:link
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


"}}}

" goyo {{{
let g:goyo_width = 80

function! s:goyo_enter()
  set linebreak
  set wrap
endfunction

function! s:goyo_leave()
  set nolinebreak
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" }}}

" }}}

" vim:foldmethod=marker
