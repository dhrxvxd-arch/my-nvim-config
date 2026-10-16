
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local p = {
      bg = "#1d2021",
      surface = "#26233a",
      overlay = "#403d52",
      muted = "#6e6a86",
      text = "#e0def4",
      love = "#eb6f92",
      pine = "#31748f",
      gold = "#f6c177",
      foam = "#9ccfd8",
      iris = "#c4a7e7",
      rose = "#ebbcba",
    }

    local theme = {
      normal = {
        a = { fg = p.bg, bg = p.iris, gui = "bold" },
        b = { fg = p.text, bg = p.surface },
        c = { fg = p.text, bg = p.bg },
      },
      insert = {
        a = { fg = p.bg, bg = p.pine, gui = "bold" },
      },
      visual = {
        a = { fg = p.bg, bg = p.rose, gui = "bold" },
      },
      replace = {
        a = { fg = p.bg, bg = p.love, gui = "bold" },
      },
      command = {
        a = { fg = p.bg, bg = p.gold, gui = "bold" },
      },
      inactive = {
        a = { fg = p.muted, bg = p.bg },
        b = { fg = p.muted, bg = p.bg },
        c = { fg = p.muted, bg = p.bg },
      },
    }

    require("lualine").setup({
      options = {
        theme = theme,
        globalstatus = true,
      },
    })
  end,
}

