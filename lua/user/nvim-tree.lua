local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
	return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
	hijack_cursor = true,
	reload_on_bufenter = true,
	ignore_ft_on_setup = {
		"startify",
		"dashboard",
		"alpha",
		"toggleterm",
	},
	view = {
		width = 30,
		height = 30,
		hide_root_folder = false,
		side = "left",
		mappings = {
			custom_only = false,
			list = {
				{ key = "v", cb = tree_cb("vsplit") },
			},
		},
	},
	renderer = {
		group_empty = true,
		highlight_git = false,
		highlight_opened_files = "none",
		root_folder_modifier = ":t",
		special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
		indent_markers = {
			enable = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "─",
				none = " ",
			},
		},
		icons = {
			webdev_colors = true,
			git_placement = "after",
			padding = " ",
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				default = "", -- 
				symlink = "",
				bookmark = "",
				folder = {
					arrow_open = "",
					arrow_closed = "",
					default = "", -- 
					open = "", -- 
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "",
					staged = "S", -- ✓
					unmerged = "",
					renamed = "➜",
					untracked = "U", -- ✗
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = false,
		ignore_list = {},
	},
	git = {
		enable = true,
		ignore = false,
		show_on_dirs = true,
		timeout = 400,
	},
	filters = {
		dotfiles = false,
		custom = {},
		exclude = {},
	},
})
