local function skip_large_files()
    local file_path = vim.api.nvim_buf_get_name(0)
    return vim.fn.getfsize(file_path) < 1000000 -- Skip files larger than 1MB
end

return {
    {
        "jose-elias-alvarez/null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "mason.nvim",
            "jay-babu/mason-null-ls.nvim",
        },
        config = function()
            local null_ls = require("null-ls")
            local formatting = null_ls.builtins.formatting
            local diagnostics = null_ls.builtins.diagnostics
            local code_actions = null_ls.builtins.code_actions

            require("mason-null-ls").setup({
                ensure_installed = {
                    "prettier",
                    "stylua",
                    "black",
                    "isort",
                    "eslint_d",
                    "flake8",
                },
                automatic_installation = true,
            })

            null_ls.setup({
                debug = false,
                sources = {
                    -- Formatting
                    formatting.prettier.with({
                        extra_args = { "--single-quote", "--jsx-single-quote", "--arrow-parens=avoid" },
                        timeout = 7000,
                        condition = skip_large_files,
                    }),
                    formatting.stylua.with({
                        extra_args = { "--column-width=120", "--indent-type=spaces", "--indent-width=4" },
                        condition = skip_large_files,
                    }),
                    formatting.black.with({
                        extra_args = { "--line-length=120" },
                        condition = skip_large_files,
                    }),
                    formatting.isort.with({
                        extra_args = { "--profile", "black" },
                        condition = skip_large_files,
                    }),

                    -- Diagnostics
                    diagnostics.eslint_d.with({
                        condition = function(utils)
                            return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json" })
                        end,
                        timeout = 5000,
                    }),
                    diagnostics.flake8.with({
                        extra_args = { "--max-line-length", "120" },
                    }),

                    -- Code Actions
                    code_actions.gitsigns,
                    code_actions.eslint_d,
                },
                on_attach = function(client, bufnr)
                    vim.keymap.set("n", "<leader>f", function()
                        vim.lsp.buf.format({
                            async = false,
                            timeout_ms = 2000,
                            filter = function(c)
                                return c.name == "null-ls"
                            end,
                        })
                    end, { buffer = bufnr, desc = "Format buffer" })

                    if client.supports_method("textDocument/formatting") then
                        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
                        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                if skip_large_files() then
                                    vim.lsp.buf.format({
                                        async = false,
                                        timeout_ms = 2000,
                                        filter = function(c)
                                            return c.name == "null-ls"
                                        end,
                                    })
                                end
                            end,
                        })
                    end
                end,
            })
        end,
    },
}
