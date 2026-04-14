vim.loader.enable()
-- =============
-- == PLUGINS ==
-- =============
--
vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/rebelot/kanagawa.nvim",
	"https://github.com/L3MON4D3/LuaSnip",
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/saghen/blink.cmp",
	"https://github.com/romus204/tree-sitter-manager.nvim",
})

-- local unused_plugins = vim.iter(vim.pack.get())
-- 		:filter(function(x) return not x.active end)
-- 		:map(function(x) return x.spec.name end)
-- 		:totable()
--
-- vim.pack.del(unused_plugins)


-- colorscheme
vim.cmd.colorscheme("kanagawa-dragon")
vim.cmd("hi statusline guibg=NONE")
vim.api.nvim_set_hl(0, "normal", { bg = "none" })
vim.api.nvim_set_hl(0, "normalnc", { bg = "none" })
vim.api.nvim_set_hl(0, "endofbuffer", { bg = "none" })

-- basic settings
vim.o.confirm = true          -- global confirmation for unsaved changes
vim.opt.number = true         -- line numbers
vim.opt.relativenumber = true -- relative line numbers
vim.opt.cursorline = true     -- highlight current line
vim.opt.wrap = true           -- wrap lines
vim.opt.scrolloff = 10        -- keep 10 lines above/below cursor
vim.opt.sidescrolloff = 8     -- keep 8 columns left/right of cursor

-- indentation
vim.opt.tabstop = 2        -- tab width
vim.opt.shiftwidth = 2     -- indent width
vim.opt.softtabstop = 2    -- soft tab stop
vim.opt.expandtab = false  -- use spaces instead of tabs
vim.opt.smartindent = true -- smart auto-indenting

-- search settings
vim.opt.ignorecase = true -- case insensitive search
vim.opt.smartcase = true  -- case sensitive if uppercase in search
vim.opt.hlsearch = false  -- don't highlight search results
vim.opt.incsearch = true  -- show matches as you type

-- visual settings
vim.opt.lazyredraw = true
vim.opt.termsync = true
vim.opt.winborder = "bold"
vim.opt.termguicolors = true                      -- enable 24-bit colors
vim.opt.signcolumn = "yes"                        -- always show sign column
vim.opt.showmatch = false                         -- highlight matching brackets
vim.opt.cmdheight = 1                             -- command line height
vim.opt.completeopt = "menuone,noinsert,noselect" -- completion options
vim.opt.showmode = false                          -- don't show mode in command line
vim.opt.pumheight = 10                            -- popup menu height
vim.opt.pumblend = 10                             -- popup menu transparency
vim.opt.winblend = 0                              -- floating window transparency
vim.opt.conceallevel = 0                          -- don't hide markup
vim.opt.concealcursor = ""                        -- don't hide cursor line markup
vim.opt.synmaxcol = 3000                          -- syntax highlighting limit
vim.opt.ruler = true                              -- cursor position shown in status line
vim.opt.lz = false
vim.opt.guicursor = table.concat({
	"n-v-c:block", -- normal, visual, command block
	"i-ci:ver25", -- insert
	"r-cr:hor20", -- replace
	"o:hor50",    -- operator-pending
}, ",")

-- file handling
vim.opt.backup = false                            -- don't create backup files
vim.opt.writebackup = false                       -- don't create backup before writing
vim.opt.swapfile = false                          -- don't create swap files
vim.opt.undofile = true                           -- persistent undo
vim.opt.undodir = vim.fn.expand("~/.vim/undodir") -- undo directory
vim.opt.updatetime = 10                           -- faster completion
vim.opt.timeoutlen = 1000                         -- key timeout duration
vim.opt.ttimeoutlen = 0                           -- key code timeout
vim.opt.autoread = true                           -- auto reload files changed outside vim
vim.opt.autowrite = false                         -- don't auto save

-- behavior settings
vim.opt.hidden = true                   -- allow hidden buffers
vim.opt.errorbells = false              -- no error bells
vim.opt.backspace = "indent,eol,start"  -- better backspace behavior
vim.opt.autochdir = false               -- don't auto change directory
vim.opt.iskeyword:append("-")           -- treat dash as part of word
vim.opt.path:append("**")               -- include subdirectories in search
vim.opt.selection = "exclusive"         -- selection behavior
vim.opt.mouse = "a"                     -- enable mouse support
vim.opt.clipboard:append("unnamedplus") -- use system clipboard
vim.opt.modifiable = true               -- allow buffer modifications
vim.opt.encoding = "utf-8"              -- set encoding

