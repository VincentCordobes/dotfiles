vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)


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
vim.opt.smartcase = true  -- ... but not if it begins with upper case
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
vim.opt.statusline = "%<%f %h%m%r   %=%y  %{&fileencoding?&fileencoding:&encoding}  %-10.(%l,%v%) %P"


vim.api.nvim_create_user_command("Grep", function(opts) 
  local cmd = string.format('silent grep! %s', opts.args)
  vim.cmd(cmd)
end,
{ desc = "Pretty grep", nargs = "+", complete = "file_in_path", range = true })

function map(tbl, f)
  local t = {}
  for k,v in pairs(tbl) do
    t[k] = f(v)
  end
  return t
end

vim.keymap.set("n", "<leader>a", ':Grep<space>""<left>', { desc = "Grep" })
vim.keymap.set("v", "<leader>a", function()
  local lines = vim.fn.getregion(
    vim.fn.getpos("v"),
    vim.fn.getpos("."),
    { type = vim.fn.mode() }
  )
  local is_multiline = #lines > 1
  if is_multiline then
    -- default to regex pattern
    local lines = map(lines, function(line) 
      return vim.fn.escape(line, '.*[]^${}()|?+\\')
    end)
    local line = table.concat(lines, "\\n")
    local line = vim.fn.escape(line, '|')
    return string.format('<esc>:Grep -U -- %s', vim.fn.shellescape(line, 1))
  else
    local line = lines[1]
    local line = vim.fn.escape(line, '|')
    return string.format('<esc>:Grep -F -- %s', vim.fn.shellescape(line, 1))
  end
end, { expr = true, desc = "Grep visual selection" })
vim.keymap.set("n", "<leader><space>", "<cmd>noh<cr>", { desc = "Clear hlsearch", silent = true })

-- Dont go to the next occurence on * search 
vim.keymap.set("n", "*", [[:let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>]], { desc = "Star search", silent = true })

vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

vim.keymap.set("n", "<Up>", "gk")
vim.keymap.set("n", "<Down>", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "j", "gj")

vim.keymap.set("x", "Q", ":'<,'>:normal @q<CR>")

vim.api.nvim_create_augroup('qf', { clear = true })
-- Open quickfix after grep
vim.api.nvim_create_autocmd('QuickFixCmdPost', {
  group = 'qf',
  pattern = '*grep*',
  callback = function()
    vim.cmd('cwindow')
  end
})

vim.api.nvim_create_user_command("FlowedCopy", function()
  local old_tw = vim.o.textwidth
  vim.o.textwidth = 999999999
  vim.cmd("silent normal! gvgqgvy")
  vim.o.textwidth = old_tw
  vim.cmd("silent normal! gvgq")
end, { range = true })

-- Disable some plugins
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  change_detection = { notify = false },
})
