local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
	return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

require("lsp-file-operations").setup()

local i = require("user.icons")

nvim_tree.setup({
	hijack_cursor = true,
	reload_on_bufenter = true,
	view = {
		width = 30,
		hide_root_folder = false,
		side = "left",
		mappings = {
			custom_only = false,
			-- list = {
			-- 	{ key = "v", cb = tree_cb("vsplit") },
			-- },
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
					arrow_closed = "",
					arrow_open = "",
					default = "", -- 
					open = "", -- 
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = i.git.status.Unstaged,
					staged = i.git.status.Staged,
					unmerged = i.git.status.Unmerged,
					renamed = i.git.status.Renamed,
					untracked = i.git.status.Untracked,
					deleted = i.git.status.Deleted,
					ignored = i.git.status.Ignored,
				},
			},
		},
	},
	diagnostics = {
		enable = false,
		show_on_dirs = false,
		icons = {
			hint = i.diagnostics.Hint,
			info = i.diagnostics.Information,
			warning = i.diagnostics.Warning,
			error = i.diagnostics.Error,
		},
	},
	update_focused_file = {
		enable = true,
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
