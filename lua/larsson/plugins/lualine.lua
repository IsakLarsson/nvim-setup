-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
	return
end

local colortheme = "gruvbox-flat"

local colors = {
	bg = "#1a1a1a",
	fg = "#bbc2cf",
	yellow = "#ECBE7B",
	cyan = "#008080",
	darkblue = "#081633",
	green = "#98be65",
	orange = "#FF8800",
	violet = "#a9a1e1",
	magenta = "#c678dd",
	blue = "#51afef",
	red = "#ec5f67",
}

local config = {
	options = {
		-- Disable sections and component separators
		component_separators = "",
		-- section_separators = "",
		theme = colortheme,
	},
	sections = {
		lualine_c = {},
	},
	extensions = { "nvim-tree", "toggleterm", "fugitive" },
}
local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

--For middle section
ins_left({
	function()
		return "%="
	end,
})
ins_left({
	-- Lsp server name .
	function()
		local msg = "No Active Lsp"
		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
	icon = " LSP:",
	color = { fg = colors.yellow, gui = "bold" },
})

lualine.setup(config)
