local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Do things without affecting the registers
keymap.set("n", "x", '"_x', opts)
keymap.set("n", "<Leader>p", '"0p', opts)
keymap.set("v", "<Leader>p", '"0p', opts)

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d', opts)

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G", opts)

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit<CR>", opts)
keymap.set("n", "<Tab>", ":tabnext<CR>", opts)
keymap.set("n", "<S-Tab>", ":tabprev<CR>", opts)

-- Split window
keymap.set("n", "ss", ":split<CR>", opts)
keymap.set("n", "sv", ":vsplit<CR>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h", opts)
keymap.set("n", "sk", "<C-w>k", opts)
keymap.set("n", "sj", "<C-w>j", opts)
keymap.set("n", "sl", "<C-w>l", opts)

-- Resize window
keymap.set("n", "<C-w>h", "<C-w><", opts)
keymap.set("n", "<C-w>l", "<C-w>>", opts)
keymap.set("n", "<C-w>k", "<C-w>+", opts)
keymap.set("n", "<C-w>j", "<C-w>-", opts)

-- Save, Quit, Close file
keymap.set("n", "<leader>w", "<cmd> w <CR>", opts)
keymap.set("n", "<leader>q", "<cmd> q <CR>", opts)
keymap.set("n", "<leader>x", "<cmd> x <CR>", opts)

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

-- Disable Alt+j and Alt+k
keymap.set("n", "<A-j>", "<Nop>", opts)
keymap.set("n", "<A-k>", "<Nop>", opts)
keymap.set("i", "<A-j>", "<nop>", opts)
keymap.set("i", "<A-k>", "<nop>", opts)
keymap.set("v", "<A-k>", "<nop>", opts)
keymap.set("v", "<A-j>", "<nop>", opts)

-- Plugins
keymap.set("n", "<leader>rn", ":IncRename ", opts)
