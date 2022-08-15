local status_ok, nvim_web_devicons = pcall(require, "nvim-web-devicons")
if not status_ok then
	return
end

nvim_web_devicons.set_icon({
	sh = {
		icon = "",
		color = "#99C69C",
		cterm_color = "59",
		name = "Sh",
	},
	py = {
		icon = "",
		color = "#83D0F3",
		cterm_color = "59",
		name = "Python",
	},
	[".gitattributes"] = {
		icon = "",
		color = "#e24329",
		cterm_color = "59",
		name = "GitAttributes",
	},
	[".gitconfig"] = {
		icon = "",
		color = "#e24329",
		cterm_color = "59",
		name = "GitConfig",
	},
	[".gitignore"] = {
		icon = "",
		color = "#e24329",
		cterm_color = "59",
		name = "GitIgnore",
	},
	[".gitlab-ci.yml"] = {
		icon = "",
		color = "#e24329",
		cterm_color = "166",
		name = "GitlabCI",
	},
	[".gitmodules"] = {
		icon = "",
		color = "#e24329",
		cterm_color = "59",
		name = "GitModules",
	},
	["diff"] = {
		icon = "",
		color = "#e24329",
		cterm_color = "59",
		name = "Diff",
	},
	["Dockerfile"] = {
		icon = "",
		color = "#6dc8f2",
		cterm_color = "59",
		name = "Dockerfile",
	},
})
