
return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			[[                           ]],
			[[  ██╗   ██╗██╗███╗   ███╗  ]],
			[[  ██║   ██║██║████╗ ████║  ]],
			[[  ██║   ██║██║██╔████╔██║  ]],
			[[  ╚██╗ ██╔╝██║██║╚██╔╝██║  ]],
			[[   ╚████╔╝ ██║██║ ╚═╝ ██║  ]],
			[[    ╚═══╝  ╚═╝╚═╝     ╚═╝  ]],
			[[                           ]],
			[[          DHRXV XD         ]],
			[[                           ]],
		}

		dashboard.section.buttons.val = {
			dashboard.button("f", "󰈞  Find file", ":Telescope find_files<CR>"),
			dashboard.button("r", "  Recent", ":Telescope oldfiles<CR>"),
      dashboard.button("p", "  Open Project", ":OpenProject<CR>"),
			dashboard.button("c", "  Open Config", ":Neotree dir=~/.config/nvim/<CR>"),
			dashboard.button("q", "󰅚  Quit", ":qa<CR>"),
		}

		dashboard.section.footer.val = "i use arch btw"

		alpha.setup(dashboard.opts)
	end,
}

