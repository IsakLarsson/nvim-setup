-- vim.g.ayucolor = "mirage"
vim.g.nightflyCursorColor = true
vim.g.nightflyWinSeparator = 2

vim.o.background = "dark"
-- local status, _ = pcall(vim.cmd, "colorscheme tokyonight")
-- if not status then
-- 	print("Colorscheme is not found!")
-- 	return
-- end
-- vim.cmd("colorscheme tokyonight-night")
-- vim.cmd([[colorscheme nighfly]])
require("gruvbox").setup({

	palette_overrides = {
		dark0 = "#1d2021",
	},
})
vim.cmd([[colorscheme gruvbox]])
