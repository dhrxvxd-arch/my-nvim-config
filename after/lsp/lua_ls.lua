
return {
  cmd = { "lua-language-server" },

  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },

      diagnostics = {
        globals = { "vim" },
      },

      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
        },
      },

      completion = {
        callSnippet = "Replace",
      },

      telemetry = {
        enable = false,
      },
    },
  },
}

