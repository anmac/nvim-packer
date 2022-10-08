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
		max_name_length = 30,
		max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
		tab_size = 21,
		offsets = {
			{ filetype = "NvimTree", text = "File Explorer", highlight = "Directory", separator = true, padding = 1 },
		},
		separator_style = "thin", -- | "slant" | "thick" | "thin" | { 'any', 'any' },
		show_tab_indicators = true,
		hover = {
			enabled = true,
			delay = 50,
			reveal = { "close" },
		},
		sort_by = "insert_at_end",
	},
	highlights = require("catppuccin.groups.integrations.bufferline").get(),
})
