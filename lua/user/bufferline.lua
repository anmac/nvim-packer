local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline.setup({
	options = {
		close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		right_mouse_command = "vertical sbuffer %d", -- can be a string | function, see "Mouse actions"
		middle_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		indicator = {
			icon = "┃",
			style = "icon",
		},
		close_icon = "", -- 
		max_name_length = 18,
		-- max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
		truncate_names = true,
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
		diagnostics_indicator = function(count)
			return "" .. count .. ""
		end,
		offsets = {
			{ filetype = "NvimTree", text = "File Explorer", highlight = "Directory", separator = true, padding = 0 },
		},
		color_icons = true,
		show_tab_indicators = true,
		separator_style = "thin", -- | "slant" | "thick" | "thin" | { 'any', 'any' },
		hover = {
			enabled = true,
			delay = 50,
			reveal = { "close" },
		},
		sort_by = "insert_at_end",
		-- custom_areas = {
		-- 	right = function()
		-- 		local result = {}
		-- 		local seve = vim.diagnostic.severity
		-- 		local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
		-- 		local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
		-- 		local info = #vim.diagnostic.get(0, { severity = seve.INFO })
		-- 		local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

		-- 		if error ~= 0 then
		-- 			table.insert(result, { text = "  " .. error, fg = "#EC5241" })
		-- 		end

		-- 		if warning ~= 0 then
		-- 			table.insert(result, { text = "  " .. warning, fg = "#EFB839" })
		-- 		end

		-- 		if hint ~= 0 then
		-- 			table.insert(result, { text = "  " .. hint, fg = "#A3BA5E" })
		-- 		end

		-- 		if info ~= 0 then
		-- 			table.insert(result, { text = "  " .. info, fg = "#7EA9A7" })
		-- 		end
		-- 		return result
		-- 	end,
		-- },
	},
	highlights = require("catppuccin.groups.integrations.bufferline").get(),
})
