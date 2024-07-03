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
      ensure_installed = { 'lua_ls', 'cssls', 'cssmodules_ls', 'css_variables', 'jsonls', 'tsserver', 'spectral', 'tailwindcss', 'graphql' },
    },
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require 'lspconfig'
      local mason_lspconfig = require 'mason-lspconfig'

      -- Default settings for LSP servers
      local default_settings = {
        -- Add other default settings here
        on_attach = function(client, bufnr)
          -- Add your on_attach functions here
        end,
        capabilities = vim.lsp.protocol.make_client_capabilities(),
      }

      -- Custom server-specific settings
      local server_settings = {
        graphql = {
          filetypes = {
            'graphql',
            'gql',
          },
        },
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { 'vim' },
              },
            },
          },
        },
      }

      -- Ensure all listed servers are installed and set up
      mason_lspconfig.setup {
        ensure_installed = { 'lua_ls', 'cssls', 'cssmodules_ls', 'css_variables', 'jsonls', 'tsserver', 'spectral', 'tailwindcss', 'graphql' },
      }

      mason_lspconfig.setup_handlers {
        function(server_name)
          local opts = default_settings
          if server_settings[server_name] then
            opts = vim.tbl_deep_extend("force", opts, server_settings[server_name])
          end
          lspconfig[server_name].setup(opts)
        end
      }
    end,
  },
}

