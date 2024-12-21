return {
    -- nvim colorizer
    {
        "NvChad/nvim-colorizer.lua",
        lazy = false,
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("colorizer").setup({
                filetypes = { "*" },
                user_default_options = {
                    RGB = true,
                    RRGGBB = true,
                    names = true,
                    RRGGBBAA = true,
                    AARRGGBB = true,
                    rgb_fn = true,
                    hsl_fn = true,
                    css = true,
                    css_fn = true,
                    mode = "background", -- Set the display mode.
                    tailwind = true,
                    sass = { enable = true, parsers = { "css" }, },
                    virtualtext = "■",
                    always_update = false
                },
                buftypes = { "*" },
            })
        end
    },
    -- nvim-tmux-navigation
    {
        "alexghergh/nvim-tmux-navigation",
        config = function()
            require('nvim-tmux-navigation').setup({})
            vim.keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", {})
            vim.keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", {})
            vim.keymap.set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", {})
            vim.keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", {})
        end,
    },
}

-- nvim-autopairs
-- {
--     'windwp/nvim-autopairs',
--     event = "InsertEnter",
--     opts = {
--         check_ts = true,                        -- Enable treesitter
--         ts_config = {
--             lua = { "string" },                 -- Don't add pairs in lua string treesitter nodes
--             javascript = { "template_string" }, -- Don't add pairs in JavaScript template_string treesitter nodes
--             java = false,                       -- Don't check treesitter on Java
--         },
--     },
-- },
