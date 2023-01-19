return {
  "kyazdani42/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function ()
    require "plugins.nvim-tree.config"
  end
}
