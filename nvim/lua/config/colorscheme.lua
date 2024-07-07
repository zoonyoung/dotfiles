function ColorMyPencils(color)
  color = color or 'rose-pine-moon'
  vim.cmd.colorscheme(color)
  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end

return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup {
        disable_background = true,
        styles = {
          bold = true,
          italic = false,
          transparency = true,
        },
      }
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    config = function()
      require('kanagawa').setup {
        transparent = true,
        theme = 'wave',
      }
    end,
  },
  {
    'ramojus/mellifluous.nvim',
    config = function() end,
  },

  {
    'datsfilipe/vesper.nvim',
    config = function()
      require('vesper').setup {
        transparent = false, -- Boolean: Sets the background to transparent
        italics = {
          comments = true, -- Boolean: Italicizes comments
          keywords = true, -- Boolean: Italicizes keywords
          functions = true, -- Boolean: Italicizes functions
          strings = true, -- Boolean: Italicizes strings
          variables = true, -- Boolean: Italicizes variables
        },
      }
      vim.cmd 'colorscheme vesper'
    end,
  },
}
