local cmp = require('cmp')

cmp.setup({
    snippet = {
        -- REQUIRED: Specify a snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),  -- Trigger completion
        ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection
        ['<C-n>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif require('luasnip').expand_or_jumpable() then
                require('luasnip').expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ['<C-p>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif require('luasnip').jumpable(-1) then
                require('luasnip').jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },  -- LSP completion
        { name = 'luasnip' },   -- Snippets
    }, {
        { name = 'buffer' },    -- Buffer completion
        { name = 'path' },      -- Path completion
    }),
})
