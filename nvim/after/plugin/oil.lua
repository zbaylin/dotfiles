local oil = require("oil")
local wk = require("which-key")

oil.setup()

wk.add({
  { "-", oil.open, desc = "Open parent directory", mode = "n" },
  { "<leader>oa", function()
    local entry = oil.get_cursor_entry()
    local dir = oil.get_current_dir()

    if not entry or not dir then return end

    local path = dir .. entry.name

    local cmd
    if vim.fn.has("mac") == 1 then
      cmd = { "open", path }
    else
      cmd = { "xdg-open", path }
    end

    vim.fn.jobstart(cmd, { detach = true })
  end, desc = "Open in application" }
})

vim.api.nvim_create_user_command("OilToggleHidden", oil.toggle_hidden, {})
