local opt = vim.opt

opt.tabstop = 4

-- Enable mouse mode, can be useful for resizing splits for example!
opt.mouse = "a"
opt.mousemoveevent = true

-- Sidebar fun
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.spelloptions = "camel"

-- Sets how neowill display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣", extends = "→", precedes = "←" }

-- Preview substitutions live, as you type!
opt.inccommand = "split"

-- ui options
opt.termguicolors = true
opt.hlsearch = true
opt.listchars = "tab:» ,nbsp:+,trail:·,extends:→,precedes:←,"
opt.pumblend = 10
opt.winblend = 0

-- commandline options
opt.history = 1000
opt.timeout = true
opt.ttimeout = true
opt.timeoutlen = 500
opt.ttimeoutlen = 10
opt.updatetime = 100
opt.redrawtime = 1500

-- Search options
opt.ignorecase = true
opt.smartcase = true
opt.infercase = true

opt.completeopt = "menu,menuone,noinsert"
opt.showmode = false
opt.shortmess = "aoOTIcF"
opt.scrolloff = 2
opt.sidescrolloff = 5
opt.ruler = true
opt.showtabline = 0
opt.winwidth = 30
opt.pumheight = 15

-- cursorline
opt.cursorline = true

-- undo history
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- text options
opt.wrap = false

-- new buffer options
opt.splitright = true
opt.splitbelow = true

-- scrolloff
opt.scrolloff = 10
opt.sidescrolloff = 5

-- Some clipboard shenanigans for macos
if vim.uv.os_uname().sysname == "Darwin" then
	vim.g.clipboard = {
		name = "macOS-clipboard",
		copy = {
			["+"] = "pbcopy",
			["*"] = "pbcopy",
		},
		paste = {
			["+"] = "pbpaste",
			["*"] = "pbpaste",
		},
		cache_enabled = 0,
	}
end
