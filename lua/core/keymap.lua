local set = vim.keymap.set

set("n", "\\", "<cmd>noh<cr>", { desc = "Clear search highlights" })

set("n", "<leader>h", "<C-w>h", { desc = "Move to left window" })
set("n", "<leader>j", "<C-w>j", { desc = "Move to lower window" })
set("n", "<leader>k", "<C-w>k", { desc = "Move to upper window" })
set("n", "<leader>l", "<C-w>l", { desc = "Move to right window" })

set({ "n", "t" }, "<c-t>", "<cmd>Floaterminal<cr>", { desc = "Toggle floating terminal" })
set("n", "<c-s>", "<cmd>Scratchpad<cr>", { desc = "Toggle scratchpad" })

set("n", "<C-Tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
set("n", "<C-S-Tab>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })

for i = 1, 9 do
  set("n", "<leader>" .. i, "<cmd>BufferLineGoToBuffer " .. i .. "<CR>", {
    desc = "Go to buffer " .. i,
  })
end

if vim.g.neovide then
  set("n", "<leader>+", function()
    vim.g.neovide_scale_factor = math.min(vim.g.neovide_scale_factor + 0.1, 2.0)
  end, { desc = "Increase GUI scale" })

  set("n", "<leader>-", function()
    vim.g.neovide_scale_factor = math.max(vim.g.neovide_scale_factor - 0.1, 0.5)
  end, { desc = "Decrease GUI scale" })
end

set("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
set("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
set("n", "<c-w>", "<cmd>bdelete<cr>", { desc = "Close buffer" })

set({ "n", "v" }, "<C-S-v>", '"+p', { desc = "Paste from clipboard" })
set("i", "<C-S-v>", '<C-r>+', { desc = "Paste from clipboard" })
set("t", "<C-S-v>", [[<C-\><C-n>"+pa]], { desc = "Paste from clipboard" })

local recenter_state = 0

vim.api.nvim_create_autocmd("CursorMoved", {
  callback = function()
    recenter_state = 0
  end,
  desc = "Reset recenter state on cursor movement",
})

set("n", "<C-l>", function()
  if recenter_state == 0 then
    vim.cmd("normal! zz")
  elseif recenter_state == 1 then
    vim.cmd("normal! zt")
  else
    vim.cmd("normal! zb")
  end

  recenter_state = (recenter_state + 1) % 3
end, { desc = "Cycle cursor line to center, top, and bottom" })

