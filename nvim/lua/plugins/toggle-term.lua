return {
  'akinsho/toggleterm.nvim',
  config = function()
    require('toggleterm').setup {
      open_mapping = [[<leader>t]],
      direction = 'float',
      float_opts = {
        border = 'curved',
        width = 130,
        height = 30,
      },
    }
  end,
}
