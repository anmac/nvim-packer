return {
	Lua = {
		runtime = {
			version = "LuaJIT",
			special = {
				reload = "require",
				include = "require",
			},
		},
		diagnostics = {
			enable = true,
			globals = { "vim", "root_pattern" },
		},
		workspace = {
			-- library = vim.api.nvim_get_runtime_file("", true),
			library = {
				[vim.fn.expand("$VIMRUNTIME/lua")] = true,
				[vim.fn.stdpath("config") .. "/lua"] = true,
			},
		},
		telemetry = {
			enable = false,
		},
		format = {
			enable = false,
		},
		single_file_support = {
			enable = true,
		},
		hint = {
			enable = true,
			arrayIndex = "Disable", -- "Enable", "Auto", "Disable"
			await = true,
			paramName = "Disable", -- "All", "Literal", "Disable"
			paramType = false,
			semicolon = "Disable", -- "All", "SameLine", "Disable"
			setType = true,
		},
	},
}
