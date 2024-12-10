return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {
        check_ts = true,                        -- Enable treesitter
        ts_config = {
            lua = { "string" },                 -- Don't add pairs in lua string treesitter nodes
            javascript = { "template_string" }, -- Don't add pairs in JavaScript template_string treesitter nodes
            java = false,                       -- Don't check treesitter on Java
        },
    },
    { "echasnovski/mini.animate", version = false },
    {
        "alexghergh/nvim-tmux-navigation",
        config = function()
            require('nvim-tmux-navigation').setup({})
            vim.keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", {})
            vim.keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", {})
            vim.keymap.set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", {})
            vim.keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", {})
        end,
    }


}
