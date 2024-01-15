local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server",
        "tailwindcss-language-server",
        "eslint-lsp",
        "prettierd",
        "stylelint-lsp",
        "stylelint"

      }
    }
  },
  -- none-ls
  {
    'nvimtools/none-ls.nvim',
    event = 'VeryLazy',
    opts = function()
      return require 'custom.configs.null-ls'
    end,
  },
  -- lspconfig
  {
    'neovim/nvim-lspconfig',
    config = function()
      require 'plugins.configs.lspconfig'
      require 'custom.configs.lspconfig'
    end,
  },
  -- auto tag
  {
    'windwp/nvim-ts-autotag',
    ft = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
      'html',
      'jsx',
      'tsx',
      'markdown',
    },
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },
  -- visual-multi
  { 'mg979/vim-visual-multi', event = 'VeryLazy' },
  -- surround
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup {}
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function()
      local opts = require 'plugins.configs.treesitter'
      opts.ensure_installed = {
        'lua',
        'javascript',
        'typescript',
        'tsx',
        'html',
        'css',
        'markdown',
      }
      return opts
    end,
  },

  {
    'abecodes/tabout.nvim',
    event = 'VeryLazy',
    config = function()
      require('tabout').setup {
        tabkey = '<Tab>',             -- key to trigger tabout, set to an empty string to disable
        backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
        act_as_tab = true,            -- shift content if tab out is not possible
        act_as_shift_tab = false,     -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
        default_tab = '<C-t>',        -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
        default_shift_tab = '<C-d>',  -- reverse shift default action,
        enable_backwards = true,      -- well ...
        completion = true,            -- if the tabkey is used in a completion pum
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = '`', close = '`' },
          { open = '(', close = ')' },
          { open = '[', close = ']' },
          { open = '{', close = '}' },
        },

        ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
        exclude = {}, -- tabout will ignore these filetypes
      }
    end,
    wants = { 'nvim-treesitter' }, -- or require if not used so far
    after = { 'nvim-cmp' },        -- if a completion plugin is using tabs load it before
  },
  {
    'barrett-ruth/live-server.nvim',
    event = 'VeryLazy',
    build = 'yarn global add live-server',
    config = true,
  },
  {
    'stevearc/conform.nvim',
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' }, -- to disable, comment this out
    config = function()
      require('conform').setup {
        formatters_by_ft = {
          lua = { 'stylua' },
          javascript = { 'prettierd' },
          typescript = { 'prettierd' },
          javascriptreact = { 'prettierd' },
          typescriptreact = { 'prettierd' },
          css = { 'stylelint' },
          html = { 'prettierd' },
          json = { 'prettierd' },
          yaml = { 'prettierd' },
          markdown = { 'prettierd' },
          graphql = { 'prettierd' },
        },

        format_on_save = {
          pattern = '.lua,*.graphql,*.css,*.html,*.json,*.yaml,*.md,*.gql,*.rs',
          timeout_ms = 500,
          async = false,
          lsp_fallback = true,
        },
      }
    end,
  }
}
return plugins
