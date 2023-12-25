return {
  {
    'pineapplegiant/spaceduck',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.spaceduck_diagnostic_line_highlight = 1
      vim.cmd([[colorscheme spaceduck]])
    end,
  },
}
