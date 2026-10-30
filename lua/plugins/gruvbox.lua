return {
  "ellisonleao/gruvbox.nvim",
  name = "gruvbox",
  config = function()
    require("gruvbox").setup({
      transparent_mode = false,
      terminal_colors = true,
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      inverse = true,
      contrast = "",
      palette_overrides = {},
      overrides = {},
      dim_inactive = false,
    })

    vim.cmd.colorscheme("gruvbox")

    local function set_black_backgrounds()
      for name, hl in pairs(vim.api.nvim_get_hl(0, {})) do
        hl.bg = 0x000000
        vim.api.nvim_set_hl(0, name, hl)
      end
    end

    set_black_backgrounds()
  end,
}
