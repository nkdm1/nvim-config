return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			setup = {
				gopls = function(_, opts)
					vim.diagnostic.config({
						virtual_text = {
							format = function(diagnostic)
								return diagnostic.message
							end,
						},
						float = {
							format = function(diagnostic)
								return diagnostic.message
							end,
						},
					})
					require("lspconfig").gopls.setup(opts)
					return true
				end,
			},
		},
	},
}
