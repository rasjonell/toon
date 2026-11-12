return {
	{ "neovim/nvim-lspconfig", lazy = false },

	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		opts = {},
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "mason.nvim" },
		opts = {
			ensure_installed = { "lua_ls", "tsgo", "gopls", "pyright" },
			automatic_installation = true,
		},
	},

	{
		"hrsh7th/cmp-nvim-lsp",
		lazy = true,
		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			local ok, cmp = pcall(require, "cmp_nvim_lsp")
			if ok then
				capabilities = cmp.default_capabilities(capabilities)
			end

			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local bufnr = args.buf
					local map = function(mode, lhs, rhs)
						vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
					end

					map("n", "gd", vim.lsp.buf.definition)
					map("n", "gr", vim.lsp.buf.references)
					map("n", "gI", vim.lsp.buf.implementation)
					map("n", "K", vim.lsp.buf.hover)
				end,
			})

			-- Server-specific overrides (extend presets from nvim-lspconfig)
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = { checkThirdParty = false },
					},
				},
			})

			-- Enable servers (auto-activate for matching filetypes)
			vim.lsp.enable({ "lua_ls", "tsgo", "gopls" })
		end,
	},
}
