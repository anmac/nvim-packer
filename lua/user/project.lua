local status_ok, project = pcall(require, "project_nvim")
if not status_ok then
	return
end
project.setup({
	active = true,
	on_config_done = nil,
	detection_methods = { "lsp", "pattern" },
	patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "build/env.sh" },
  show_hidden = true,
	exclude_dirs = { "~/.dotfiles/*", "~/.cargo/*" },
})

local tele_status_ok, telescope = pcall(require, "telescope")
if not tele_status_ok then
	return
end

telescope.load_extension("projects")
