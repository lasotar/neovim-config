local M = {}

M.setup = function()
    require('nvim-treesitter.configs').setup({
        ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = { 'ruby' },
        },
        indent = {
            enable = true,
            disable = { 'ruby' },
        },

        modules = {},
        sync_install = true,
        ignore_install = {},
    })
end

return M
