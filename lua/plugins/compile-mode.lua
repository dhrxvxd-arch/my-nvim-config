
return {
  "ej-shafran/compile-mode.nvim",
  branch = "latest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "m00qek/baleia.nvim", branch = "main" },
  },
  config = function()
    vim.g.compile_mode = {
      input_word_completion = true,
      ansi_color = { kind = "render" },
      bang_expansion = true,
    }
  end
}

