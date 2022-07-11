require("onedarkpro").setup({
	theme = "onedark_vivid", -- "onedark", "onelight", "onedark_vivid", "onedark_dark"
	filetype_hlgroups_ignore = {
		filetypes = {
			"^aerial$",
			"^alpha$",
			"^fugitive$",
			"^fugitiveblame$",
			"^help$",
			"^NvimTree$",
			"^packer$",
			"^qf$",
			"^startify$",
			"^startuptime$",
			"^TelescopePrompt$",
			"^TelescopeResults$",
			"^terminal$",
			"^toggleterm$",
			"^undotree$",
		},
		buftypes = {
			"^terminal$",
		},
	},
	plugins = { -- Override which plugins highlight groups are loaded
		native_lsp = true,
		treesitter = true,
	},
	styles = {
		comments = "italic",
		functions = "bold",
		keywords = "bold,italic",
		strings = "NONE",
		variables = "bold",
		virtual_text = "NONE",
	},
	options = {
		bold = true, -- Use the themes opinionated bold styles?
		italic = true, -- Use the themes opinionated italic styles?
		underline = true, -- Use the themes opinionated underline styles?
		undercurl = true, -- Use the themes opinionated undercurl styles?
		cursorline = true, -- Use cursorline highlighting?
		transparency = false, -- Use a transparent background?
		terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
		window_unfocussed_color = false, -- When the window is out of focus, change the normal background?
	},
})
