return {
 "lervag/vimtex",
 ft = {"tex"},
 config = function()
    vim.g.vimtex_compiler_progname = 'nvr'
    vim.g.vimtex_quickfix_mode = 0
    vim.g.vimtex_quickfix_open_on_warning = 0
    vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_view_automatic = 0
 end
}

