return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        lazygit = { enabled = true },
        notifier = { enabled = true, timeout = 3000 },
        quickfile = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
        styles = { notification = { wo = { wrap = true } } },
        -- dashboard = {
        --     sections = {
        --         {
        --             section = "terminal",
        --             cmd =
        --             "chafa ~/Pictures/wallpapers/MR5OBOT.jpg --format symbols --symbols vhalf --size 60x17 --stretch; sleep .1",
        --             height = 15,
        --             padding = 1,
        --         },
        --         { pane = 2, { section = "keys", gap = 1, padding = 1 }, { section = "startup" } },
        --     },
        -- },
    },
    keys = {
        { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
        { "<leader>R",  function() Snacks.rename.rename_file() end,    desc = "Rename File" },
        { "<leader>gf", function() Snacks.lazygit.log_file() end,      desc = "Lazygit Current File History" },
        { "<leader>gg", function() Snacks.lazygit() end,               desc = "Lazygit" },
        { "<leader>gl", function() Snacks.lazygit.log() end,           desc = "Lazygit Log (cwd)" },
        { "<leader>un", function() Snacks.notifier.hide() end,         desc = "Dismiss All Notifications" },
        {
            "<leader>N",
            function()
                Snacks.win({
                    file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
                    width = 0.6,
                    height = 0.6,
                    wo = { spell = false, wrap = false, signcolumn = "yes", statuscolumn = " ", conceallevel = 3 },
                })
            end,
            desc = "Neovim News",
        },
    },
}
