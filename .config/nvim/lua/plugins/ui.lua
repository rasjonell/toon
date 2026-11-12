return {
	{
		"e-ink-colorscheme/e-ink.nvim",
		priority = 1000,
		config = function()
			require("e-ink").setup()
			vim.cmd.colorscheme("e-ink")
			vim.opt.background = "dark"
			local set_hl = vim.api.nvim_set_hl
			local mono = require("e-ink.palette").mono()

			set_hl(0, "Normal", { fg = mono[12], bg = "NONE" })
		end,
	},

	-- {
	--   "nyoom-engineering/oxocarbon.nvim",
	--   init = function()
	--     vim.opt.background = "dark"
	--     vim.cmd.colorscheme("oxocarbon")
	--   end,
	-- },

	-- {
	--   "slugbyte/lackluster.nvim",
	--   lazy = false,
	--   priority = 1000,
	--   init = function()
	--     -- vim.cmd.colorscheme("lackluster")
	--     vim.cmd.colorscheme("lackluster-hack") -- my favorite
	--     -- vim.cmd.colorscheme("lackluster-mint")
	--   end,
	-- },

	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			local mono = require("e-ink.palette").mono()

			local eink_lualine = {
				normal = {
					a = { fg = mono[16], bg = mono[11], gui = "bold" },
					b = { fg = mono[12], bg = mono[15] },
					c = { fg = mono[11], bg = "NONE" },
				},
				insert = {
					a = { fg = mono[16], bg = mono[10], gui = "bold" },
					b = { fg = mono[12], bg = mono[15] },
					c = { fg = mono[11], bg = "NONE" },
				},
				visual = {
					a = { fg = mono[16], bg = mono[9], gui = "bold" },
					b = { fg = mono[12], bg = mono[15] },
					c = { fg = mono[11], bg = "NONE" },
				},
				replace = {
					a = { fg = mono[16], bg = mono[8], gui = "bold" },
					b = { fg = mono[12], bg = mono[15] },
					c = { fg = mono[11], bg = "NONE" },
				},
				command = {
					a = { fg = mono[16], bg = mono[7], gui = "bold" },
					b = { fg = mono[12], bg = mono[15] },
					c = { fg = mono[11], bg = "NONE" },
				},
				inactive = {
					a = { fg = mono[13], bg = "NONE", gui = "bold" },
					b = { fg = mono[13], bg = "NONE" },
					c = { fg = mono[14], bg = "NONE" },
				},
			}

			require("lualine").setup({
				options = {
					theme = eink_lualine,
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					globalstatus = true,
				},
			})
		end,
	},

	{
		"akinsho/bufferline.nvim",
		version = "*",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		cmd = "Neotree",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		opts = {
			filesystem = {
				follow_current_file = { enabled = true },
				hijack_netrw_behavior = "open_default",
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_ignored = false,
					hide_hidden = false,
				},
			},
			window = {
				width = 40,
				position = "right",
			},
		},
	},

	{
		"akinsho/toggleterm.nvim",
		version = "*",
		keys = { [[<C-a>]] },
		opts = { open_mapping = [[<C-a>]], direction = "float" },
	},
}
