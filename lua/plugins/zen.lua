return {
  "folke/zen-mode.nvim",
  opts = {},
  config = function()
    require("zen-mode").setup({
      window = {
        width = 1.0,
      },
    })
  end,
}
