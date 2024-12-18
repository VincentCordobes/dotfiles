return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = {
          "bash",
          "lua",
          "vim",
          "vimdoc",
          "html",
          "css",
          "javascript",
          "typescript",
          "tsx",
          "ocaml",
          "ocamllex",
          "python",
          "query",
          "rust"
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },  
      })
    end
  }
}
