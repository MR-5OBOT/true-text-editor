return {
    -- https://github.com/mfussenegger/nvim-dap-python
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
        -- https://github.com/mfussenegger/nvim-dap
        "mfussenegger/nvim-dap",
    },
    config = function()
        -- Update the path passed to setup to point to your system or virtual env python binary
        require("dap-python").setup("/usr/bin/python3")
        -- Keymap for testing a method
        vim.keymap.set("n", "<leader>dt", function()
            require("dap-python").test_method()
        end, { desc = "Debug Python Test Method" })
    end,
}
