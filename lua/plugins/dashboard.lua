
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
			dashboard.button("f", "󰈞  Find File", "<cmd>Telescope find_files<CR>"),
			dashboard.button("g", "󰱼  Live Grep", "<cmd>Telescope live_grep<CR>"),
			dashboard.button("r", "  Recent Files", "<cmd>Telescope oldfiles<CR>"),
			dashboard.button("p", "  Open Project", "<cmd>OpenProject<CR>"),
			dashboard.button("c", "  Neovim Config", "<cmd>Neotree dir=~/.config/nvim/<CR>"),
			dashboard.button("l", "󰒲  Lazy.nvim", "<cmd>Lazy<CR>"),
			dashboard.button("q", "󰅚  Quit", "<cmd>qa<CR>"),
		}

		dashboard.section.footer.val = function()
			return "i use arch btw"
		end

		dashboard.config.opts.noautocmd = true

		alpha.setup(dashboard.opts)
	end,
}

