local M = {}

function M:load()
  require "phyvim.config.keymaps"
  require "phyvim.config.options".load_options()
	-- TODO below
	require "phyvim.config.autocmds"

  vim.g.tokyonight_style = "night"
  local colorscheme = "tokyonight"

	local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
	if not status_ok then
		vim.notify("colorscheme " .. colorscheme " not found!")
		return
	end
end

return M
