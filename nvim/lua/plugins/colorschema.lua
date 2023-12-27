return {
  {
    'pineapplegiant/spaceduck',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_diagnostic_virtual_text = 'colored'
      vim.cmd([[colorscheme spaceduck]])
    end,
  },
}
