-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

--  empty setup using defaults
-- require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		adaptive_size = true,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
	},
	renderer = {
		group_empty = true,
	},
	update_focused_file = {
		enable = true,
	},
	filters = {
		-- custom = { "^\\.git" },
		dotfiles = false,
	},
})
