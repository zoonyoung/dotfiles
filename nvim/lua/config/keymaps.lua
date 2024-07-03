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

-- Move to previous/next
keymap.set('n', '<Tab>', '<Cmd>BufferPrevious<CR>', opts)
keymap.set('n', '<S-Tab>', '<Cmd>BufferNext<CR>', opts)
-- Goto buffer in position...
keymap.set('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
keymap.set('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
keymap.set('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
keymap.set('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
keymap.set('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
keymap.set('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
keymap.set('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
keymap.set('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
keymap.set('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)

keymap.set('n', '<leader>p', '<Cmd>BufferPin<CR>', opts)
keymap.set('n', '<leader>c', '<Cmd>BufferCloseAllButPinned<CR>', opts)
keymap.set('n', '<leader>x', '<Cmd>BufferClose<CR>', opts)
