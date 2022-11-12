-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- vim.g.minimap_width = 10
-- vim.g.minimap_auto_start = 1
-- vim.g.minimap_auto_start_win_enter = 1
require("larsson.plugins-setup")
require("larsson.core.options")
require("larsson.core.keymaps")
require("larsson.core.colorscheme")
require("larsson.plugins.comment")
require("larsson.plugins.nvim-tree")
require("larsson.plugins.lualine")
require("larsson.plugins.telescope")
require("larsson.plugins.nvim-cmp")
require("larsson.plugins.lsp.mason")
require("larsson.plugins.lsp.lspsaga")
require("larsson.plugins.lsp.lspconfig")
require("larsson.plugins.lsp.null-ls")
require("larsson.plugins.autopairs")
require("larsson.plugins.treesitter")
require("larsson.plugins.gitsigns")
