local api, opt, g = vim.api, vim.opt, vim.g
g.have_nerd_font = true
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Enable mouse mode, can be useful for resizing splits for example!
opt.mouse = "a"
opt.mousemoveevent = true

-- Sets how neowill display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
opt.inccommand = "split"

opt.termguicolors = true
opt.hlsearch = true

-- fold options
opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}
opt.foldlevel = 99

if vim.fn.has("nvim-0.10") == 1 then
	opt.smoothscroll = true
	opt.foldexpr = "nvim_treesitter#foldexpr()"
	opt.foldmethod = "expr"
	opt.foldtext = ""
else
	opt.foldmethod = "indent"
	opt.foldtext = "v:lua.require'lazyvim.util'.ui.foldtext()"
end

opt.virtualedit = "block"
opt.wildignorecase = true
opt.swapfile = false
opt.breakindent = true

opt.history = 1000
opt.timeout = true
opt.ttimeout = true
opt.timeoutlen = 500
opt.ttimeoutlen = 10
opt.updatetime = 100
opt.redrawtime = 1500
opt.ignorecase = true
opt.smartcase = true
opt.infercase = true
opt.cursorline = true

opt.completeopt = "menu,menuone,noinsert"
opt.showmode = false
opt.shortmess = "aoOTIcF"
opt.scrolloff = 2
opt.sidescrolloff = 5
opt.ruler = true
opt.showtabline = 0
opt.winwidth = 30
opt.pumheight = 15
opt.showcmd = false

opt.cmdheight = 0
opt.laststatus = 3
opt.list = true

--eol:¬
opt.listchars = "tab:» ,nbsp:+,trail:·,extends:→,precedes:←,"
opt.pumblend = 10
opt.winblend = 0
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

opt.smarttab = true
opt.expandtab = true
opt.autoindent = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

opt.foldlevelstart = 99
opt.foldmethod = "marker"

opt.splitright = true
opt.splitbelow = true
opt.wrap = false

opt.number = true
opt.relativenumber = true
opt.nu = true
opt.signcolumn = "yes"
opt.spelloptions = "camel"

opt.textwidth = 80
opt.colorcolumn = "+0"

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
