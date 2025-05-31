return {
  {
    "ten3roberts/qf.nvim",
    -- disabled = true,
    config = function()
      require("qf").setup({
        l = {
          auto_close = true, -- Automatically close location/quickfix list if empty
          auto_follow = false, -- Follow current entry, possible values: prev,next,nearest, or false to disable
          auto_open = true, -- Automatically open list on QuickFixCmdPost
          auto_resize = true, -- Auto resize and shrink location list if less than `max_height`
          max_height = 10, -- Maximum height of location/quickfix list
          min_height = 3, -- Minimum height of location/quickfix list
          wide = true, -- Open list at the very bottom of the screen, stretching the whole width.
          number = true, -- Show line numbers in list
        },
        c = {
          auto_close = true, -- Automatically close location/quickfix list if empty
          auto_follow = false, -- Follow current entry, possible values: prev,next,nearest, or false to disable
          auto_open = true, -- Automatically open list on QuickFixCmdPost
          auto_resize = true, -- Auto resize and shrink location list if less than `max_height`
          max_height = 10, -- Maximum height of location/quickfix list
          min_height = 3, -- Minimum height of location/quickfix list
          wide = true, -- Open list at the very bottom of the screen, stretching the whole width.
          number = true, -- Show line numbers in list
        },
        close_other = true, -- Close location list when quickfix list opens
        pretty = true, -- Pretty print quickfix lists
        silent = true, -- Suppress messages like "(1 of 3): *line content*" on jump
      })

      vim.keymap.set("n", "<leader>q", function()
        require("qf").toggle("c", true)
      end, {
        desc = "toggle quickfix list",
      })
      vim.keymap.set("n", "<leader>l", function()
        require("qf").toggle("l", true)
      end, {
        desc = "toggle quickfix list",
      })

      vim.keymap.set("n", "<c-k>", function()
        local qf = require("qf")
        qf.above("visible")
      end)

      vim.keymap.set("n", "<c-j>", function()
        local qf = require("qf")
        qf.below("visible")
      end)
    end,
  },
}
