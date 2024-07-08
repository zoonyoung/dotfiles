return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require 'lspconfig'
      lspconfig.lua_ls.setup {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
          },
        },
      }

      -- Example setup for other LSP servers
      lspconfig.cssls.setup {}
      lspconfig.eslint.setup {}
      lspconfig.jsonls.setup {}
      lspconfig.tsserver.setup {}
      lspconfig.tailwindcss.setup {}
    end,
  },
  {
    'nvimdev/lspsaga.nvim',
    config = function()
      local keymap = vim.keymap

      require('lspsaga').setup {
        ui = {
          border = 'rounded',
        },
        lightbulb = {
          enable = false,
        },
      }

      keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<cr>')
      keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<cr>')
      keymap.set('n', '<leader>o', '<cmd>Lspsaga outline<cr>')

      local builtin = require 'telescope.builtin'

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gd', '<cmd>Lspsaga goto_definition<cr>', opts)
          vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<space>ca', '<cmd>Lspsaga code_action<cr>', opts)
          vim.keymap.set('n', 'gr', builtin.lsp_references, opts)
        end,
      })

      vim.keymap.set('n', '<space>k', '<cmd>Lspsaga hover_doc<cr>', { silent = true })

      -- error lens
      vim.fn.sign_define {
        {
          name = 'DiagnosticSignError',
          text = '',
          texthl = 'DiagnosticSignError',
          linehl = 'ErrorLine',
        },
        {
          name = 'DiagnosticSignWarn',
          text = '',
          texthl = 'DiagnosticSignWarn',
          linehl = 'WarningLine',
        },
        {
          name = 'DiagnosticSignInfo',
          text = '',
          texthl = 'DiagnosticSignInfo',
          linehl = 'InfoLine',
        },
        {
          name = 'DiagnosticSignHint',
          text = '',
          texthl = 'DiagnosticSignHint',
          linehl = 'HintLine',
        },
      }
    end,
  },

  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    config = function()
      local api = require 'typescript-tools.api'
      require('typescript-tools').setup {
        handlers = {
          ['textDocument/publishDiagnostics'] = api.filter_diagnostics { 6133 },
        },
        settings = {
          tsserver_file_preferences = {
            importModuleSpecifierPreference = 'non-relative',
          },
        },
      }
      local autocmd = vim.api.nvim_create_autocmd
      autocmd('BufWritePre', {
        pattern = '*.ts,*.tsx,*.jsx,*.js',
        callback = function(args)
          vim.cmd 'TSToolsAddMissingImports sync'
          vim.cmd 'TSToolsOrganizeImports sync'
          require('conform').format { bufnr = args.buf }
        end,
      })
    end,
  },
}
