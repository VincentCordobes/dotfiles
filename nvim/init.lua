vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("settings")
require("keymaps")
require("commands")
require("autocmds")

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
