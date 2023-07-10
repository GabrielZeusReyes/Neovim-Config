-- return {
--   "neovim/nvim-lspconfig",
--   event = "BufReadPre",
--   dependencies = {
--     {
--       "williamboman/mason.nvim",
--       dependencies = {
--         "nvim-lua/popup.nvim",
--       }
--     },
--     {
--      "williamboman/mason-lspconfig.nvim"
--     },
--     {
--      "jose-elias-alvarez/null-ls.nvim",
--       event = "BufReadPre",
--     },
--     {
--       "hrsh7th/cmp-nvim-lsp"
--     },
--     {
--       "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
--       config = function ()
--        require("lsp_lines").setup()
--       end
--     }
--   },
--   config = function()
--     require "plugins.lsp.mason-plg"
--     require("plugins.lsp.handlers").setup()
--     require "plugins.lsp..null-ls"
--   end
-- }
return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {                                      -- Optional
      'williamboman/mason.nvim',
      build = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {
      'hrsh7th/nvim-cmp'
    },     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-buffer'},
    {'saadparwaiz1/cmp_luasnip'},
    {'rafamadriz/friendly-snippets'},
  },
  config = function()
    require "plugins.lsp.lsp-zero"
  end
}
