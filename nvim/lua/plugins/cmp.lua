return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-buffer', -- source for text in buffer
    'hrsh7th/cmp-path', -- source for file system paths
    'L3MON4D3/LuaSnip', -- snippet engine
    'saadparwaiz1/cmp_luasnip', -- for autocompletion
    'onsails/lspkind.nvim', -- vs-code like pictograms
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-cmdline',
  },

  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    local lspkind = require 'lspkind'
    vim.cmd [[
  highlight CmpBorder guifg=#ebbcba guibg=NONE
  highlight CmpDocBorder guifg=#ebbcba guibg=NONE
  highlight CmpSel guibg=#44475a guifg=#f8f8f2
]]

    local function border(hl_name)
      return {
        { '╭', hl_name },
        { '─', hl_name },
        { '╮', hl_name },
        { '│', hl_name },
        { '╯', hl_name },
        { '─', hl_name },
        { '╰', hl_name },
        { '│', hl_name },
      }
    end

    local function scroll_next(times)
      return function(fallback)
        for _ = 1, times do
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end
      end
    end

    local function scroll_prev(times)
      return function(fallback)
        for _ = 1, times do
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end
      end
    end

    cmp.setup {
      completion = {
        completeopt = 'menu,menuone,preview,noselect',
      },
      window = {
        completion = {
          border = border 'CmpBorder',
          winhighlight = 'Normal:CmpPmenu,CursorLine:CmpSel,Search:None',
        },
        documentation = {
          border = border 'CmpDocBorder',
          winhighlight = 'Normal:CmpDoc',
        },
      },
      formatting = {
        format = lspkind.cmp_format {
          maxwidth = 50,
          ellipsis_char = '...',
        },
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-u>'] = scroll_prev(4),
        ['<C-d>'] = scroll_next(4),
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        },
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
        { name = 'crates' },
        { name = 'path' },
      }, {
        { name = 'buffer' },
      }),
    }

    -- Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
      }, {
        { name = 'buffer' },
      }),
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' },
      },
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' },
      }, {
        { name = 'cmdline' },
      }),
    })

    -- snippets
    require('luasnip.loaders.from_vscode').load {
      paths = { '~/.config/nvim/snippets' },
    }
  end,
}
