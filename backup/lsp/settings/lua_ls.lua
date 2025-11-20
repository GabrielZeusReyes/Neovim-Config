return {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "pcall", "require" },
			},
      hint = {
        enable = true,
      },
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
}
