return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    require('rose-pine').setup({
      disable_background = not vim.g.neovide,
      styles = {
        italic = false,
      },
    })

    ColorMyPencils();
  end
}
