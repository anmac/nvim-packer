-- https://github.com/microsoft/vscode/blob/main/src/vs/base/common/codicons.ts
-- go to the above and then enter <c-v>u<unicode> and the symbold should appear
-- or go here and upload the font file: https://mathew-kurian.github.io/CharacterMap/
-- find more here: https://www.nerdfonts.com/cheat-sheet

vim.g.use_nerd_icons = false
if vim.fn.has("mac") == 1 or vim.g.use_nerd_icons then
	return {
		kind_icons = {
			Class = " ", -- 
			Color = " ", -- 
			Constant = " ", -- 
			Constructor = " ", --  
			Enum = "了 ", -- 
			EnumMember = " ",
			Event = " ",
			Field = " ", -- 
			File = " ",
			Folder = " ", -- 
			Function = " ", --  
			Interface = " ", -- ﰮ
			Keyword = " ",
			Method = " ", -- m
			Module = " ", -- 
			Operator = " ",
			Property = " ",
			Reference = " ",
			Snippet = " ", -- 
			Struct = " ",
			Text = " ",
			TypeParameter = " ", -- 
			Unit = " ",
			Value = " ",
			Variable = " ", -- 
		},
	}
else
	return {
		vscode_icons = {
			Text = "",
			Method = "",
			Function = "",
			Constructor = "",
			Field = "",
			Variable = "",
			Class = "",
			Interface = "",
			Module = "",
			Property = "",
			Unit = "",
			Value = "",
			Enum = "",
			Keyword = "",
			Snippet = "",
			Color = "",
			File = "",
			Reference = "",
			Folder = "",
			EnumMember = "",
			Constant = "",
			Struct = "",
			Event = "",
			Operator = "",
			TypeParameter = "",
		},
	}
end
