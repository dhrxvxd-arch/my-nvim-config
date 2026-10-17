local set = vim.keymap.set

set("n", "\\", "<cmd>noh<cr>", { desc = "Clear search highlights" })

set("n", "<leader>co", "<cmd>Compile<cr>", { desc = "Compile project" })
set("n", "<leader>ro", "<cmd>Recompile<cr>", { desc = "Recompile project" })
set("n", "<c-s>", "<cmd>wa<cr>", { desc = "Save unsaved files" })


set("n", "<leader>mp", "<cmd>MarkdownPreview<CR>",
    { desc = "Markdown: Preview" })

set("n", "<leader>mP", "<cmd>MarkdownPreviewStop<CR>",
    { desc = "Markdown: Stop preview" })

set("n", "<leader>mr", "<cmd>MarkdownPreviewRefresh<CR>",
    { desc = "Markdown: Refresh preview" })

set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })

set({ "n", "v" }, "<C-S-v>", '"+p', { desc = "Paste from clipboard" })
set("i", "<C-S-v>", '<C-r>+', { desc = "Paste from clipboard" })
set("t", "<C-S-v>", [[<C-\><C-n>"+pa]], { desc = "Paste from clipboard" })

set("n", "<leader>h", "<C-w>h", { desc = "Move to left window" })
set("n", "<leader>j", "<C-w>j", { desc = "Move to lower window" })
set("n", "<leader>k", "<C-w>k", { desc = "Move to upper window" })
set("n", "<leader>l", "<C-w>l", { desc = "Move to right window" })

set("n", "-", "<cmd>Oil<cr>", { desc = "Oil file manager" })

set({ "n", "t" }, "<c-t>", "<cmd>FloaTerminal<cr>", { desc = "Toggle floating terminal" })
set("n", "<c-s>", "<cmd>ScratchPad<cr>", { desc = "Toggle scratchpad" })

set("n", "<leader>c", "<cmd>Compile<cr>", { desc = "Compile Mode" })

set("n", "<C-Tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
set("n", "<C-S-Tab>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })

if vim.g.neovide then
  set("n", "<leader>=", function()
    vim.g.neovide_scale_factor = math.min(vim.g.neovide_scale_factor + 0.1, 2.0)
  end, { desc = "Increase GUI scale" })

  set("n", "<leader>-", function()
    vim.g.neovide_scale_factor = math.max(vim.g.neovide_scale_factor - 0.1, 0.5)
  end, { desc = "Decrease GUI scale" })

  set("n", "<C-=>", function()
    vim.g.neovide_scale_factor = math.min(vim.g.neovide_scale_factor + 0.1, 2.0)
  end, { desc = "Increase GUI scale" })
  set("n", "<C-->", function()
    vim.g.neovide_scale_factor = math.max(vim.g.neovide_scale_factor - 0.1, 0.5)
  end, { desc = "Decrease GUI scale" })
end

set("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
set("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
set("n", "<c-w>", "<cmd>bdelete<cr>", { desc = "Close buffer" })

set({ "n", "v" }, "<C-S-v>", '"+p', { desc = "Paste from clipboard" })
set("i", "<C-S-v>", '<C-r>+', { desc = "Paste from clipboard" })
set("t", "<C-S-v>", [[<C-\><C-n>"+pa]], { desc = "Paste from clipboard" })

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local opts = { buffer = event.buf, silent = true }

    set("n", "gd", vim.lsp.buf.definition, opts)
    set("n", "gD", vim.lsp.buf.declaration, opts)
    set("n", "gr", vim.lsp.buf.references, opts)
    set("n", "gi", vim.lsp.buf.implementation, opts)
    set("n", "K", vim.lsp.buf.hover, opts)

    set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    set("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)

    set("n", "<leader>ds", vim.diagnostic.open_float, opts)
    set("n", "[d", function()
      vim.diagnostic.jump({ count = -1, float = true })
    end, opts)
    set("n", "]d", function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, opts)

    set("n", "<leader>e", function()
      vim.diagnostic.open_float(nil, {
        scope = "cursor",
        border = "none",
        focus = false,
      })
    end, opts)

    set("n", "<leader>q", vim.diagnostic.setloclist, opts)
    set("n", "<leader>D", vim.lsp.buf.type_definition, opts)

    set("n", "<leader>ih", function()
      local bufnr = event.buf
      vim.lsp.inlay_hint.enable(
        not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }),
        { bufnr = bufnr }
      )
    end, opts)

    set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
    set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)

    set("n", "<leader>wl", function()
      vim.print(vim.lsp.buf.list_workspace_folders())
    end, opts)

    set("n", "<leader>ci", vim.lsp.buf.incoming_calls, opts)
    set("n", "<leader>cO", vim.lsp.buf.outgoing_calls, opts)

    set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
  end,
})

local harpoon = require("harpoon")

set("n", "<leader>ha", function()
    harpoon:list():add()
end, { desc = "Harpoon: Add file" })

set("n", "<leader>hh", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon: Quick menu" })

set("n", "<c-h>", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon: Quick menu" })

for i = 1, 4 do
  set("n", "<leader>" .. i, function()
    harpoon:list():select(i)
  end, { desc = "Harpoon: File: " .. i })
end

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

