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
-- local map = vim.api.nvim_set_keymap

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

keymap("i", "jk", "<ESC>", opts)                    -- Press jk fast to exit insert mode
keymap("n", "<Enter>", "<cmd>nohlsearch<CR>", opts) -- Clear search
keymap('n', '<TAB>', ':bnext<CR>', { noremap = true, silent = true, desc = 'Next buffer' })
keymap('n', '<S-TAB>', ':bprevious<CR>', { noremap = true, silent = true, desc = 'Next buffer' })
keymap("n", "<leader>mx", "<cmd>!chmod +x %<CR>", { desc = "Chmod +x without leaving document", silent = true })

keymap('n', '<leader>ms', ':%s/', { desc = "multi select & replace" }) -- Easier multi select and remove
vim.keymap.set('v', '<leader>ms', [[:s//g<Left><Left>]],
    { desc = "Multi-select & replace", noremap = true, silent = true })


keymap('v', 'J', ":m '>+1<CR>gv=gv")                                              -- move selected lines DOWN
keymap('v', 'K', ":m '<-2<CR>gv=gv")                                              -- move selected lines UP

keymap("n", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true }) -- Allow moving the cursor through wrapped lines
keymap("n", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true }) -- Allow moving the cursor through wrapped lines

keymap('n', '<leader>e', ':Explore<CR>', { noremap = true, silent = true })

-- run the current Python file
-- vim.keymap.set('n', '<leader>r', function()
--         local file = vim.fn.expand('%:p') -- Get the full path of the current file
--         local term_cmd = string.format("python3 %s", file)
--         -- Create a new terminal and run the Python command interactively
--         require("toggleterm.terminal").Terminal
--             :new({
--                 cmd = term_cmd,
--                 direction = "float",    -- Make sure it's in float direction if you want a floating window
--                 close_on_exit = true,   -- Keep terminal open after the Python script finishes
--                 start_in_insert = true, -- Start the terminal in insert mode to allow input
--             })
--             :toggle()
--     end,
--     { noremap = true, silent = true, desc = "Run Python file" })
