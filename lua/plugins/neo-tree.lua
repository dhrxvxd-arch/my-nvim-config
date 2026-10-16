return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  opts = {
    window = {
      position = "left",
    },
    filesystem = {
      use_libuv_file_watcher = true,
      follow_current_file = {
        enabled = true,
      },
    },
    clipboard = {
      sync = "global",
    },
  },
  config = function()
    vim.keymap.set({ "n", "i" }, "<C-n>", "<cmd>Neotree toggle<CR>")
  end,
}

