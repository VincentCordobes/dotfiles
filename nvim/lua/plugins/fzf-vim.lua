return {
  {
    "junegunn/fzf",
    build = function()
      vim.fn["fzf#install"]()
    end,
    event = "VeryLazy",
  },
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" },
    config = function()
      vim.g.fzf_preview_window = ""
      vim.g.fzf_history_dir = "~/.local/share/fzf-history"
      vim.g.fzf_layout = { down = "~40%" }
      vim.keymap.set("n", "<C-p>", ":FZF<CR>", { desc = "FZF", silent = true })
      vim.keymap.set("n", "<leader>ff", ":Files<CR>", {
        desc = "FZF Files",
        silent = true,
      })
      vim.keymap.set("n", "<leader>fb", ":Buffers<CR>", {
        desc = "FZF Buffers",
        silent = true,
      })
      vim.keymap.set("n", "<leader>fr", ":History<CR>", {
        desc = "FZF Recents",
        silent = true,
      })
      vim.keymap.set(
        "n",
        "<leader>fg",
        ":call fzf#vim#gitfiles('?', {'options': ['--no-preview']})<CR>",
        {
          desc = "FZF Git status",
          silent = true,
        }
      )
      vim.keymap.set("n", "<leader>x", ":Commands<CR>", {
        desc = "FZF Vim Commands",
        silent = true,
      })

      vim.api.nvim_create_augroup("fzf", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        group = "fzf",
        pattern = "fzf",
        callback = function()
          vim.opt.laststatus = 0
          vim.opt.ruler = false
          vim.api.nvim_create_autocmd("BufLeave", {
            buffer = vim.api.nvim_get_current_buf(),
            callback = function()
              vim.opt.laststatus = 2
              vim.opt.ruler = true
            end,
          })
        end,
      })
    end,
  },
}
