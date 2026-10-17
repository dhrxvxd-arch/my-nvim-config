
return {
  "sammaji/markdown-preview.nvim",
  cmd = {
    "MarkdownPreview",
    "MarkdownPreviewStop",
    "MarkdownPreviewToggle",
  },
  ft = { "markdown" },
  opts = {
    theme = "dark",
    browser = { "firefox", "--new-window" },
    auto_close = false,
  },
}

