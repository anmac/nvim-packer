local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
	return
end

local gitSings = {
  add = "", -- ▎
  change = "", -- ▎
  delete = "", -- 契  
  topdelete = "", --  
  changedelete= "契", -- ▎ 
}

gitsigns.setup({
	signs = {
		add = { hl = "GitSignsAdd", text = gitSings["add"], numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		change = { hl = "GitSignsChange", text = gitSings["change"], numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		delete = { hl = "GitSignsDelete", text = gitSings["delete"], numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		topdelete = { hl = "GitSignsDelete", text = gitSings["topdelete"], numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		changedelete = { hl = "GitSignsChange", text = gitSings["changedelete"], numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
	},
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 100,
		ignore_whitespace = false,
	},
	current_line_blame_formatter_opts = {
		relative_time = false,
	},
	preview_config = {
		border = "rounded",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
})
