return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
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
      })
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end
  }
}
