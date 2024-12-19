return {
  {
    "lervag/wiki.vim",
    init = function()
      vim.g.wiki_mappings_use_defaults = "local"
      vim.g.wiki_mappings_local_journal = {
        ['<plug>(wiki-journal-prev)'] = '<C-Up>',
        ['<plug>(wiki-journal-next)'] = '<C-Down>',
      }
    end,
    config = function()
      vim.g.wiki_root = '~/Dropbox/wiki'
      vim.g.wiki_filetypes = { 'md', 'wiki' }
      vim.g.wiki_link_target_type = 'md'
      vim.g.wiki_select_method = 'fzf'
      vim.g.wiki_ui_method = {
        confirm = 'legacy',
        input = 'legacy',
        select = 'legacy',
      }
      vim.keymap.set("n", "<leader>wi", "<plug>(wiki-index)", {
        desc = "Wiki Index",
        silent = true
      })
      vim.keymap.set("n", "<leader>wn", "<plug>(wiki-open)", {
        desc = "Wiki new",
        silent = true
      })
      vim.keymap.set("n", "<leader>wj", "<plug>(wiki-journal)", {
        desc = "Wiki journal",
        silent = true
      })
      vim.keymap.set("n", "<leader>wx", "<plug>(wiki-reload)", {
        desc = "Wiki reload",
        silent = true
      })
      vim.keymap.set("n", "<leader>fw", ":WikiPages<CR>", {
        desc = "Wiki Pages",
        silent = true
      })
    end,
  },
  {
    "lervag/wiki-ft.vim",
    dependencies = { "lervag/wiki.vim" }
  },
  {
    'lervag/lists.vim',
    dependencies = { "lervag/wiki.vim" }
  }
}
