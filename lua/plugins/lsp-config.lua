return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
        },
        config = function()
            local lspconfig = require("lspconfig")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")

            -- Diagnostic settings
            vim.diagnostic.config({
                virtual_text = { prefix = "●", source = "if_many" },
                float = { source = "always", border = "rounded" },
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
            })

            -- Keymaps for LSP
            local function set_keymaps(bufnr)
                local opts = { noremap = true, silent = true, buffer = bufnr }
                local keymaps = {
                    ["K"] = vim.lsp.buf.hover,
                    ["[d"] = function() vim.diagnostic.goto_prev({ float = { border = "rounded" } }) end,
                    ["]d"] = function() vim.diagnostic.goto_next({ float = { border = "rounded" } }) end,
                }
                for k, v in pairs(keymaps) do
                    vim.keymap.set("n", k, v, opts)
                end
            end


            -- On attach handler
            local function on_attach(client, bufnr)
                set_keymaps(bufnr)

                -- Skip formatting for HTML files and let null-ls handle it
                if client.server_capabilities.documentFormattingProvider then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        callback = function()
                            local filetype = vim.bo[bufnr].filetype
                            -- Skip formatting if filetype is html and allow null-ls to handle it
                            if filetype ~= "html" then
                                vim.lsp.buf.format({ async = false })
                            end
                        end,
                    })
                end
            end

            -- Setup servers
            local capabilities = cmp_nvim_lsp.default_capabilities()
            local servers = {
                pyright = {},
                lua_ls = {
                    settings = {
                        Lua = {
                            runtime = { version = "LuaJIT" },
                            diagnostics = { globals = { "vim" } },
                            workspace = { library = { vim.fn.stdpath("config") .. "/lua" } },
                        },
                    },
                },
                ts_ls = {},
                html = {},
                cssls = {},
            }

            for server, config in pairs(servers) do
                lspconfig[server].setup(vim.tbl_deep_extend("force", {
                    on_attach = on_attach,
                    capabilities = capabilities,
                }, config))
            end
        end,
    },
}
