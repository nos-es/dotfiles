-- Mason is a package manager to install and manage LSP servers, DAP servers, linters and formatters.
return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	-- nvim-lspconfig is Neovim LSP Client. This plugin allows nvim to talk to LSP servers.
	-- nvim-lspconfig should be present early (runtimepath) so mason-lspconfig can enable servers
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- TODO: Move and configure each server in separate file later..

			vim.lsp.enable("roslyn_ls")
			vim.lsp.config("roslyn_ls", {
				filetypes = { "razor", "cs" },
				settings = {
					-- better performance
					["csharp|background_analysis"] = {
						dotnet_analyzer_diagnostics_scope = "openFiles",
						dotnet_compiler_diagnostics_scope = "openFiles",
					},
				},
			})

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim", "blink" } },
						workspace = {
							library = {
								-- add Love2D support
								--"${3rd}/love2d/library",
								vim.env.VIMRUNTIME,
							},
						},
					},
				},
			})

			-- General lsp server keymaps for lsp functionality
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
	-- mason-lspconfig is plugin to bridge the gap between Mason and nvim-lspconfig.
	-- It does many stuff so both can work more easily together. (See github for more infos).
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			-- install lsp servers from here, not the mason ui
			ensure_installed = { "lua_ls", "rust_analyzer", "ts_ls", "stylua", "pylsp","clangd" },
			-- automatic_enable = true, -- default is true
		},
	},
}
