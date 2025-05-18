return {
  "saghen/blink.cmp",
  -- Remap 'Enter' to not accept autocompletion
  opts = function(_, opts)
    opts.keymap = opts.keymap or {}
    opts.keymap["<CR>"] = { "fallback" }
  end,
}
