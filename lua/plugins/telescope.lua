local telescope = require('telescope')

telescope.setup({
    defaults = {
        -- Default configuration for Telescope
        mappings = {
            i = {
                ["<C-u>"] = false, -- Disable <C-u> in insert mode
                ["<C-d>"] = false, -- Disable <C-d> in insert mode
            },
        },
    },
    pickers = {
        -- Default configuration for builtin pickers
    },
    extensions = {
        -- Your extensions configuration
    },
})

