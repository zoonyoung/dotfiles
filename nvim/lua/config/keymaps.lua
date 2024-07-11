local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- global
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Do things without affecting the registers
keymap.set("n", "x", '"_x', opts)

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d', opts)

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- Split window
keymap.set("n", "ss", ":split<CR>", opts)
keymap.set("n", "sv", ":vsplit<CR>", opts)

-- Move window
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Save, Quit, Close file
keymap.set("n", "<leader>w", "<cmd> w <CR>", opts)

-- Visual mode mappings
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)
keymap.set("v", "H", "0", opts)
keymap.set("v", "L", "$", opts)

-- Visual Block mode mappings
keymap.set("x", "H", "0", opts)
keymap.set("x", "L", "$", opts)
keymap.set("n", "H", "0", opts)
keymap.set("n", "L", "$", opts)
keymap.set("n", "dL", "d$", opts)

-- nvim tree
keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })

-- Move to previous/next
keymap.set("n", "<S-Tab>", "<Cmd>BufferLineMovePrev<CR>", opts)
keymap.set("n", "<Tab>", "<Cmd>BufferLineMoveNext<CR>", opts)
-- Goto buffer in position...
keymap.set("n", "<A-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", opts)
keymap.set("n", "<A-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", opts)
keymap.set("n", "<A-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", opts)
keymap.set("n", "<A-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", opts)
keymap.set("n", "<A-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", opts)
keymap.set("n", "<A-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", opts)
keymap.set("n", "<A-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", opts)
keymap.set("n", "<A-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", opts)
keymap.set("n", "<A-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", opts)

keymap.set("n", "<leader>p", "<Cmd>BufferLinePick<CR>", opts)
keymap.set("n", "<leader>c", "<Cmd>BufferLineCloseOthers<CR>", opts)
keymap.set("n", "<leader>x", "<Cmd>BufferLineClose<CR>", opts)

-- <A-j> <A-k> 비활성화
keymap.set("i", "<A-k>", "<Nop>", { noremap = true, silent = true })
keymap.set("n", "<A-j>", "<Nop>", { noremap = true, silent = true })
keymap.set("n", "<A-k>", "<Nop>", { noremap = true, silent = true })
keymap.set("x", "<A-j>", "<Nop>", { noremap = true, silent = true })
keymap.set("x", "<A-k>", "<Nop>", { noremap = true, silent = true })
keymap.set("x", "J", "<Nop>", { noremap = true, silent = true })
keymap.set("x", "K", "<Nop>", { noremap = true, silent = true })
