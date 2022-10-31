-- vim.g.ayucolor = "mirage"
vim.o.background = "dark"

local status, _ = pcall(vim.cmd, "colorscheme tokyonight")
if not status then
	print("Colorscheme is not found!")
	return
end
vim.cmd("colorscheme tokyonight-night")
