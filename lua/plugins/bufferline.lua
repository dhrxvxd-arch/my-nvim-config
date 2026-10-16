return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "folke/tokyonight.nvim",
  },
  event = "VeryLazy",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        separator_style = "none",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
      highlights = require("tokyonight.groups").bufferline,
    })
  end,
}

