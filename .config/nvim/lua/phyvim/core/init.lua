local M = {}

function M:load()
	require "impatient"
	require "phyvim.core.cmp".setup()
	require "phyvim.core.telescope".setup()
	require "phyvim.core.treesitter".setup()
	require "phyvim.core.autopairs".setup()
	require "phyvim.core.comment".setup()
	require "phyvim.core.gitsigns".setup()
	require "phyvim.core.nvimtree".setup()
	require "phyvim.core.bufferline".setup()
	require "phyvim.core.project".setup()
	require "phyvim.core.lualine".setup()
	require "phyvim.core.symbols-outline".setup()
	require "phyvim.core.indent-line".setup()
end

return M
