return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      'nvim-telescope/telescope-fzf-native.nvim', -- if this doesn't work, try commenting it out first, run Lazy, clean this package, then install it again
      build = 'make',
      config = function()
        require('telescope').load_extension('fzf')
      end
    },
    {
      'nvim-telescope/telescope-ui-select.nvim',
      config = function()
        require("telescope").load_extension("ui-select")
      end
    },
    {
      'ThePrimeagen/harpoon',
      config = function()
        require("telescope").load_extension("harpoon")
      end
    },
    "nvim-lua/plenary.nvim",
  },
  config = function ()
    require "plugins.telescope.config"
  end,
}
