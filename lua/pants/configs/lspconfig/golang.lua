local lspconfig = require("lspconfig")
local utils = require("pants.configs.lspconfig.utils")
local root_pattern = require("lspconfig.util").root_pattern

lspconfig.gopls.setup({
    cmd = { "gopls", "serve" },
    on_attach = utils._attach,
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = root_pattern({ "go.mod", "go.sum" }),
    capabilities = utils.capabilities,
    single_file_support = true,
    settings = {
        gopls = {
            gofumpt = true,
            codelenses = {
                gc_details = false,
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
            },
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
            analyses = {
                fieldalignment = true,
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
            },
            usePlaceholders = true,
            completeUnimported = true,
            staticcheck = true,
            directoryFilters = {
                "-.git",
                "-.vscode",
                "-.idea",
                "-.vscode-test",
                "-node_modules",
            },
            semanticTokens = true,
        },
    },
})
