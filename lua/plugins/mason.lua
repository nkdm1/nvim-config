local plugins = {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"gopls",
				"solargraph",
				"powershell-editor-services",
			},
		},
	},
	{},
}
return plugins
