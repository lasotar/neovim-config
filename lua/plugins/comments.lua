local M = {}

M.setup = function()
    require('Comment').setup({
        toggler = {
            line = 'gcc',
            block = 'gbc',
        },
        opleader = {
            line = 'gc',
            block = 'gb',
        },
        mappings = {
            basic = true,
            extra = true,
        },
  })
end

return M
