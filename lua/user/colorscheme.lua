local ok_status, nightfox = pcall(require, "nightfox")
if not ok_status then
  return
end

nightfox.setup {
  options = {
    transparent = true
  }
}

local colorscheme = "carbonfox"

local status_ok,_ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
