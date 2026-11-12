local M = {}

function M.apply()
	local transparent_groups = {
		"Normal",
		"NormalNC",
		"SignColumn",
		"EndOfBuffer",
		"MsgArea",
		"FoldColumn",
		"NormalFloat",
		"FloatBorder",

		"Pmenu",
		"PmenuSbar",

		"TelescopeNormal",
		"TelescopeBorder",
		"NeoTreeNormal",
		"NeoTreeNormalNC",
	}

	for _, g in ipairs(transparent_groups) do
		vim.api.nvim_set_hl(0, g, { bg = "none" })
	end

	vim.api.nvim_set_hl(0, "PmenuSel", { reverse = true, bold = true })
	vim.api.nvim_set_hl(0, "PmenuThumb", { reverse = true })

	vim.api.nvim_set_hl(0, "TelescopeSelection", { reverse = true, bold = true })
	vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { reverse = true, bold = true })

	vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "none" })
end

return M
