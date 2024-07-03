return {
  {
    'williamboman/mason.nvim',
    config = function()
      require("mason").setup()
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      ensure_installed = { 'lua_ls', 'cssls', 'cssmodules_ls', 'css_variables', 'jsonls', 'tsserver', 'spectral', 'tailwindcss' },
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      local M = {}
      local map = vim.keymap.set

      -- export on_attach & capabilities
      M.on_attach = function(_, bufnr)
        local function opts(desc)
          return { buffer = bufnr, desc = "LSP " .. desc }
        end

        map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
        map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
        map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "Code action")
      end

      -- disable semanticTokens
      M.on_init = function(client, _)
        if client.supports_method "textDocument/semanticTokens" then
          client.server_capabilities.semanticTokensProvider = nil
        end
      end

      M.capabilities = vim.lsp.protocol.make_client_capabilities()

      M.capabilities.textDocument.completion.completionItem = {
        documentationFormat = { "markdown", "plaintext" },
        snippetSupport = true,
        preselectSupport = true,
        insertReplaceSupport = true,
        labelDetailsSupport = true,
        deprecatedSupport = true,
        commitCharactersSupport = true,
        tagSupport = { valueSet = { 1 } },
        resolveSupport = {
          properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
          },
        },
      }

      M.defaults = function()
        require("lspconfig").lua_ls.setup {
          on_attach = M.on_attach,
          capabilities = M.capabilities,
          on_init = M.on_init,

          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                library = {
                  vim.fn.expand "$VIMRUNTIME/lua",
                  vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
                  vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
                  vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
              },
            },
          },
        }
      end

      M.defaults()
    end,
  },
}
