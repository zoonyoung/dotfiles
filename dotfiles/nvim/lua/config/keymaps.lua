local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- global
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Do things without affecting the registers
keymap.set('n', 'x', '"_x', opts)

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d', opts)

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G', opts)

-- Jumplist
keymap.set('n', '<C-m>', '<C-i>', opts)

-- Split window
keymap.set('n', 'ss', ':split<CR>', opts)
keymap.set('n', 'sv', ':vsplit<CR>', opts)

-- Move window
keymap.set('n', '<C-h>', '<C-w>h', opts)
keymap.set('n', '<C-k>', '<C-w>k', opts)
keymap.set('n', '<C-j>', '<C-w>j', opts)
keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Save, Quit, Close file
keymap.set('n', '<leader>w', '<cmd> w <CR>', opts)

-- Visual mode mappings
keymap.set('v', '<', '<gv', opts)
keymap.set('v', '>', '>gv', opts)
keymap.set('v', 'H', '0', opts)
keymap.set('v', 'L', '$', opts)

-- Visual Block mode mappings
keymap.set('x', 'H', '0', opts)
keymap.set('x', 'L', '$', opts)
keymap.set('n', 'H', '0', opts)
keymap.set('n', 'L', '$', opts)
keymap.set('n', 'dL', 'd$', opts)

-- nvim tree
keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'nvimtree toggle window' })
