return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    event = "VeryLazy",
    config = function()
      require("oil").setup({
        win_options = {
          number = false,
          signcolumn = "yes",
        },
        skip_confirm_for_simple_edits = false,
        view_options = {
          show_hidden = true,
        },
        confirmation = {
          border = "solid",
        },
        progress = {
          border = "solid",
        },
        keymaps_help = {
          border = "solid",
        },
        use_default_keymaps = true,
        keymaps = {
          ["<C-p>"] = false,
        }
      })
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end
  }
}
