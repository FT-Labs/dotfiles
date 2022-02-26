local M = {}

function M:load()
  local options = require "phyvim.config.options"
  require "phyvim.config.keymaps"
  options.load_options()

  vim.g.tokyonight_style = "night"
  local colorscheme = "tokyonight"

	local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
	if not status_ok then
		vim.notify("colorscheme " .. colorscheme " not found!")
		return
	end
end

return M
