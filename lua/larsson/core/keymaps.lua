vim.g.mapleader = " "

local keymap = vim.keymap

---------------------
-- General Keymaps
---------------------
keymap.set("n", "<leader>w", "<C-w>w")
keymap.set("n", "<leader>sw", ":w<CR>")

keymap.set("i", "jkl", "() => {}<ESC>i") --stupid but fast as shit arrow functions
keymap.set("i", "sdf", "={}<ESC>i") --stupid but fast as shit = brackets while in insert
keymap.set("i", "<C-j>", "{}<ESC>i")
keymap.set("i", "<C-l>", "}")
keymap.set("i", "<C-d>", "[]<ESC>i")
keymap.set("i", "<C-f>", "]")

keymap.set("n", "<leader>vs", ":so $MYVIMRC<cr>")
keymap.set("n", "<leader>a;", "myA;<esc>`y")
keymap.set("n", "<leader>a,", "myA,<esc>`y")
keymap.set("n", "Ä", ",")
keymap.set("n", "ä", ";")
keymap.set("n", "U", "<C-r>") --Redo
keymap.set("n", "Q", "@q") -- Quickly execute q macro
keymap.set("n", "<leader>t", "%") -- Go to matching tag,bracket, whatever

keymap.set("n", "<C-d>", "<C-d>zz") --Keep code centered when scrolling with ctrl d and u
keymap.set("n", "<C-u>", "<C-u>zz")

keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- Moving code up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")

keymap.set("v", "Y", "myY`y")
keymap.set("v", "y", "myy`y")

keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
-- keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
-- keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
-- keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ch", "<cmd>Telescope command_history<cr>") -- List command history
keymap.set("n", "<leader>ft", "<cmd>Telescope treesitter<cr>") -- find function names, variables from treesitter
keymap.set("n", "<leader>reg", "<cmd>Telescope registers<cr>") -- find entries in register and paste with <cr>
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find theme=cursor layout_config={width=0.8}<cr>") -- fuzzy find in current buffer
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>fu", "<cmd>Telescope undo<cr>") -- View undotree in telescope

-- telescope git commands
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary
