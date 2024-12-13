-- This init.lua is for loading plugins, the main init.lua is in the .config/nvim directory

-- Lazy.nvim is the plugin manager
local lazypath = vim.fn.stdpath("data") .. "lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


-- PLUGIN LIST --
require("lazy").setup({
  {
      "williamboman/mason.nvim",
      config = function() require("plugins.mason") end,
  },
  {
      "williamboman/mason-lspconfig.nvim", -- Bridges Mason with nvim-lspconfig
      dependencies = { "williamboman/mason.nvim" },
  },
  -- Completion framework
  { "hrsh7th/nvim-cmp", config = function() require("plugins.autocomplete") end, },

  -- LSP completion source
  { "hrsh7th/cmp-nvim-lsp" },

  -- Snippet support
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },

  -- Buffer and path completion sources
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  -- lsp config
  { "neovim/nvim-lspconfig" },
  -- Telescope
  { "nvim-telescope/telescope.nvim", config = function() require("plugins.telescope") end, dependencies = { "nvim-lua/plenary.nvim" }},

  -- Github support
  --{"tpope/vim-fugitive"},
  --
  -- Lookin' good
  {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      config = function() require("plugins.lualine") end,
  },
    -- Themes
    { "ellisonleao/gruvbox.nvim" },
    {"scottmckendry/cyberdream.nvim"},
    { "miikanissi/modus-themes.nvim" },

  -- Productivity
  {'echasnovski/mini.nvim', config = function() require('plugins.mini').setup() end, },
  { "tpope/vim-repeat" },

  -- Comments
  { "numToStr/Comment.nvim", config = function() require("plugins.comments").setup() end, },

  -- treesitter
  {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("plugins.treesitter").setup()
        end,
    },
})

-- load language servers
require("plugins.language-servers")
