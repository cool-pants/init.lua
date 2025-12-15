-- =========================================
-- LSP Configuration
-- Optimized for Go, Python, C++, React/TS
-- =========================================

local lspconfig = require("lspconfig")

-- =========================================
-- LSP Keymaps (Buffer Local)
-- =========================================

local function on_attach(client, bufnr)
    local opts = { buffer = bufnr, silent = true }
    local map = vim.keymap.set

    -- Navigation
    map("n", "gd", vim.lsp.buf.definition, opts)
    map("n", "gD", vim.lsp.buf.declaration, opts)
    map("n", "gi", vim.lsp.buf.implementation, opts)
    map("n", "gt", vim.lsp.buf.type_definition, opts)
    map("n", "gr", vim.lsp.buf.references, opts)

    -- Documentation
    map("n", "K", vim.lsp.buf.hover, opts)
    map("n", "<C-k>", vim.lsp.buf.signature_help, opts)

    -- Code Actions
    map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    map("v", "<leader>ca", vim.lsp.buf.code_action, opts)
    map("n", "<leader>rn", vim.lsp.buf.rename, opts)

    -- Formatting
    map("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
    end, opts)

    -- Diagnostics
    map("n", "[d", vim.diagnostic.goto_prev, opts)
    map("n", "]d", vim.diagnostic.goto_next, opts)
    map("n", "<leader>dl", vim.diagnostic.open_float, opts)
    map("n", "<leader>dq", vim.diagnostic.setloclist, opts)

    -- Workspace
    map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
    map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
    map("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)

    -- Telescope LSP integration
    local builtin = require("telescope.builtin")
    map("n", "<leader>ld", builtin.lsp_definitions, opts)
    map("n", "<leader>lr", builtin.lsp_references, opts)
    map("n", "<leader>li", builtin.lsp_implementations, opts)
    map("n", "<leader>lt", builtin.lsp_type_definitions, opts)
    map("n", "<leader>ls", builtin.lsp_document_symbols, opts)
    map("n", "<leader>lw", builtin.lsp_workspace_symbols, opts)
end

-- =========================================
-- Capabilities
-- =========================================

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- =========================================
-- Diagnostic Configuration
-- =========================================

vim.diagnostic.config({
    virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "●",
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})

-- =========================================
-- LSP Server Configurations
-- =========================================

-- Go
lspconfig.gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    settings = {
        gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
        },
    },
})


-- Python
lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
                typeCheckingMode = "basic",
            },
        },
    },
})

-- Python (Ruff for linting)
lspconfig.ruff_lsp.setup({
    on_attach = function(client, bufnr)
        -- Disable hover in favor of Pyright
        client.server_capabilities.hoverProvider = false
        on_attach(client, bufnr)
    end,
    capabilities = capabilities,
})

-- C/C++
lspconfig.clangd.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
        "--function-arg-placeholders",
        "--fallback-style=llvm",
    },
    init_options = {
        usePlaceholders = true,
        completeUnimported = true,
        clangdFileStatus = true,
    },
})

-- TypeScript/JavaScript
lspconfig.typescript_language_server.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {
        preferences = {
            disableSuggestions = true,
        },
    },
})

-- ESLint
lspconfig.eslint.setup({
    on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
        })
        on_attach(client, bufnr)
    end,
    capabilities = capabilities,
})

-- Lua
lspconfig.lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

-- JSON
lspconfig.jsonls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        json = {
            validate = { enable = true },
        },
    },
})

-- HTML
lspconfig.html.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- CSS
lspconfig.css_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- =========================================
-- Auto Commands
-- =========================================

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Ensure JSX files are properly detected
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = "*.jsx",
    callback = function()
        vim.bo.filetype = "javascriptreact"
    end,
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = "*.tsx",
    callback = function()
        vim.bo.filetype = "typescriptreact"
    end,
})

-- Format on save for specific filetypes
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.go", "*.py", "*.cpp", "*.c", "*.h", "*.hpp", "*.js", "*.ts", "*.jsx", "*.tsx" },
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})

-- =========================================
-- Language-Specific Settings
-- =========================================

-- Go
vim.api.nvim_create_autocmd("FileType", {
    pattern = "go",
    callback = function()
        vim.opt_local.expandtab = false
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
    end,
})

-- Python
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.opt_local.expandtab = true
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
    end,
})

-- JavaScript/TypeScript/React
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
    callback = function()
        vim.opt_local.expandtab = true
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
    end,
})

-- C/C++
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp" },
    callback = function()
        vim.opt_local.expandtab = true
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
    end,
})
