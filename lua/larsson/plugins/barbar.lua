local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local nvim_tree_events = require("nvim-tree.events")
local bufferline_api = require("bufferline.api")

local function get_tree_size()
	return require("nvim-tree.view").View.width
end

nvim_tree_events.subscribe("TreeOpen", function()
	bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe("Resize", function()
	bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe("TreeClose", function()
	bufferline_api.set_offset(0)
end)

require("bufferline").setup({
	auto_hide = true,
	animation = false,
})
-- Move to previous/next
-- map("n", "<C-n>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<C-n>", "<Cmd>BufferNext<CR>", opts)
-- Re-order to previous/next
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
-- Goto buffer in position...
map("n", "<Space>1", "<Cmd>BufferGoto 1<CR>", opts)
map("n", "<Space>2", "<Cmd>BufferGoto 2<CR>", opts)
map("n", "<Space>3", "<Cmd>BufferGoto 3<CR>", opts)
map("n", "<Space>4", "<Cmd>BufferGoto 4<CR>", opts)
map("n", "<Space>5", "<Cmd>BufferGoto 5<CR>", opts)
map("n", "<Space>6", "<Cmd>BufferGoto 6<CR>", opts)
map("n", "<Space>7", "<Cmd>BufferGoto 7<CR>", opts)
map("n", "<Space>8", "<Cmd>BufferGoto 8<CR>", opts)
map("n", "<Space>9", "<Cmd>BufferGoto 9<CR>", opts)
map("n", "<Space>0", "<Cmd>BufferLast<CR>", opts)
-- Pin/unpin buffer
map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
-- Close buffer
map("n", "<C-c>", "<Cmd>BufferClose<CR>", opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
map("n", "<Space>ka", "<Cmd>BufferCloseAllButCurrent<CR>", opts)
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
-- Sort automatically by...
map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used
