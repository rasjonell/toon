vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ timeout = 150 })
	end,
})

-- vim.api.nvim_create_autocmd("ColorScheme", {
-- 	callback = function()
-- 		require("config.transparent").apply()
-- 	end,
-- })

-- vim.schedule(function()
-- 	require("config.transparent").apply()
-- end)
