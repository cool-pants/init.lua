vim.g.mapleader = " "
vim.g.maplocalleader = ","

require("pants.options")

_G.languages = {
    "lua",
    "go",
    "gomod",
    "gowork",
    "gotmpl",
    "c",
    "cpp",
    "python",
    "sh",

    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "json",
    "html",
    "css",
    "scss",
    "sass",
}

vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
		require("pants.keymaps")
        require("pants.autocommands")
    end,
})

-- Loading shada is SLOW, so we're going to load it manually,
-- after UI-enter so it doesn't block startup.
local shada = vim.o.shada
vim.o.shada = ""
vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
        vim.o.shada = shada
        pcall(vim.cmd.rshada, { bang = true })
    end,
})

require("core.pack"):boot_strap()

vim.cmd("colorscheme catppuccin-macchiato")
