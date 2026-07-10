return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets", "onsails/lspkind.nvim" },

	version = "1.*",
	build = "cargo build --release",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "default",
			["<CR>"] = { "select_and_accept", "fallback" },
		},
		signature = { enabled = true },

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			documentation = { auto_show = true },
			list = {
				selection = { preselect = false },
			},
      trigger = {
        show_on_trigger_character = true,
      }
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
