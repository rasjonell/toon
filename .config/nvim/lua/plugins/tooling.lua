return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			defaults = {
				layout_strategy = "horizontal",
				sorting_strategy = "ascending",
				layout_config = { prompt_position = "top" },
			},
		},
	},

	{ "numToStr/Comment.nvim", event = "VeryLazy", opts = {} },

	{ "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },

	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", event = "VeryLazy", opts = {} },

	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = {
			-- format_on_save = { timeout_ms = 1500, lsp_fallback = true },
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				go = { "gofmt" },
				python = { "black" },
			},
		},
	},

	{
		"mfussenegger/nvim-lint",
		event = { "BufWritePost", "InsertLeave" },
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				python = { "ruff" },
			}

			vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},

	{ "kdheepak/lazygit.nvim", cmd = "LazyGit", dependencies = { "nvim-lua/plenary.nvim" } },
}
