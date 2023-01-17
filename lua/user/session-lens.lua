local status_ok_auto, autoSession = pcall(require, "auto-session")
if not status_ok_auto then
	return
end

local status_ok, sessionLens = pcall(require, "session-lens")
if not status_ok then
	return
end

autoSession.setup({
  log_level = "error",
  auto_session_suppress_dirs = {
    "~/",
    "C:/Users/Gabriel",
    "C:/Users/JK90MO",
    "C:/Users/JK90MO/Developer/ING",
  }, -- add here your home dir
  -- auto_session_use_git_branch = true
})

sessionLens.setup({
  path_display = {'shorten'},
  theme = "dropdown",
  theme_conf = {
    border = true
  },
  previewer = false
})

local tele_status_ok, telescope = pcall(require, "telescope")
if not tele_status_ok then
	return
end

telescope.load_extension('session-lens')
