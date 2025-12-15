-- =========================================
-- Minimal Neovim Configuration
-- Optimized for Go, Python, C++, React/TS
-- =========================================

-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Load configuration modules
require("options")
require("keymaps")

-- Setup plugins with lazy.nvim
require("lazy").setup("plugins", {
    change_detection = { notify = false },
    performance = {
        cache = { enabled = true },
        rtp = {
            disabled_plugins = {
                "gzip", "matchit", "matchparen", "netrwPlugin",
                "tarPlugin", "tohtml", "tutor", "zipPlugin",
            },
        },
    },
})

-- Load LSP configuration after plugins
vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
        require("lsp")
    end,
})

-- Set colorscheme
vim.cmd.colorscheme("catppuccin-macchiato")