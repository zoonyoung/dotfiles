-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

-- General
opt.laststatus = 3 -- global statusline
opt.showmode = false
opt.scrolloff = 10
opt.timeoutlen = 300 -- 키 매핑 대기 시간 설정
opt.ttimeoutlen = 10 -- 터미널 모드에서 키 매핑 대기 시간 설정

opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.hlsearch = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false
opt.relativenumber = true

-- disable nvim intro
opt.shortmess:append("sI")

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
opt.whichwrap:append("<>[]hl")
-- when cursor reaches end/beginning of line
