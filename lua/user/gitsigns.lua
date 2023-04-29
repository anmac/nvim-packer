local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
	return
end

local i = require("user.icons").git.signs.vscode;

gitsigns.setup({
	signs = {
		add = { hl = "GitSignsAdd", text = i.Add, numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		change = { hl = "GitSignsChange", text = i.Change, numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		delete = { hl = "GitSignsDelete", text = i.Delete, numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		topdelete = { hl = "GitSignsDelete", text = i.Topdelete, numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		changedelete = { hl = "GitSignsChange", text = i.Changedelete, numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    untracked = { hl = "GitSignsAdd", text = i.Untracked, numhl= "GitSignsAddNr", linehl= "GitSignsAddLn" },
	},
  current_line_blame = true,
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 100,
		ignore_whitespace = false,
	},
  current_line_blame_formatter = " <author>, <author_time:%R> - <summary>",
	preview_config = {
		border = "rounded",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
})
