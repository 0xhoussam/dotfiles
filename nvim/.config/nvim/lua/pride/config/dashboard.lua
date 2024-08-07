local ascii = require("ascii")

require("dashboard").setup({
	theme = "hyper",
	config = {
		header = ascii.get_random_global(),
		week_header = {
			enable = true,
		},
		shortcut = {
			{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
			{
				icon = " ",
				icon_hl = "@variable",
				desc = "Directories",
				group = "Label",
				action = "Telescope file_browser",
				key = "f",
			},
			{
				desc = " Projects",
				group = "DiagnosticHint",
				action = "Telescope file_browser path=/home/$USER/projects",
				key = "a",
			},
			{
				desc = " Dotfiles",
				group = "Number",
				action = "Telescope file_browser path=/home/$USER/dotfiles",
				key = "d",
			},
		},
	},
})
