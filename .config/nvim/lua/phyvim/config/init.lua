local M = {}

local function load_colorscheme()
  local colorscheme = "bluloco-dark"

  local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
  if not status_ok then
    vim.notify("colorscheme " .. colorscheme " not found!")
    return
  end
end

function M:load()
  require "phyvim.config.keymaps"
  require("phyvim.config.options").load_options()
  require "phyvim.config.autocmds"
  load_colorscheme()
end

return M
