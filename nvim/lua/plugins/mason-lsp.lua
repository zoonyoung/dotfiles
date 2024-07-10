return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "cssls",
        "cssmodules_ls",
        "css_variables",
        "lua_ls",
      },
      automatic_installation = true,
    },
  },
}
