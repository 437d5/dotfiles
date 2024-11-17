return {
    "neovim/nvim-lspconfig",
    event = "BufRead",
    opts = {},

    config = function()
        local lspconfig = require("lspconfig")

        lspconfig.lua_ls.setup {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' },
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        }

        lspconfig.rust_analyzer.setup {
            settings = {
                ["rust-analyzer"] = {
                    assist = {
                        importMergeBehavior = "last", -- Поведение объединения импортов
                        importGranularity = "module", -- Гранулярность импортов
                        disableOrganizeImports = false, -- Включить/выключить организацию импортов
                    },
                    cargo = {
                        loadOutDirsFromCheck = true, -- Загружать директории из `cargo check`
                    },
                    procMacro = {
                        enable = true, -- Включить поддержку процедурных макросов
                    },
                 },
             },
        }
        lspconfig.gopls.setup {
            settings = {
                gopls = {
                    analyses = {
                        unusedparams = true,
                    },
                    staticcheck = true,
                    gofumpt = true,
                },
            },
        }
    end,
}
