-- =========================================
-- Neovim Options Configuration
-- Cross-platform compatible settings
-- =========================================

local opt = vim.opt

-- UI Settings
opt.number = true                 -- Show line numbers
opt.relativenumber = true         -- Show relative line numbers
opt.signcolumn = "yes"           -- Always show sign column
opt.cursorline = true            -- Highlight current line
opt.termguicolors = true         -- Enable true color support
opt.showmode = false             -- Don't show mode in cmdline (statusline shows it)
opt.pumheight = 15               -- Popup menu height
opt.scrolloff = 8                -- Keep 8 lines above/below cursor
opt.sidescrolloff = 8            -- Keep 8 characters left/right of cursor

-- Indentation
opt.tabstop = 4                  -- Tab width
opt.shiftwidth = 4               -- Indent width
opt.expandtab = true             -- Use spaces instead of tabs
opt.smartindent = true           -- Smart autoindenting
opt.breakindent = true           -- Wrap lines with indent

-- Search
opt.ignorecase = true            -- Ignore case in search
opt.smartcase = true             -- Case sensitive if uppercase present
opt.hlsearch = true              -- Highlight search matches
opt.inccommand = "split"         -- Preview substitutions

-- Splits
opt.splitright = true            -- Open vertical splits to the right
opt.splitbelow = true            -- Open horizontal splits below

-- Files & Backups
opt.undofile = true              -- Enable persistent undo
opt.swapfile = false             -- Disable swap files
opt.backup = false               -- Disable backup files
opt.writebackup = false          -- Disable backup before overwrite

-- Performance
opt.updatetime = 250             -- Faster completion
opt.timeoutlen = 500             -- Timeout for mapped sequences
opt.lazyredraw = false           -- Don't redraw during macros

-- Mouse & Clipboard
opt.mouse = "a"                  -- Enable mouse support
opt.mousemoveevent = true        -- Enable mouse move events

-- Cross-platform clipboard setup
if vim.fn.has('wsl') == 1 then
    -- WSL clipboard
    vim.g.clipboard = {
        name = 'WslClipboard',
        copy = {
            ['+'] = 'clip.exe',
            ['*'] = 'clip.exe',
        },
        paste = {
            ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        },
        cache_enabled = 0,
    }
elseif vim.fn.has('macunix') == 1 then
    -- macOS clipboard
    vim.g.clipboard = {
        name = 'macOS-clipboard',
        copy = {
            ['+'] = 'pbcopy',
            ['*'] = 'pbcopy',
        },
        paste = {
            ['+'] = 'pbpaste',
            ['*'] = 'pbpaste',
        },
        cache_enabled = 0,
    }
end

-- Completion
opt.completeopt = { "menu", "menuone", "noinsert" }
opt.shortmess:append("c")        -- Don't show completion messages

-- Whitespace visualization
opt.list = true
opt.listchars = {
    tab = "→ ",
    trail = "·",
    nbsp = "␣",
    extends = "▸",
    precedes = "◂",
}

-- Folding (using Treesitter when available)
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99               -- Start with all folds open