local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local status_theme_ok, theme = pcall(require, "lualine.themes.auto")
if not status_theme_ok then
	return
end

-- vim.api.nvim_set_hl(0, "SLGitIcon", { fg = "#D16969", bg = "#303030" })
vim.api.nvim_set_hl(0, "SLGitIcon", { fg = "#D16969" })
-- vim.api.nvim_set_hl(0, "SLBranchName", { fg = "#DFAFDF", bg = "#303030", bold = false })
vim.api.nvim_set_hl(0, "SLBranchName", { fg = "#DFAFDF" })
-- vim.api.nvim_set_hl(0, "SLProgress", { fg = "#D4D4D4", bg = "#303030" })
vim.api.nvim_set_hl(0, "SLProgress", { fg = "#D4D4D4" })
vim.api.nvim_set_hl(0, "SLSeparator", { fg = "#808080", bg = "#252525" })
local mode_color = {
	n = "#569CD6",
	i = "#6A9955",
	v = "#C586C0",
	[""] = "#C586C0",
	V = "#C586C0",
	c = "#4EC9B0",
	no = "#569CD6",
	s = "#CE9178",
	S = "#CE9178",
	[""] = "#CE9178",
	ic = "#DCDCAA",
	R = "#D16969",
	Rv = "#D16969",
	cv = "#569CD6",
	ce = "#569CD6",
	r = "#D16969",
	rm = "#4EC9B0",
	["r?"] = "#4EC9B0",
	["!"] = "#4EC9B0",
	t = "#D7BA7D",
}

local mode = {
	"mode",
	color = function()
		return { fg = "#252525", bg = mode_color[vim.fn.mode()] }
	end,
}

local hide_section_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local hide_git_in_width = function()
	return vim.fn.winwidth(0) > 70
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn", "hint" },
	symbols = { error = " ", warn = " ", hint = " " },
	colored = true,
	update_in_insert = true,
	always_visible = true,
}

local diff = {
	"diff",
	colored = true,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_git_in_width,
	-- separator = "%#SLSeparator#" .. "│ " .. "%*",
}

local filetype = {
	"filetype",
	fmt = function(str)
		if vim.fn.expand("%:t") == "NvimTree_1" then
			return "🌳 " .. str
		end
		return str
	end,
	icons_enabled = true,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "%#SLGitIcon#" .. "" .. "%*" .. "%#SLBranchName#",
	colored = true,
}

-- local current_signature = function()
-- 	if not pcall(require, "lsp_signature") then
-- 		return
-- 	end
-- 	local sig = require("lsp_signature").status_line(30)
-- 	-- return sig.label .. "🐼" .. sig.hint
-- 	return "%#SLSeparator#" .. sig.hint .. "%*"
-- end

-- cool function for progress
-- local progress = function()
--   local current_line = vim.fn.line "."
--   local total_lines = vim.fn.line "$"
--   local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
--   local line_ratio = current_line / total_lines
--   local index = math.ceil(line_ratio * #chars)
--   -- return chars[index]
--   return "%#SLProgress#" .. chars[index] .. "%*"
-- end

local spaces = {
	function()
		return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
	end,
	padding = 0,
	cond = hide_section_in_width,
	-- separator = "%#SLSeparator#" .. " │" .. "%*",
	separator = " │",
}

local encoding = {
	"encoding",
	cond = hide_section_in_width,
	-- separator = "%#SLSeparator#" .. "│" .. "%*",
}

local progress = {
	"progress",
	color = "SLProgress",
}

local location = {
	"location",
	color = function()
		return { fg = "#252525", bg = mode_color[vim.fn.mode()] }
	end,
}

lualine.setup({
	options = {
		globalstatus = true,
		icons_enabled = true,
		theme = theme,
		component_separators = { left = "", right = "│" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { branch },
		lualine_c = { diagnostics, diff },
		-- lualine_c = { { current_signature, cond = hide_in_width } },
		lualine_x = { spaces, encoding, filetype },
		lualine_y = { progress },
		lualine_z = { location },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
