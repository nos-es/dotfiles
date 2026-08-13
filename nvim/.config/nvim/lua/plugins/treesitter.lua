-- nvim-treesitter (Treesitter used for highlighting)
return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	branch = "master", -- lock to master, since main is a rewrite!
	config = function() -- config solves a issue where treesitter is not loaded automatically in lazy
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {
				"lua",
				"rust",
				"c",
				"javascript",
				"c_sharp",
				"python",
				"vim",
				"vimdoc",
				"query",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
