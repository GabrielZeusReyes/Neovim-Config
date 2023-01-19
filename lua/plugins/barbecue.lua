return {
  "utilyre/barbecue.nvim",
  event = "BufEnter",
  dependencies = {
    "neovim/nvim-lspconfig",
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
    -- "folke/tokyonight.nvim",
    "catppuccin/nvim",
  },
  config = function ()
    require("barbecue").setup {
      options = {
        theme = "catppuccin"
      }
    }
  end
}
