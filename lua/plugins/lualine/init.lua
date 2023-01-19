return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    'moll/vim-bbye',
    'nvim-tree/nvim-web-devicons',
  },
  config = function ()
    require "plugins.lualine.config"
  end
}
