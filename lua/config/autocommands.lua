local ag = vim.api.nvim_create_augroup
local au = vim.api.nvim_create_autocmd

-- Disable commenting new lines
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

-- return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
        if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
            vim.cmd('normal! g`"')
        end
    end,
})

-- Default yank highlight
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- local set = vim.opt_local
-- -- Set local settings for terminal buffers
-- vim.api.nvim_create_autocmd("TermOpen", {
--     group = vim.api.nvim_create_augroup("custom-term-open", {}),
--     callback = function()
--         set.number = false
--         set.relativenumber = false
--         set.scrolloff = 0
--
--         vim.bo.filetype = "terminal"
--     end,
-- })
