
return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup()

      require("nvim-treesitter").install({
        "c",
        "cpp",
        "zig",
        "rust",
        "go",
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "c", "cpp", "zig", "rust", "go", },
        callback = function()
          vim.treesitter.start()

          vim.wo.foldmethod = "expr"
          vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          vim.wo.foldlevel = 99

          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}

