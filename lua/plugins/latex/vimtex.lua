return {
  "lervag/vimtex",
  dependencies = {
    "micangl/cmp-vimtex",
  },
  version = "*",
  event = { "BufReadPre", "BufNewFile" },
  config = function()

    vim.g['vimtex_compiler_method'] = 'pdflatex'

    vim.g['vimtex_view_method'] = 'zathura'

    vim.g['vimtex_quickfix_mode'] = 0

    -- Ignore mappings
    vim.g['vimtex_mappings_enabled'] = 0

    -- Auto Indent
    vim.g['vimtex_indent_enabled'] = 0

    -- Syntax highlighting
    vim.g['vimtex_syntax_enabled'] = 0

    vim.g.vimtex_view_enabled = 0

    vim.g['vimtex_context_pdf_viewer'] = 'zathura'

  end,
}
