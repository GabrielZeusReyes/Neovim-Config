local ok_status, catppuccin = pcall(require, "catppuccin")
if not ok_status then
  return
end

catppuccin.setup {
  transparent_background = true
}

local colorscheme = "catppuccin-mocha"

local status_ok,_ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
