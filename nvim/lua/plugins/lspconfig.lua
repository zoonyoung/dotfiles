return {
  'neovim/nvim-lspconfig',
  config = function()
    local lspconfig = require('lspconfig')
    --Enable (broadcasting) snippet capability for completion
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    lspconfig.cssls.setup({
      capabilities = capabilities,
    })
    lspconfig.jsonls.setup({
      capabilities = capabilities,
    })
    lspconfig.tailwindcss.setup({})
    -- graphql
    lspconfig.graphql.setup({
      filetypes = {
        'graphql',
        'gql',
      },
    })
    lspconfig.tsserver.setup({
      capabilities = capabilities,
    })

    -- lua
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    })
  end,
}
