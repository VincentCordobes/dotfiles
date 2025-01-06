vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.number = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.conceallevel = 0
vim.opt.scrolloff = 8
vim.opt.showmatch = true
vim.opt.hidden = true
vim.opt.autoread = true
vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.guicursor = "" -- dont change the cursor type in insert mode
vim.opt.laststatus = 2
vim.opt.mouse = "a"
vim.opt.pumheight = 12
vim.opt.completeopt = { "noinsert", "menuone", "noselect" }
vim.opt.shortmess:append("c")
vim.opt.signcolumn = "yes"
vim.opt.title = true

-- Search
vim.opt.ignorecase = true -- Automatically reread changed files without asking me anything
vim.opt.smartcase = true -- ... but not if it begins with upper case
vim.opt.grepprg = "rg --vimgrep --smart-case --hidden --no-messages"
vim.opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"

vim.opt.linebreak = true
vim.opt.wrap = true
vim.opt.textwidth = 80
vim.opt.formatoptions = "tlcqjr1nw"
-- tl: Auto-wrap text using textwidth
-- c: Auto-wrap comments using textwidth
-- q: Allow formatting of comments with gq
-- j: Remove a comment leader when joining lines
-- r: Insert the current comment leader after hitting <Enter>
-- 1: Don't break a line after a one-letter word.
-- n: Recognize numbered lists
-- w: format=flowed
vim.opt.list = true

vim.opt.foldenable = false
vim.opt.statusline =
  "%<%f %h%m%r   %=%y  %{&fileencoding?&fileencoding:&encoding}  %-10.(%l,%v%) %P"
