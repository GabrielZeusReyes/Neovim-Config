return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "williamboman/mason.nvim",
      dependencies = {
        "nvim-lua/popup.nvim",
      }
    },
    {
     "williamboman/mason-lspconfig.nvim"
    },
    {
     "jose-elias-alvarez/null-ls.nvim"
    },
    {
      "hrsh7th/cmp-nvim-lsp"
    }
  },
  config = function()
    require "plugins.lsp.mason-plg"
    require("plugins.lsp.handlers").setup()
    require "plugins.lsp..null-ls"
  end
}
