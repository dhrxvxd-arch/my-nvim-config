
return {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        unusedwrite = true,
        useany = true,
        shadow = true,
      },

      staticcheck = true,
      gofumpt = true,

      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },

      completeUnimported = true,
      usePlaceholders = true,
      semanticTokens = true,
    },
  },
}

