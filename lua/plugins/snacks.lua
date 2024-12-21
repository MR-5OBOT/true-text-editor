return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        lazygit = { enabled = true },
        notifier = { enabled = true, timeout = 2500 },
        quickfile = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
        styles = { notification = { wo = { wrap = true } } },
    },
    keys = {
        { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
        { "<leader>R",  function() Snacks.rename.rename_file() end,    desc = "Rename File" },
        { "<leader>gg", function() Snacks.lazygit() end,               desc = "Lazygit" },
        { "<leader>gl", function() Snacks.lazygit.log() end,           desc = "Lazygit Log (cwd)" },
    },
}
