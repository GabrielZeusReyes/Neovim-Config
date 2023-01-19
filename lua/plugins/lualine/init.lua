return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    'moll/vim-bbye',
    'nvim-tree/nvim-web-devicons',
  },
  config = function ()
    require "plugins.lualine.config"
  end
}
