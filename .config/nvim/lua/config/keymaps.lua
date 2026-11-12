local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)
map("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)
map("n", "<leader>w", "<cmd>w<CR>", opts)
map("n", "<leader>q", "<cmd>q<CR>", opts)

map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

map("n", "<C-Up>", "<cmd>resize +2<CR>", opts)
map("n", "<C-Down>", "<cmd>resize -2<CR>", opts)
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)

-- Move lines (like many distros)
map("n", "<A-j>", "<cmd>m .+1<CR>==", opts)
map("n", "<A-k>", "<cmd>m .-2<CR>==", opts)
map("i", "<A-j>", "<Esc><cmd>m .+1<CR>==gi", opts)
map("i", "<A-k>", "<Esc><cmd>m .-2<CR>==gi", opts)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

map("n", "<leader>f", "<cmd>Telescope find_files<CR>", opts)
map("n", "<leader>st", "<cmd>Telescope live_grep<CR>", opts)
map("n", "<leader>b", "<cmd>Telescope buffers<CR>", opts)

map("n", "<leader>e", "<cmd>Neotree toggle<CR>", opts)

map("n", "<leader>gg", "<cmd>LazyGit<CR>", opts)

map("n", "<leader>gd", vim.diagnostic.open_float, opts)
map("n", "[d", vim.diagnostic.goto_prev, opts)
map("n", "]d", vim.diagnostic.goto_next, opts)

map("n", "<leader>;c", function()
	vim.cmd("edit " .. vim.fn.stdpath("config") .. "/init.lua")
end, opts)

map("n", "<S-l>", "<cmd>bnext<CR>", opts)
map("n", "<S-h>", "<cmd>bprevious<CR>", opts)

map("n", "<leader>c", function()
	local bufnr = vim.api.nvim_get_current_buf()
	local modified = vim.bo[bufnr].modified

	if modified then
		vim.notify("Buffer has unsaved changes; save or :bd! to force.", vim.log.levels.WARN)
		return
	end

	local listed = vim.tbl_filter(function(b)
		return vim.api.nvim_buf_is_valid(b) and vim.bo[b].buflisted and b ~= bufnr
	end, vim.api.nvim_list_bufs())

	if #listed > 0 then
		vim.api.nvim_set_current_buf(listed[1])
	else
		vim.cmd("enew")
	end

	vim.api.nvim_buf_delete(bufnr, { force = false })
end, opts)

map("n", "<leader>lr", vim.lsp.buf.rename)
map("n", "<leader>la", vim.lsp.buf.code_action)
map("n", "<leader>ld", vim.diagnostic.open_float)
map("n", "<leader>lf", function()
	vim.lsp.buf.format({ async = true })
end)
