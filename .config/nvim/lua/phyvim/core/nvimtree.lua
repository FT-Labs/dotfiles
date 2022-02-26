local M = {}

local opts = {

	setup = {
		disable_netrw = true,
		hijack_netrw = true,
		open_on_setup = false,
		ignore_ft_on_setup = {
			"startify",
			"dashboard",
			"alpha",
		},
		update_to_buf_dir = {
			enable = true,
			auto_open = true,
		},
		auto_close = false,
		open_on_tab = false,
		hijack_cursor = false,
		update_cwd = false,
		diagnostics = {
			enable = true,
			icons = {
				hint = "",
				info = "",
				warning = "",
				error = "",
			},
		},
		update_focused_file = {
			enable = true,
			update_cwd = true,
			ignore_list = {},
		},
		system_open = {
			cmd = nil,
			args = {},
		},
		git = {
			enable = true,
			ignore = false,
			timeout = 200,
		},
		view = {
			width = 30,
			height = 30,
			hide_root_folder = false,
			side = "left",
			auto_resize = false,
			mappings = {
				custom_only = false,
				list = {},
			},
			number = false,
			relativenumber = false,
			signcolumn = "yes",
		},
		filters = {
			dotfiles = false,
			custom = { "node_modules", ".cache" },
		},
		trash = {
			cmd = "trash",
			require_confirm = true,
		},
	},
	show_icons = {
		git = 1,
		folders = 1,
		files = 1,
		folder_arrows = 1,
		tree_width = 30,
	},
	quit_on_open = 0,
	git_hl = 1,
	disable_window_picker = 0,
	root_folder_modifier = ":t",
	icons = {
		default = "",
		symlink = "",
		git = {
			unstaged = "",
			staged = "S",
			unmerged = "",
			renamed = "➜",
			deleted = "",
			untracked = "U",
			ignored = "◌",
		},
		folder = {
			default = "",
			open = "",
			empty = "",
			empty_open = "",
			symlink = "",
		},
	},
}

function M.setup()

	vim.g.nvim_tree_indent_markers = 1 -- indentation on left tree

	local status_ok, nvim_tree = pcall(require, "nvim-tree")
	if not status_ok then
		return
	end

	local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
	if not config_status_ok then
		return
	end

  local tree_cb = nvim_tree_config.nvim_tree_callback
	opts.setup.view.mappings.list = {
      { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
      { key = "h", cb = tree_cb "close_node" },
      { key = "v", cb = tree_cb "vsplit" },
      { key = "C", cb = tree_cb "cd" },
      { key = "gtf", cb = "<cmd>lua require'phyvim.core.nvimtree'.start_telescope('find_files')<cr>" },
      { key = "gtg", cb = "<cmd>lua require'phyvim.core.nvimtree'.start_telescope('live_grep')<cr>" },
	}

	nvim_tree.setup(opts.setup)
end

function M.start_telescope(telescope_mode)
  local node = require("nvim-tree.lib").get_node_at_cursor()
  local abspath = node.link_to or node.absolute_path
  local is_folder = node.open ~= nil
  local basedir = is_folder and abspath or vim.fn.fnamemodify(abspath, ":h")
  require("telescope.builtin")[telescope_mode] {
    cwd = basedir,
  }
end

return M
