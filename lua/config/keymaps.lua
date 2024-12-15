---------------------------------------------------------------
-- ██╗  ██╗███████╗██╗   ██╗███╗   ███╗ █████╗ ██████╗ ███████╗
-- ██║ ██╔╝██╔════╝╚██╗ ██╔╝████╗ ████║██╔══██╗██╔══██╗██╔════╝
-- █████╔╝ █████╗   ╚████╔╝ ██╔████╔██║███████║██████╔╝███████╗
-- ██╔═██╗ ██╔══╝    ╚██╔╝  ██║╚██╔╝██║██╔══██║██╔═══╝ ╚════██║
-- ██║  ██╗███████╗   ██║   ██║ ╚═╝ ██║██║  ██║██║     ███████║
-- ╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ╚══════╝

-----------------------------------------------
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set
local map = vim.api.nvim_set_keymap

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

keymap("i", "jk", "<ESC>", opts)                    -- Press jk fast to exit insert mode
keymap("n", "<Enter>", "<cmd>nohlsearch<CR>", opts) -- Clear search
keymap('n', '<TAB>', '<cmd>bnext<CR>', { noremap = true, silent = true, desc = 'Next buffer' })
keymap("n", "<leader>mx", "<cmd>!chmod +x %<CR>", { desc = "Chmod +x without leaving document", silent = true })
keymap('n', '<leader>ms', ':%s/', { desc = "multi select & replace" })            -- Easier multi select and remove

keymap('v', 'J', ":m '>+1<CR>gv=gv")                                              -- move selected lines DOWN
keymap('v', 'K', ":m '<-2<CR>gv=gv")                                              -- move selected lines UP

keymap("n", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true }) -- Allow moving the cursor through wrapped lines
keymap("n", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true }) -- Allow moving the cursor through wrapped lines

keymap('n', '<leader>e', ':Explore<CR>', { noremap = true, silent = true })

-- Easily hit escape in terminal mode.
-- vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

-- -- Open a terminal at the bottom of the screen with a fixed height.
-- vim.keymap.set("n", "<leader>z", function()
--     vim.cmd.new()
--     vim.cmd.wincmd "J"
--     vim.api.nvim_win_set_height(0, 12)
--     vim.wo.winfixheight = true
--     vim.cmd.term()
-- end)
