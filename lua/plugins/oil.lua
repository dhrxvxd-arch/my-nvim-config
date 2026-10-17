
return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			view_options = {
				show_hidden = true,
			},
			skip_confirm_for_simple_edits = true,
			delete_to_trash = false,
			prompt_save_on_select_new_entry = false,
			use_default_keymaps = true,
		})
	end,
}

