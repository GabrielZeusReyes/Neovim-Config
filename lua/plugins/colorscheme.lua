return {
  {
    "folke/tokyonight.nvim",
    -- lazy = false, -- make sure we load this during startup if it is your main colorscheme
    -- priority = 1000, -- make sure to load this before all the other start plugins
    config = function ()
      -- local ok_status, tokyonight = pcall(require, "tokyonight")
      -- if not ok_status then
      --   return
      -- end
      --
      -- tokyonight.setup {
      --   -- transparent = true,
      --   terminal_colors = true,
      --   styles = {
      --     -- sidebars = "transparent",
      --     floats = "transparent",
      --   }
      -- }
      -- vim.cmd([[colorscheme tokyonight]])
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function ()
      local ok_status, catpuccin = pcall(require, "catppuccin")
      if not ok_status then
        return
      end

      catpuccin.setup {
        flavour = "mocha",
        transparent_background = true,
      }
     vim.cmd([[colorscheme catppuccin]])
    end
  }
}
