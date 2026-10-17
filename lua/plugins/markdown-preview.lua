
return {
  "sammaji/markdown-preview.nvim",
  ft = { "markdown" },
  cmd = {
    "MarkdownPreview",
    "MarkdownPreviewStop",
    "MarkdownPreviewRefresh",
  },
  config = function()
    require("markdown_preview").setup({
      open_browser = true,
      host = "127.0.0.1",
    })
  end,
}

