return {
  "windwp/nvim-autopairs",
  event = "VeryLazy",
  config = function()
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    require("nvim-autopairs").setup({
      check_ts = true,
    })
    require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end
}
