return {
	{
		{
			"folke/tokyonight.nvim",
		},
		{
			"rebelot/kanagawa.nvim",
			opts = {
				overrides = function(colors) -- add/modify highlights
					local theme = colors.theme
					return {
						Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
						PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
						PmenuSbar = { bg = theme.ui.bg_m1 },
						PmenuThumb = { bg = theme.ui.bg_p2 },
					}
				end,
			},
		},
		{
			"LazyVim/LazyVim",
			opts = {
				colorscheme = "kanagawa-dragon",
			},
		},
		-- transparent.nvim
		-- {
		-- 	"xiyaowong/transparent.nvim",
		-- 	lazy = false,
		-- 	config = function()
		-- 		require("transparent").setup({
		-- 			extra_groups = {
		-- 				"Normal",
		-- 				"NormalNC",
		-- 				"NormalFloat",
		-- 				"VertSplit",
		-- 				"EndOfBuffer",
		--
		-- 				-- Statusline (bottom bar)
		-- 				"StatusLine",
		-- 				"StatusLineNC",
		--
		-- 				-- Winbar
		-- 				"WinBar",
		-- 				"WinBarNC",
		--
		-- 				-- Tabline (top buffer/tab bar)
		-- 				"TabLine",
		-- 				"TabLineSel",
		-- 				"TabLineFill",
		--
		-- 				-- File Explorer (like NvimTree)
		-- 				"NvimTreeNormal",
		-- 				"NvimTreeNormalNC",
		--
		-- 				-- Telescope
		-- 				"TelescopeNormal",
		-- 				"TelescopeBorder",
		-- 				"TelescopePromptNormal",
		-- 				"TelescopePromptBorder",
		-- 				"TelescopeResultsNormal",
		-- 				"TelescopePreviewNormal",
		--
		-- 				-- Popup menu (autocomplete)
		-- 				-- "Pmenu",
		-- 				-- "PmenuSel",
		-- 				-- "PmenuSbar",
		-- 				-- "PmenuThumb",
		--
		-- 				-- Floating window borders
		-- 				"FloatBorder",
		-- 			},
		-- 			exclude_groups = {}, -- don't exclude anything
		-- 		})
		-- 	end,
		-- },
	},
}
