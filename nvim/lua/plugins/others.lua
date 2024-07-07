return {
  'numToStr/Comment.nvim',
  opts = {
    -- add any options here
  },
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      indent = { char = '▎' },
      scope = {
        char = '▎',
        show_start = false, -- 범위 시작의 밑줄 비활성화
        show_end = false, -- 범위 끝의 밑줄 비활성화
      },
      whitespace = { highlight = { 'Whitespace', 'NonText' } },
    },
  },
  -- css색상 background
  { 'norcalli/nvim-colorizer.lua', opts = { '*' } },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      icons = {
        buffer_index = true,
        button = '',
        diagnostics = {
          [vim.diagnostic.severity.ERROR] = { enabled = true, icon = 'ﬀ' },
          [vim.diagnostic.severity.WARN] = { enabled = false },
          [vim.diagnostic.severity.INFO] = { enabled = false },
          [vim.diagnostic.severity.HINT] = { enabled = true },
        },
        gitsigns = {
          added = { enabled = true, icon = '+' },
          changed = { enabled = true, icon = '~' },
          deleted = { enabled = true, icon = '-' },
        },
        filetype = {
          custom_colors = false,
          enabled = true,
        },
        modified = { button = '●' },
        pinned = { button = '', filename = true },
        preset = 'default',
        alternate = { filetype = { enabled = false } },
        current = { buffer_index = true },
        inactive = { button = '×' },
        visible = { modified = { buffer_number = false } },
      },
      sidebar_filetypes = {
        -- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
        NvimTree = true,
      },
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
}
