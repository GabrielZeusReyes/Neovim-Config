return {
  "utilyre/barbecue.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
    "folke/tokyonight.nvim",
  },
  config = function ()
    require("barbecue").setup {
      options = {
        theme = "tokyonight"
      }
    }
  end
}
