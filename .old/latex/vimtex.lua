return {
  "lervag/vimtex",
  -- dependencies = {
  --   "micangl/cmp-vimtex",
  -- },
  -- version = "*",
  -- event = { "BufReadPre", "BufNewFile" },
  config = function()

    vim.g['vimtex_view_method'] = 'zathura'

    vim.g['vimtex_quickfix_mode'] = 1

    -- Ignore mappings
    vim.g['vimtex_mappings_enabled'] = 1

    -- Auto Indent
    vim.g['vimtex_indent_enabled'] = 0

    -- Syntax highlighting
    vim.g['vimtex_syntax_enabled'] = 0

    vim.g.vimtex_view_enabled = 1

    -- Error suppression:
    -- https://github.com/lervag/vimtex/blob/master/doc/vimtex.txt
    vim.g['vimtex_log_ignore'] = ({
      'Underfull',
      'Overfull',
      'specifier changed to',
      'Token not allowed in a PDF string',
    })

    vim.g['vimtex_context_pdf_viewer'] = 'zathura'

  end,
}
