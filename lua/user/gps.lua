local status_ok, gps = pcall(require, "nvim-gps")
if not status_ok then
	return
end

-- vim.api.nvim_set_hl(0, "WinBarSeparator", { fg = "#111fff" })
-- local fg = vim.api.nvim_get_hl_by_name('DiffAdd', 0).background
-- local bg = vim.api.nvim_get_hl_by_name('DiffAdd', 0).foreground

local space = ""

if vim.fn.has("mac") == 1 then
	space = " "
end

-- Customized config
gps.setup({

	disable_icons = false, -- Setting it to true will disable all icons

	icons = {
		["class-name"] = "%#CmpItemKindClass#" .. "" .. "%*" .. space, -- Classes and class-like objects
		["function-name"] = "%#CmpItemKindFunction#" .. "" .. "%*" .. space, -- Functions
		["method-name"] = "%#CmpItemKindMethod#" .. " " .. "%*" .. space, -- Methods (functions inside class-like objects)
		["container-name"] = "%#CmpItemKindProperty#" .. "" .. "%*" .. space, -- Containers (example: lua tables)
		["tag-name"] = "%#CmpItemKindKeyword#" .. "" .. "%*" .. " ", -- Tags (example: html tags)
		["mapping-name"] = "%#CmpItemKindProperty#" .. "" .. "%*" .. space,
		["sequence-name"] = "%#CmpItemKindProperty#" .. "" .. "%*" .. space,
		["null-name"] = "%#CmpItemKindField#" .. "" .. "%*" .. space,
		["boolean-name"] = "%#CmpItemKindValue#" .. "蘒" .. "%*" .. space,
		["integer-name"] = "%#CmpItemKindValue#" .. "" .. "%*" .. space,
		["float-name"] = "%#CmpItemKindValue#" .. "" .. "%*" .. space,
		["string-name"] = "%#CmpItemKindValue#" .. "" .. "%*" .. space,
		["array-name"] = "%#CmpItemKindProperty#" .. "" .. "%*" .. space,
		["object-name"] = "%#CmpItemKindProperty#" .. "" .. "%*" .. space,
		["number-name"] = "%#CmpItemKindValue#" .. "" .. "%*" .. space,
		["table-name"] = "%#CmpItemKindProperty#" .. "" .. "%*" .. space,
		["date-name"] = "%#CmpItemKindValue#" .. "" .. "%*" .. space,
		["date-time-name"] = "%#CmpItemKindValue#" .. "" .. "%*" .. space,
		["inline-table-name"] = "%#CmpItemKindProperty#" .. "" .. "%*" .. space,
		["time-name"] = "%#CmpItemKindValue#" .. "" .. "%*" .. space,
		["module-name"] = "%#CmpItemKindModule#" .. "" .. "%*" .. space,
	},

	-- Add custom configuration per language or
	-- Disable the plugin for a language
	-- Any language not disabled here is enabled by default
	-- languages = {
	-- 	-- Some languages have custom icons
	-- 	["json"] = {
	-- 		icons = {
	-- 		}
	-- 	},
	-- 	["toml"] = {
	-- 		icons = {
	-- 		}
	-- 	},
	-- 	["verilog"] = {
	-- 		icons = {
	-- 		}
	-- 	},
	-- 	["yaml"] = {
	-- 		icons = {
	-- 		}
	-- 	},

	-- Disable for particular languages
	-- ["bash"] = false, -- disables nvim-gps for bash
	-- ["go"] = false,   -- disables nvim-gps for golang

	-- Override default setting for particular languages
	-- ["ruby"] = {
	--	separator = '|', -- Overrides default separator with '|'
	--	icons = {
	--		-- Default icons not specified in the lang config
	--		-- will fallback to the default value
	--		-- "container-name" will fallback to default because it's not set
	--		["function-name"] = '',    -- to ensure empty values, set an empty string
	--		["tag-name"] = ''
	--		["class-name"] = '::',
	--		["method-name"] = '#',
	--	}
	--}
	-- },

	separator = " " .. ">" .. " ",

	-- limit for amount of context shown
	-- 0 means no limit
	-- Note: to make use of depth feature properly, make sure your separator isn't something that can appear
	-- in context names (eg: function names, class names, etc)
	depth = 0,

	-- indicator used when context is hits depth limit
	depth_limit_indicator = "..",
	text_hl = "LineNr",
})
