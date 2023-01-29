return {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
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
     "jose-elias-alvarez/null-ls.nvim",
      event = "BufReadPre",
    },
    {
      "hrsh7th/cmp-nvim-lsp"
    },
    {
      "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
      config = function ()
       require("lsp_lines").setup()
      end
    }
  },
  config = function()
    require "plugins.lsp.mason-plg"
    require("plugins.lsp.handlers").setup()
    require "plugins.lsp..null-ls"
  end
}
