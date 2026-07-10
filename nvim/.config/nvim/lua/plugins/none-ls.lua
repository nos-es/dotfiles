-- none-ls is a plugin to wrap linters(e.g diagnostigs) and formatters into a general lsp, since normally they are mostly cli tools.
-- nvim can use the general lsp api to work with these linters and formatters.
return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	opts = function()
		local null_ls = require("null-ls")

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

		return {
			sources = {
				-- Add here linters and formatters:
				-- (null_ls-builtins.diagnostics.[lintersname]
				null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        require("none-ls.formatting.rustfmt"),
        -- null_ls.builtins.formatting.rustfmt,
        --null_ls.builtins.diagnostics.eslint_d
        -- When warning or error:
         require("none-ls.diagnostics.eslint_d")
			},
		}
	end,
}
