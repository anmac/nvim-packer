-- https://github.com/microsoft/vscode/blob/main/src/vs/base/common/codicons.ts
-- go to the above and then enter <c-v>u<unicode> and the symbold should appear
-- or go here and upload the font file: https://mathew-kurian.github.io/CharacterMap/
-- find more here: https://www.nerdfonts.com/cheat-sheet

-- vim.g.use_nerd_icons = false
-- vim.fn.has("mac") == 1 or vim.g.use_nerd_icons then

return {
	kind_icons = {
		Array = " ",
		Boolean = "◩ ",
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
		Key = " ",
		Keyword = " ",
		Method = " ", -- m
		Module = " ", -- 
		Namespace = " ",
		Null = "ﳠ ",
		Number = " ",
		Object = " ",
		Operator = " ",
		Package = " ",
		Property = " ",
		Reference = " ",
		Snippet = " ", -- 
		String = " ",
		Struct = " ",
		Text = " ",
		TypeParameter = " ", -- 
		Unit = " ",
		Value = " ",
		Variable = " ", -- 
	},
	vscode_icons = {
		Array = " ",
		Boolean = "◩ ",
		Class = " ",
		Color = " ",
		Constant = " ",
		Constructor = " ",
		Enum = " ",
		EnumMember = " ",
		Event = " ",
		Field = " ",
		File = " ",
		Folder = " ",
		Function = " ",
		Interface = " ",
		Key = " ",
		Keyword = " ",
		Method = " ",
		Module = " ",
		Namespace = " ",
		Null = "ﳠ ",
		Number = " ",
		Object = " ",
		Operator = " ",
		Package = " ",
		Property = " ",
		Reference = " ",
		Snippet = " ",
		String = " ",
		Struct = " ",
		Text = " ",
		TypeParameter = " ",
		Unit = " ",
		Value = " ",
		Variable = " ",
	},
	type = {
		Array = " ",
		Number = " ",
		String = " ",
		Boolean = "蘒",
		Object = " ",
	},
	documents = {
		File = " ",
		Files = " ",
		Folder = " ",
		OpenFolder = " ",
	},
	git = {
		signs = {
			kind = {
				Add = "", -- ▎
				Change = "", -- ▎┃
				Delete = "", -- 契 
				Topdelete = "", --  
				Changedelete = "契", -- ▎ 
        Untracked = "┆",
			},
			vscode = {
				Add = "┃", -- │
				Change = "┃",
				Delete = "",
				Topdelete = "",
				Changedelete = "",
        Untracked = "┃",
			},
		},
		status = {
			Add = " ",
			Mod = " ",
			Remove = " ",
			Ignore = " ",
			Rename = " ",
			Diff = " ",
			Repo = " ",
			Octoface = " ",
			Branch = "",
			Unstaged = "",
			Staged = "S",
			Unmerged = "",
			Renamed = "➜",
			Untracked = "U",
			Deleted = "",
			Ignored = "",
		},
	},
	diagnostics = {
		Error = " ",
		Warning = " ",
		Information = " ",
		Question = " ",
		Hint = " ",
	},
	misc = {
		Robot = "ﮧ",
		Squirrel = "",
		Tag = "",
		Watch = "",
		Smiley = "ﲃ",
		Package = "",
		CircuitBoard = "",
	},
	ui_v1 = {
		ArrowClosed = "",
		ArrowOpen = "",
		Lock = " ",
		Circle = " ",
		BigCircle = " ",
		BigUnfilledCircle = " ",
		Close = " ",
		NewFile = " ",
		Search = " ",
		Lightbulb = " ",
		Project = " ",
		Dashboard = " ",
		History = " ",
		Comment = " ",
		Bug = " ",
		Code = " ",
		Telescope = " ",
		Gear = " ",
		Package = " ",
		List = " ",
		SignIn = " ",
		SignOut = " ",
		NoteBook = " ",
		Check = " ",
		Fire = " ",
		Note = " ",
		BookMark = " ",
		Pencil = " ",
		ChevronRight = "",
		Table = " ",
		Calendar = " ",
		CloudDownload = " ",
		Separator = "│",
	},
	ui_v2 = {
		ArrowClosed = "",
		ArrowOpen = "",
		Lock = "",
		Circle = "",
		BigCircle = "",
		BigUnfilledCircle = "",
		Close = "",
		NewFile = "",
		Search = "",
		Lightbulb = "",
		Project = "",
		Dashboard = "",
		History = "",
		Comment = "",
		Bug = "",
		Code = "",
		Telescope = "",
		Gear = "",
		Package = "",
		List = "",
		SignIn = "",
		SignOut = "",
		Check = "",
		Fire = "",
		Note = "",
		BookMark = "",
		Pencil = "",
		ChevronRight = ">",
		Table = "",
		Calendar = "",
		CloudDownload = "",
		Separator = "│",
	},
	listchars = {
		EnOfLine = "↲",
		Tab = "··",
		Space = " ",
		MultiSpace = " ",
		LeadSpace = "·",
		MultiLeadSpace = "·",
		Trail = "·",
		Nbsp = "☠",
	},
	fillchars = {
		EndOfBlock = " ",
		FoldOpen = "",
		FoldSep = " ",
		FoldClose = "",
	},
	bullets = {
		Circle01 = "",
		Circle02 = "",
		Bullet01 = "●",
		Bullet02 = "",
		Bullet03 = "•",
		Bullet04 = "∙",
		Bullet05 = "⋅",
	},
}
