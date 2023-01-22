local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = " ", warn = " " },
  colored = true,
  update_in_insert = false,
  always_visible = true,
}

local diff = {
  "diff",
  colored = true,
  symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width
}

local mode = {
  "mode",
  --[[ fmt = function(str) ]]
  --[[ 	return "-- " .. str .. " --" ]]
  --[[ end, ]]
  fmt = function(str)
    local firstLetter = str:sub(1, 1)
    local modeIcons = {
      I = "",
      N = "",
      C = "",
      V = "",
      R = ""
    }
    return modeIcons[firstLetter]
  end,
  separator = { left = "", right = "" },
}
-- '' '' '' '' '' '' '' ''

local filetype = {
  "filetype",
  icons_enabled = true,
  icon = nil,
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
  separator = { left = "", right = "" },
  padding = { left = 2, right = 1 }
}

local location = {
  "location",
  padding = { left = 0, right = 2 },
  separator = { left = "" }
}

local sessions = {
  require('auto-session-library').current_session_name,
  icons_enabled = true,
  icon = "",
  padding = { left = 1, right = 1 },
}

local buffers = {
  "buffers",
  -- section_separators = { right = '', left = '' },
  -- component_separators = { left = '▏', right = '▏' },
  separator = { left = "", right = "" },
  right_padding = 2,
  symbols = { alternate_file = "" },
  filetype_names = {
    fugitive = "Fugitive",
    DiffviewFileHistory = "File History"
  },
  buffers_color = {
    -- active = { bg = colors.transparent, gui = "bold" },     -- Color for active buffer.
    -- inactive = { bg = colors.lightgrey, gui = "bold" }, -- Color for inactive buffer.
  },
}

-- cool function for progress
local progress = function()
  local current_line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")
  local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end

local spaces = function()
  return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "catppuccin",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "fugitive", "toggleterm", "dashboard", "NvimTree", "Outline", "spectre_panel", "DiffviewFiles"},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { mode },
    lualine_b = { branch },
    lualine_c = { sessions, diagnostics },
    -- lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_x = { diff, spaces, "encoding", filetype },
    lualine_y = { location },
    lualine_z = {
      {
        progress,
        separator = {
          left = "",
          right = ""
        }
      }
    }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {
    lualine_a = { buffers },
  },
})

