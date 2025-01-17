return {
    -- Oxocarbon as the default color scheme
    {
        "nyoom-engineering/oxocarbon.nvim",
        lazy = false,
        priority = 999,                      -- Load before other plugins
        config = function()
            vim.cmd.colorscheme("oxocarbon") -- Set oxocarbon as default
            vim.opt.background = "dark"      -- Ensure dark mode
        end,
    },

    -- other colorschemes
    {
        'kdheepak/monochrome.nvim',
        config = function()
            vim.cmd 'colorscheme monochrome'
        end,
        lazy = true, -- Lazy load monochrome (optional, to save resources on startup)
    },
}
