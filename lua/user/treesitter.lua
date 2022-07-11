local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
ft_to_parser.motoko = "typescript"

configs.setup({
	ensure_installed = "all", -- one of "all" or a list of languages
	ignore_install = { "" }, -- List of parsers to ignore installing
	autopairs = {
		enable = true,
	},
	autotag = {
		enable = true,
		disable = { "xml" },
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "css", "markdown" }, -- list of language that will be disabled
	},
	indent = { enable = true, disable = { "python", "css", "yaml" } },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	rainbow = {
		enable = true,
		disable = { "html" },
		extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {
		-- 	"Gold",
		-- 	"Orchid",
		-- 	"DodgerBlue",
		-- 	"Cornsilk",
		-- 	"Salmon",
		-- 	"LawnGreen",
		-- },
	},
})
