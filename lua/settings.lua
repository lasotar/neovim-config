-- GENERAL SETTINGS --

vim.opt.shiftwidth = 2 -- Tab = two spaces
vim.opt.expandtab = true -- Tabs ARE spaces
vim.opt.tabstop = 2

vim.opt.undofile = true -- enables undo file

vim.opt.number = true -- Line numbers
vim.g.relativenumber = false -- Relative if you want

vim.opt.clipboard = "unnamedplus" -- Makes yanking store inside system clipboard


-- KEYMAPS --

vim.g.mapleader = " " -- Space as the leader key

-- AUTOCOMPLETE KEYMAPS (edit in plugins/autocomplete.lua)
-- [C-n] next autocompletion item
-- [C-p] previous autocompletion item
-- [C-y] explicityly select autocompletion item
-- [C-Space] explicityly trigger autocompletion

-- CLANGD DIAGNOSTICS KEYMAPS (edit in plugins/language-servers.lua)
-- <Leader>d open diagnostics 
-- [d goto previous diagnostic
-- ]d goto next diagnostics


-- TELESCOPE KEYMAPS
vim.keymap.set('n', '<Leader>ff', require('telescope.builtin').find_files, { desc = "Find Files" })
vim.keymap.set('n', '<Leader>fg', require('telescope.builtin').live_grep, { desc = "Live Grep" })
vim.keymap.set('n', '<Leader>fb', require('telescope.builtin').buffers, { desc = "Find Buffers" })
vim.keymap.set('n', '<Leader>fh', require('telescope.builtin').help_tags, { desc = "Help Tags" })

-- THE AWESOME KEYMAPS

-- Unset "s" in normal mode to enable amazing mini.nvim keymaps (see plugins/mini.lua)
vim.api.nvim_set_keymap('n', 's', '', { noremap = true, silent = true })
-- be sure to remember mini.nvim keymaps by heart, they are the best keymaps in existence

-- VISUAL SETTINGS --

vim.opt.termguicolors = true
vim.cmd("colorscheme modus") -- Active theme
vim.api.nvim_set_hl(0, "Normal", { bg = "#0a0a0a" }) -- Made the background slightly lighter manually


