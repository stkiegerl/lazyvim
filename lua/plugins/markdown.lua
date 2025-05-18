return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {
    enabled = false, -- disable rendering by default
    on = {
      -- hide diagnostics when rendering is active
      render = function()
        local buf = vim.api.nvim_get_current_buf()
        vim.diagnostic.hide(nil, buf)
      end,
      -- show diagnostics when rendering is deactivated
      clear = function()
        local buf = vim.api.nvim_get_current_buf()
        vim.diagnostic.show(nil, buf)
      end,
    },
  },
}
