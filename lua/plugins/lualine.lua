require('lualine').setup({
    options = {
        icons_enabled = true, -- Enable icons
        theme = 'auto',        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = { 'mode' }, -- Displays current mode (e.g., NORMAL, INSERT)
        lualine_b = { 'branch', 'diff', 'diagnostics' }, -- Git branch, diffs, diagnostics
        lualine_c = {
            { 'filename', path = 1 }, -- Show filename with path (0 = name only, 1 = relative, 2 = absolute)
        },
        lualine_x = { 'encoding', 'fileformat', 'filetype' }, -- Encoding, file format, and file type
        lualine_y = { 'progress' }, -- Progress in the file (percentage)
        lualine_z = { 'location' }, -- Line and column number
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
})
