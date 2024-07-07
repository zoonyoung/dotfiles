return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPre', 'BufNewFile' },
    build = ':TSUpdate',
    dependencies = {
      'axelvc/template-string.nvim',
    },
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'tsx',
          'lua',
          'vim',
          'typescript',
          'javascript',
          'html',
          'css',
          'json',
          'graphql',
          'regex',
          'prisma',
          'markdown',
          'markdown_inline',
          'scss',
          'css',
        },

        sync_install = false,

        auto_install = true,

        highlight = {
          enable = false,

          additional_vim_regex_highlighting = false,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<enter>',
            node_incremental = '<enter>',
            scope_incremental = false,
            node_decremental = '<bs>',
          },
        },
      }

      require('template-string').setup {}
    end,
  },
}
