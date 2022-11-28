-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("larsson.plugins-setup")
require("larsson.core.options")
require("larsson.core.keymaps")
require("larsson.core.colorscheme")
require("larsson.plugins.comment")
require("larsson.plugins.nvim-tree")
require("larsson.plugins.lualine")
require("larsson.plugins.barbar")
require("larsson.plugins.telescope")
require("larsson.plugins.nvim-cmp")
require("larsson.plugins.lsp.mason")
require("larsson.plugins.lsp.lspsaga")
require("larsson.plugins.lsp.lspconfig")
require("larsson.plugins.lsp.null-ls")
require("larsson.plugins.autopairs")
require("larsson.plugins.treesitter")
require("larsson.plugins.dashboard-nvim")
require("larsson.plugins.gitsigns")
require("leap").add_default_mappings()
require("indent_blankline").setup({
	-- space_char_blankline = " ",
	-- show_current_context = true,
	-- show_current_context_start = true,
})
require("scrollbar").setup()
require("colorizer").setup({
	"*", -- Highlight all files, but customize some others.
	css = { rgb_fn = true }, -- Enable parsing rgb(...) functions in css.
})
