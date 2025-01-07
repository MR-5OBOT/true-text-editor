local function skip_large_files()
    local file_path = vim.api.nvim_buf_get_name(0)
    return vim.fn.getfsize(file_path) < 100000 -- Skip large files
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
                        extra_args = {
                            "--single-quote",                       -- Use single quotes for JS/JSX, but not for HTML
                            "--jsx-single-quote",                   -- For JSX, use single quotes
                            "--html-whitespace-sensitivity=ignore", -- Avoid whitespace changes in HTML
                            "--tab-width=2",                        -- Set indentation to 2 spaces
                            "--use-tabs=false",                     -- Use spaces instead of tabs
                            "--semi=true",                          -- Always add semicolons
                            "--single-quote=false",                 -- Double quotes for HTML attributes
                            "--print-width=150",                    -- Set the max print width to 80 characters
                        },
                        timeout = 7000,
                        condition = skip_large_files,
                    }),
                    formatting.stylua.with({
                        extra_args = {
                            "--column-width=160",        -- Allow long lines up to 140 characters
                            "--indent-type=spaces",      -- Use spaces for indentation
                            "--indent-width=4",          -- 4 spaces for indentation
                            "--align-array-table=false", -- No forced alignment for tables/arrays
                            "--call-parentheses=false",  -- Avoid forced multi-line calls
                            "--quote-style=auto",        -- Use consistent quotes
                        },
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
                    -- vim.keymap.set("n", "<leader>f", function()
                    --     vim.lsp.buf.format({
                    --         async = false,
                    --         timeout_ms = 2000,
                    --         filter = function(c)
                    --             return c.name == "null-ls"
                    --         end,
                    --     })
                    -- end, { buffer = bufnr, desc = "Format buffer" })

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
