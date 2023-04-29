local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- https://github.com/prettier-solidity/prettier-plugin-solidity
-- npm install --save-dev prettier prettier-plugin-solidity
null_ls.setup({
	debug = false,
	sources = {
		-- formatting.prettier,
		formatting.prettierd.with({
			extra_filetypes = { "toml", "solidity" },
			-- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
		}),
		diagnostics.eslint,
		formatting.black.with({ extra_args = { "--fast" } }), -- python
		diagnostics.flake8, -- python
		formatting.stylua, -- lua
		formatting.google_java_format, --java
		formatting.shfmt, -- bash
		diagnostics.shellcheck, -- bash
		-- formatting.phpcbf, -- php
		formatting.phpcsfixer, -- php
		-- diagnostics.phpcs --php
		-- formatting.tidy.with({ filetypes = { "xml" }, args = { "--tidy-mark", "-indent" } }),
		formatting.xmllint
	},
})
