local db = require("dashboard")
local api = vim.api
local keymap = vim.keymap
local home = os.getenv("HOME")

-- db.custom_header = {
--
-- 	" /$$$$$$$  /$$                                     /$$       /$$ /$$ /$$ /$$                    ",
-- 	"| $$__  $$|__/                                    | $$      |__/| $$| $$|__/                    ",
-- 	"| $$  \\ $$ /$$ /$$$$$$$   /$$$$$$         /$$$$$$$| $$$$$$$  /$$| $$| $$ /$$ /$$$$$$$   /$$$$$$ ",
-- 	"| $$$$$$$ | $$| $$__  $$ /$$__  $$       /$$_____/| $$__  $$| $$| $$| $$| $$| $$__  $$ /$$__  $$",
-- 	"| $$__  $$| $$| $$  \\ $$| $$  \\ $$      | $$      | $$  \\ $$| $$| $$| $$| $$| $$  \\ $$| $$  \\ $$",
-- 	"| $$  \\ $$| $$| $$  | $$| $$  | $$      | $$      | $$  | $$| $$| $$| $$| $$| $$  | $$| $$  | $$",
-- 	"| $$$$$$$/| $$| $$  | $$|  $$$$$$$      |  $$$$$$$| $$  | $$| $$| $$| $$| $$| $$  | $$|  $$$$$$$",
-- 	"|_______/ |__/|__/  |__/ \\ ____  $$       \\ _______/|__/  |__/|__/|__/|__/|__/|__/  |__/ \\ ____",
-- 	"                           /$$  \\ $$                                                     /$$  \\ $$",
-- 	"                           |  $$$$$$/                                                    |  $$$$$$/",
-- 	"                           \\ ______/                                                      \\ ______/ ",
-- 	"                                                                                                  ",
-- 	"                                                                                                  ",
-- 	"                                                                                                  ",
-- 	"                                                                                                  ",
-- 	"                                                                                                  ",
-- 	"                                                                                                  ",
-- 	"                                                                                                  ",
-- 	"                                                                                                  ",
-- 	"                                                                                                  ",
-- 	"                                                                                                  ",
-- 	"                                                                                                  ",
-- }
-- db.custom_header = {
-- 	"                                                       ",
-- 	"                                                       ",
-- 	"                                                       ",
-- 	"                     __---__                           ",
-- 	"                    -       _--______                  ",
-- 	"               _--( /     / )XXXXXXXXXXXXX_            ",
-- 	"             --XXX(   O   O  )XXXXXXXXXXXXXXX-         ",
-- 	"            /XXX(       U     )        XXXXXXX/        ",
-- 	"          /XXXXX(              )--_  XXXXXXXXXXX/      ",
-- 	"         /XXXXX/ (      O     )   XXXXXX   /XXXXX/     ",
-- 	"         XXXXX/   /            XXXXXX   /__ /XXXXX---- ",
-- 	"         XXXXXX__/          XXXXXX         /__----  -  ",
-- 	" ---___  XXX__/          XXXXXX      /__         ---   ",
-- 	"   --  --__/   ___//  XXXXXX            /  ___---=     ",
-- 	"     -_    ___/    XXXXXX              |--- XXXXXX     ",
-- 	"       --//XXX/ XXXXXX                      /XXXXX     ",
-- 	"         /XXXXXXXXX                        /XXXXX/     ",
-- 	"          /XXXXXX                        _/XXXXX/      ",
-- 	"            /XXXXX--__/              __-- XXXX/        ",
-- 	"             --XXXXXXX---------------  XXXXX--         ",
-- 	"                /XXXXXXXXXXXXXXXXXXXXXXXX-             ",
-- 	"                  --XXXXXXXXXXXXXXXXXX-                ",
-- 	"                                                       ",
-- 	"                                                       ",
-- 	"                                                       ",
-- }
db.custom_header = {
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"     Let's get this                                             ",
	"",
	[[    88                                                    88  ]],
	[[    88                                                    88  ]],
	[[    88                                                    88  ]],
	[[    88,dPPYba,  8b,dPPYba,  ,adPPYba, ,adPPYYba,  ,adPPYb,88  ]],
	[[    88P'    "8a 88P'   "Y8 a8P_____88 ""     `Y8 a8"    `Y88  ]],
	[[    88       d8 88         8PP""""""" ,adPPPPP88 8b       88  ]],
	[[    88b,   ,a8" 88         "8b,   ,aa 88,    ,88 "8a,   ,d88  ]],
	[[    8Y"Ybbd8"'  88          `"Ybbd8"' `"8bbdP"Y8  `"8bbdP"Y8  ]],
	"",
	"",
	"",
	"",
}
db.custom_center = {
	{
		icon = "  ",
		desc = "Find  File                              ",
		action = "Telescope find_files",
		shortcut = "<Leader> f f",
	},
	{
		icon = "  ",
		desc = "Project grep                            ",
		action = "Telescope live_grep",
		shortcut = "<Leader> f s",
	},
	--[[ {
		icon = "  ",
		desc = "Open Nvim config                        ",
		action = "Telescope" .. home .. "| tcd %:p:h",
		shortcut = "<Leader> c v",
	}, ]]
	{
		icon = "  ",
		desc = "New file                                ",
		action = "enew",
		shortcut = "e           ",
	},
	{
		icon = "  ",
		desc = "Quit Nvim                               ",
		action = "qa",
		shortcut = "q           ",
	},
}
api.nvim_create_autocmd("FileType", {
	pattern = "dashboard",
	group = api.nvim_create_augroup("dashboard_enter", { clear = true }),
	callback = function()
		keymap.set("n", "q", ":qa<CR>", { buffer = true, silent = true })
		keymap.set("n", "e", ":enew<CR>", { buffer = true, silent = true })
	end,
})
