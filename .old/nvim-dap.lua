return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
            "nvim-neotest/nvim-nio",
            "williamboman/mason.nvim",
        },
        config = function()
            local dap = require "dap"
            local ui = require "dapui"

            require("dapui").setup()
            require("nvim-dap-virtual-text").setup()

            -- Sample DAP configuration for Python
            dap.adapters.python = {
                type = "executable",
                command = "python3",
                args = { "-m", "debugpy.adapter" },
            }

            dap.configurations.python = {
                {
                    type = "python",
                    request = "launch",
                    name = "Launch file",
                    program = "${file}",
                    pythonPath = function()
                        return "/usr/bin/python3" -- Adjust as per your Python installation
                    end,
                },
            }

            -- Eval var under cursor
            vim.keymap.set("n", "<space>?", function()
                require("dapui").eval(nil, { enter = true })
            end)

            vim.keymap.set("n", "<space>db", dap.toggle_breakpoint)
            vim.keymap.set("n", "<space>dg", dap.run_to_cursor)

            vim.keymap.set("n", "<Leader>do", dap.step_over)
            vim.keymap.set("n", "<Leader>dx", dap.step_out)
            vim.keymap.set("n", "<F1>", dap.continue)
            vim.keymap.set("n", "<F2>", dap.step_into)
            vim.keymap.set("n", "<F5>", dap.step_back)
            vim.keymap.set("n", "<F6>", dap.restart)

            dap.listeners.before.attach.dapui_config = function()
                ui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                ui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                ui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                ui.close()
            end
        end,
    },
}

