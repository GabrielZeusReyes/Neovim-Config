return {
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
        integrations = {
          -- ts_rainbow2 = true,
          rainbow_delimiters = true,
          nvimtree = true,
          harpoon = true,
        }
      }
     vim.cmd([[colorscheme catppuccin]])
    end
  }
}
