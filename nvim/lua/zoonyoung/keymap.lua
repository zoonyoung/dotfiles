vim.g.mapleader = ' '
local keymap = vim.keymap
local opts = { noremap = true, silent = true }
keymap.set('n', '<leader>pv', vim.cmd.Ex)
--SelectAll
keymap.set('n', '<c-a>', 'ggVG')
--not overwritten by the delete command
keymap.set({ 'n', 'x' }, '<leader>p', '"0p')
keymap.set('n', 'x', '"_x')
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')
keymap.set('n', 'dw', 'vb"_d')
keymap.set('n', '<leader>q', '<cmd>q<cr>')
keymap.set('n', '<leader>w', '<cmd>w<cr>')
keymap.set('n', '<leader>x', '<cmd>x<cr>')
keymap.set('n', '<leader>dh', ':nohl<CR>', { desc = 'Clear search highlights' })
keymap.set('n', '<leader>pv', vim.cmd.Ex)
keymap.set('n', '<C-l>', '<C-w><Right>', opts)
keymap.set('n', '<C-h>', '<C-w><Left>', opts)
keymap.set('n', 'H', '0', opts)
keymap.set('n', 'L', '$', opts)
keymap.set('n', 'dH', 'd0', opts)
keymap.set('n', 'dL', 'd$', opts)

-- ==============
-- New tab
keymap.set('n', 'te', ':tabedit')
keymap.set('n', '<tab>', ':tabnext<Return>', opts)
keymap.set('n', '<s-tab>', ':tabprev<Return>', opts)
-- Split window
keymap.set('n', 'ss', ':split<Return>', opts)
keymap.set('n', 'sv', ':vsplit<Return>', opts)
-- Move window
keymap.set('n', 'sh', '<C-w>h')
keymap.set('n', 'sk', '<C-w>k')
keymap.set('n', 'sj', '<C-w>j')
keymap.set('n', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

keymap.set('n', 'x', '"_x')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')
-- function
keymap.set('n', 'fs', ']m')
keymap.set('n', 'fe', '[m')