-- Folding settings
vim.opt.foldmethod = "expr"                         -- Use expression for folding
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Use treesitter for folding
vim.opt.foldenable = false

-- Split behavior
vim.opt.splitbelow = true -- Horizontal splits go below
vim.opt.splitright = true -- Vertical splits go right

-- ==================
-- == Key mappings ==
-- ==================
vim.g.mapleader = " "      -- Set leader key to space
vim.g.maplocalleader = " " -- Set local leader key (NEW)

-- Center screen when jumping
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Splitting & Resizing
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })


-- Quick file navigation
vim.keymap.set("n", "<leader>e", ":Explore<CR>", { desc = "Open file explorer" })
vim.keymap.set("n", "<leader>ff", ":find ", { desc = "Find file" })

-- Better J behavior
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- Quick config editing
vim.keymap.set("n", "<leader>rc", ":tabnew ~/.config/nvim/init.lua<CR>", { desc = "Edit config" })

-- tab navigation
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>', { desc = 'New tab' })
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', { desc = 'Close tab' })
vim.keymap.set('n', '<leader>h', ':tabnext<CR>', { desc = 'next tab' })
vim.keymap.set('n', '<leader>l', ':tabprevious<CR>', { desc = 'previous tab' })

-- Tab moving
vim.keymap.set('n', '<leader>t>', ':tabmove +1<CR>', { desc = 'Move tab right' })
vim.keymap.set('n', '<leader>t<', ':tabmove -1<CR>', { desc = 'Move tab left' })

-- format file
vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format)

-- show diagnostics
vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float)

-- code action
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

-- incoming_calls
vim.keymap.set("n", "<leader>i", vim.lsp.buf.incoming_calls)

-- references
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references)

-- rename
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename)

-- jump to diagnostics
vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1 })
end, { desc = "Next diagnostic" })
vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1 })
end, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]e", function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { desc = "Next error" })
vim.keymap.set("n", "[e", function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { desc = "Previous error" })

-- Disable command-line window
vim.keymap.set("n", "q:", "<Nop>", { desc = "Disable cmdline window" })
vim.keymap.set("c", "<C-f>", "<Nop>", { desc = "Disable cmdline window" })


-- ==================
-- == AUTOCOMMANDS ==
-- ==================
local augroup = vim.api.nvim_create_augroup("UserConfig", {})

vim.api.nvim_create_autocmd("CmdlineLeave", {
	group = augroup,
	callback = function()
		vim.fn.timer_start(1500, function()
			vim.cmd [[ echon ' ' ]]
		end)
	end
})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup,
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Auto-resize splits when window is resized
vim.api.nvim_create_autocmd("VimResized", {
	group = augroup,
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})


-- Create directories when saving files
vim.api.nvim_create_autocmd("BufWritePre", {
	group = augroup,
	callback = function()
		local dir = vim.fn.expand('<afile>:p:h')
		if vim.fn.isdirectory(dir) == 0 then
			vim.fn.mkdir(dir, 'p')
		end
	end,
})

-- Command-line completion
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })

-- Better diff options
vim.opt.diffopt:append("linematch:60")

-- Performance improvements
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 200000

-- Create undo directory if it doesn't exist
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end
-- =========
-- == LSP ==
-- =========

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip")

vim.api.nvim_create_autocmd("BufReadPre", {
	once = true,
	callback = function()
		vim.lsp.enable({
			"lua_ls",
			"clangd",
			"gopls",
			"bashls",
			"pyright",
			"ruff",
			"zls",
			"yamlls",
		})
		vim.diagnostic.config({ virtual_text = true })
	end,
})
require("blink.cmp").setup({
	keymap = { preset = "enter" },
	signature = { enabled = true },
	snippets = { preset = "luasnip" },
	fuzzy = { implementation = "lua" },
	completion = {
		list = { selection = { preselect = false, auto_insert = false } },
		documentation = { auto_show = true, auto_show_delay_ms = 0 },
		menu = {
			auto_show = true,
			draw = {
				treesitter = { "lsp" },
				columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind" } },
			},
		},
	},
})
local ts = require("tree-sitter-manager")
ts.setup({
	ensure_installed = {
		"go",
		"gomod",
		"gosum",
		"gowork",
		"lua",
		"c",
		"vim",
		"vimdoc",
		"python",
	},
	update_on_start = false,
})
vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		local lang = vim.bo.filetype
		if lang ~= "" then
			pcall(vim.treesitter.start)
		end
	end,
})
