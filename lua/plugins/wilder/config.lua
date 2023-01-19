local status_ok, wilder = pcall(require, "wilder")
if not status_ok then
  return
end

wilder.setup({
  modes = { ':', '/', '?' },
})

local gradient = {
  '#f4468f', '#fd4a85', '#ff507a', '#ff566f', '#ff5e63',
  '#ff6658', '#ff704e', '#ff7a45', '#ff843d', '#ff9036',
  '#f89b31', '#efa72f', '#e6b32e', '#dcbe30', '#d2c934',
  '#c8d43a', '#bfde43', '#b6e84e', '#aff05b'
}

for i, fg in ipairs(gradient) do
  gradient[i] = wilder.make_hl('WilderGradient' .. i, 'Pmenu', {{a = 1}, {a = 1}, {foreground = fg}})
end

-- This config is for the popup center thingy
--[[ wilder.set_option('renderer', wilder.popupmenu_renderer( ]]
--[[   wilder.popupmenu_palette_theme({ ]]
--[[     -- 'single', 'double', 'rounded' or 'solid' ]]
--[[     -- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details ]]
--[[     highlights = { ]]
--[[       gradient = gradient, ]]
--[[       border = 'Normal', -- highlight to use for the border ]]
--[[     }, ]]
--[[     highlighter = wilder.highlighter_with_gradient({ ]]
--[[       wilder.basic_highlighter(), -- or wilder.lua_fzy_highlighter(), ]]
--[[     }), ]]
--[[     left = {' ', wilder.popupmenu_devicons()}, ]]
--[[     right = {' ', wilder.popupmenu_scrollbar()}, ]]
--[[     border = 'rounded', ]]
--[[     max_width = '30%', ]]
--[[     max_height = '25%',      -- max height of the palette ]]
--[[     min_height = 0,          -- set to the same as 'max_height' for a fixed height window ]]
--[[     prompt_position = 'top', -- 'top' or 'bottom' to set the location of the prompt ]]
--[[     reverse = 0,             -- set to 1 to reverse the order of the list, use in combination with 'prompt_position' ]]
--[[   }) ]]
--[[ )) ]]

-- Normal popup
wilder.set_option('renderer', wilder.popupmenu_renderer(
  wilder.popupmenu_border_theme({
    -- pumblend = 25,
    -- 'single', 'double', 'rounded' or 'solid'
    -- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
    highlights = {
      gradient = gradient,
      border = 'Normal', -- highlight to use for the border
    },
    border = "rounded",
    highlighter = wilder.highlighter_with_gradient({
      wilder.basic_highlighter(), -- or wilder.lua_fzy_highlighter(),
    }),
    left = {' ', wilder.popupmenu_devicons()},
    right = {' ', wilder.popupmenu_scrollbar()},
  })
)
)

-- vim.api.nvim_set_hl(0, "Pmenu", { bg = "#000000"})
