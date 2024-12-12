return {
    {
        "nyoom-engineering/oxocarbon.nvim",
        lazy = false,
        priority = 999,                -- Load before other plugins
        config = function()
            vim.cmd.colorscheme("oxocarbon") -- Set oxocarbon as default
            vim.opt.background = "dark" -- Ensure dark mode
        end,
    },
}
