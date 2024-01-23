return {
  'dense-analysis/ale',
  ft = {'tex'},
  config = function()
     vim.g.ale_linters = {
       tex = {'chktex', 'lacheck'}
     }
  end
}

