return {
  {
    "martineausimon/nvim-lilypond-suite",
    ft = { "lilypond", "tex", "texinfo" },
    keys = {
      {
        "<leader>qp",
        ":lua require('nvls.player').quickplayer()<CR>",
        mode = "v",
        desc = "LilyPond quickplayer selection",
        silent = true,
      },
    },
    config = function()
      require("nvls").setup({
        lilypond = {
          options = {
            pdf_viewer = "zathura",
          },
        },
      })
    end,
  },
}
