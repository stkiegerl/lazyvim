return {
  "okuuva/auto-save.nvim",
  version = "^1.0.0", -- see https://devhints.io/semver, alternatively use '*' to use the latest tagged release
  cmd = "ASToggle", -- optional for lazy loading on command
  -- event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
  event = { "BufReadPost" },
  opts = {
    enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
    trigger_events = { -- See :h events
      immediate_save = { "BufLeave", "FocusLost", "QuitPre", "VimSuspend" }, -- vim events that trigger an immediate save
      defer_save = { "InsertLeave", "TextChanged", "TextChangedI" }, -- vim events that trigger a deferred save (saves after `debounce_delay`)
      cancel_deferred_save = { "InsertEnter" }, -- vim events that cancel a pending deferred save
    },
    -- function that takes the buffer handle and determines whether to save the current buffer or not
    -- return true: if buffer is ok to be saved
    -- return false: if it's not ok to be saved
    -- if set to `nil` then no specific condition is applied
    -- condition = nil,
    ------------------------------------------------------------------
    --  ⛔  DO NOT auto-save when editing Neovim config files inside ~/.config/nvim
    ------------------------------------------------------------------
    condition = function(bufnr)
      local fn = vim.fn
      local config_dir = fn.stdpath("config") -- ~/.config/nvim
      local file = fn.expand("#" .. bufnr .. ":p") -- absolute path

      -- Skip non-writable buffers too (same guard the plugin uses internally)
      if fn.getbufvar(bufnr, "&modifiable") == 0 then
        return false
      end

      -- Return false if the file lives in your config directory
      return not vim.startswith(file, config_dir)
    end,
    write_all_buffers = false, -- write all buffers when the current one meets `condition`
    noautocmd = true, -- do not execute autocmds when saving
    lockmarks = false, -- lock marks when saving, see `:h lockmarks` for more details
    debounce_delay = 2000, -- delay after which a pending save is executed
    -- log debug messages to 'auto-save.log' file in neovim cache directory, set to `true` to enable
    debug = false,
  },
  ---------------------------------------------------------
  -- Optional: print a message when a file is saved
  ---------------------------------------------------------
  -- config = function(_, opts)
  --   require("auto-save").setup(opts)
  --
  --   local group = vim.api.nvim_create_augroup("autosave", {})
  --
  --   vim.api.nvim_create_autocmd("User", {
  --     pattern = "AutoSaveWritePost",
  --     group = group,
  --     callback = function(event)
  --       if event.data.saved_buffer ~= nil then
  --         local filename = vim.api.nvim_buf_get_name(event.data.saved_buffer)
  --         vim.notify("AutoSave: saved " .. filename .. " at " .. vim.fn.strftime("%H:%M:%S"), vim.log.levels.INFO)
  --       end
  --     end,
  --   })
  -- end,
}
