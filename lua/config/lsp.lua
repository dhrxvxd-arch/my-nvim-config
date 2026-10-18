
local capabilities = vim.lsp.protocol.make_client_capabilities()

local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

if ok then
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

vim.diagnostic.config({
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  virtual_text = {
    spacing = 2,
    prefix = "● ",
  },
  float = {
    border = "rounded",
    source = "if_many",
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "E",
      [vim.diagnostic.severity.WARN] = "W",
      [vim.diagnostic.severity.INFO] = "I",
      [vim.diagnostic.severity.HINT] = "H",
    },
  },
})

vim.lsp.config("*", {
  capabilities = capabilities,
})

vim.lsp.enable({
  "lua_ls",
  "clangd",
  "zls",
  "rust_analyzer",
  "gopls",
})

