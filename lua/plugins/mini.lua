local M = {}

M.setup = function()
    -- Setup `mini.ai` for advanced text objects
    require('mini.ai').setup({
        n_lines = 500, -- Increase context lines for text objects
    })

    -- Setup `mini.surround` for adding/deleting/replacing surroundings
    require('mini.surround').setup({
        -- Default settings (you can customize them here)
        mappings = {
            add = 'sa', -- Add surrounding
            delete = 'sd', -- Delete surrounding
            find = 'sf', -- Find surrounding
            find_left = 'sF', -- Find surrounding to the left
            highlight = 'sh', -- Highlight surrounding
            replace = 'sr', -- Replace surrounding
            update_n_lines = 'sn', -- Update search range for surroundings
        },
    })

    -- Setup `mini.statusline` for a minimal statusline
    local statusline = require('mini.statusline')
    statusline.setup({
        use_icons = vim.g.have_nerd_font, -- Set to true if you have Nerd Fonts
    })

    -- Customize the cursor location in the statusline
    statusline.section_location = function()
        return '%2l:%-2v' -- Show LINE:COLUMN
    end

    -- Uncomment to add optional modules:
    -- require('mini.comment').setup() -- For commenting code
    -- require('mini.pairs').setup() -- For auto pair completion
end

return M
