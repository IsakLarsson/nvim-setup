local alpha = require("alpha")
local headers = require("larsson.plugins.headers.headers").ascii_art
local dashboard = require("alpha.themes.dashboard")
-- {
-- 	"",
-- 	"",
-- 	"",
-- 	"",
-- 	"",
-- 	"",
-- 	"",
-- 	"     Let's get this                                             ",
-- 	"",
-- 	[[    88                                                    88  ]],
-- 	[[    88                                                    88  ]],
-- 	[[    88                                                    88  ]],
-- 	[[    88,dPPYba,  8b,dPPYba,  ,adPPYba, ,adPPYYba,  ,adPPYb,88  ]],
-- 	[[    88P'    "8a 88P'   "Y8 a8P_____88 ""     `Y8 a8"    `Y88  ]],
-- 	[[    88       d8 88         8PP""""""" ,adPPPPP88 8b       88  ]],
-- 	[[    88b,   ,a8" 88         "8b,   ,aa 88,    ,88 "8a,   ,d88  ]],
-- 	[[    8Y"Ybbd8"'  88          `"Ybbd8"' `"8bbdP"Y8  `"8bbdP"Y8  ]],
-- 	"",
-- 	"",
-- 	"",
-- 	"",
-- }
-- Set header
dashboard.section.header.val = headers[math.random(1, #headers)]

--Set footer
local num_plugins_loaded = #vim.fn.globpath(vim.fn.stdpath("data") .. "/site/pack/packer/start", "*", 0, 1)
dashboard.section.footer.val = { num_plugins_loaded .. " plugins ﮣ loaded" }
dashboard.section.footer.opts.hl = "Comment"

-- Padding
local head_butt_padding = 4
local occu_height = #dashboard.section.header.val + 2 * #dashboard.section.buttons.val + head_butt_padding
local header_padding = math.max(0, math.ceil((vim.fn.winheight("$") - occu_height) * 0.25))
local foot_butt_padding_ub = vim.o.lines - header_padding - occu_height - #dashboard.section.footer.val - 3
local foot_butt_padding = math.floor((vim.fn.winheight("$") - 2 * header_padding - occu_height))
foot_butt_padding = math.max(
	0,
	math.max(math.min(0, foot_butt_padding), math.min(math.max(0, foot_butt_padding), foot_butt_padding_ub))
)

-- Set menu
dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("r", "  Recent", ":Telescope oldfiles<CR>"),
	dashboard.button("s", "  Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
	dashboard.button("q", "  Quit", ":qa<CR>"),
}

dashboard.config.layout = {
	{ type = "padding", val = header_padding },
	dashboard.section.header,

	{ type = "padding", val = head_butt_padding },
	dashboard.section.buttons,
	{ type = "padding", val = foot_butt_padding },
	dashboard.section.footer,
}
-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
