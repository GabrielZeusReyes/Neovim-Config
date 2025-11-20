return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},
		{
			"cbochs/grapple.nvim",
			opts = {
				scope = "git", -- also try out "git_branch"
			},
			keys = {
				{ "<leader>m", "<cmd>Grapple toggle<cr>", desc = "Tag a file" },
				{ "<leader>g", "<cmd>Grapple toggle_tags<cr>", desc = "Toggle tags menu" },

				{ "<leader>1", "<cmd>Grapple select index=1<cr>", desc = "Select first tag" },
				{ "<leader>2", "<cmd>Grapple select index=2<cr>", desc = "Select second tag" },
				{ "<leader>3", "<cmd>Grapple select index=3<cr>", desc = "Select third tag" },
				{ "<leader>4", "<cmd>Grapple select index=4<cr>", desc = "Select fourth tag" },
			},
		},
	},
	config = function()
		require("plugins.telescope.config")
	end,
}
