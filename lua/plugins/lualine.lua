return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- Show Lazy updates instead of clock
    opts.sections.lualine_z = {
      {
        require("lazy.status").updates,
        cond = require("lazy.status").has_updates,
        color = { fg = "#ff9e64" },
      },
    }
  end,
}
