-- vim.g.ayucolor = "mirage"

local status, _ = pcall(vim.cmd, "colorscheme sonokai")
if not status then
	print("Colorscheme is not found!")
	return
end
