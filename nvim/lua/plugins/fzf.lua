return {
  {
    "ibhagwan/fzf-lua",
    config = function()
      require("fzf-lua").setup({'fzf-native'})
      vim.keymap.set("n", "<c-P>", require('fzf-lua').files, { desc = "Fzf Files" })
      vim.keymap.set("n", "<leader>ff", require('fzf-lua').files, { desc = "Fzf Files" })
      vim.keymap.set("n", "<leader>fb", require('fzf-lua').buffers, { desc = "Fzf Buffers" })
      vim.keymap.set("n", "<leader>fr", require('fzf-lua').oldfiles, { desc = "Fzf Recent Files" })
      vim.keymap.set("n", "<leader>fg", require('fzf-lua').git_status, { desc = "Fzf Git status" })
      vim.keymap.set("n", "<leader>x", require('fzf-lua').commands, { desc = "Fzf Vim Commands" })
    end
  }
}
