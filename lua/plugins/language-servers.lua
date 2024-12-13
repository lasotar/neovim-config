local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.clangd.setup({
    capabilities = capabilities,
    cmd = {
        "clangd",
        "--header-insertion=never",
        "--background-index",
        "--clang-tidy", -- Enables clang-tidy checks
        "--suggest-missing-includes", -- Suggest includes,
      },
    on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }

        -- Diagnostics keymaps
        vim.keymap.set('n', '<Leader>d', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)


        -- Format on save
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ async = false }) -- Format synchronously before saving
            end,
        })
    end,
})

-- Lua language server setup (For config development)
lspconfig.lua_ls.setup({
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT', -- Adjust if you use another Lua version
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                globals = { 'vim' }, -- Recognize `vim` as a global to avoid warnings
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false, -- Avoid prompts for third-party libraries
            },
            telemetry = {
                enable = false, -- Disable telemetry for privacy
            },
        },
    },
    on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }

        -- Diagnostics keymaps
        vim.keymap.set('n', '<Leader>ld', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '[l', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']l', vim.diagnostic.goto_next, opts)
    end,
})
