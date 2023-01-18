local keymap = vim.keymap

keymap.set("n", "<leader>hm", '<cmd>lua require("harpoon.mark").add_file()<cr>')
keymap.set("n", "<leader>hv", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>')
keymap.set("n", "<leader><leader>s", '<cmd>lua require("harpoon.ui").nav_file(1)<cr>')
keymap.set("n", "<leader><leader>d", '<cmd>lua require("harpoon.ui").nav_file(2)<cr>')
keymap.set("n", "<leader><leader>f", '<cmd>lua require("harpoon.ui").nav_file(3)<cr>')
