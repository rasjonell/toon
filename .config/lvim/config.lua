-- Env Setup

lvim.meta = "ctrl"
lvim.leader = "space"
lvim.log.level = "warn"
vim.wo.relativenumber = true
lvim.format_on_save.enabled = true
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- Plugin Setup

lvim.plugins = {
  "catppuccin/nvim",
  "ur4ltz/surround.nvim",
}

local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
  command = "eslint",
  filetypes = { "typescript", "typescriptreact", "javascript" }
})

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    name = "prettier",
    ---@usage only start in these filetypes, by default it will attach to all filetypes it supports
    filetypes = { "typescript", "typescriptreact" },
  },
}

require("surround").setup({
  mapping_style = "sandwich"
})

require("catppuccin").setup({
  transparent_background = true,
  flavour = "frappe", -- latte, frappe, macchiato, mocha
  integrations = {
    dashboard = true,
    which_key = true,
  }
})

-- setup must be called before loading
lvim.colorscheme = "catppuccin"

-- Plugin Configs

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"

lvim.builtin.terminal.active = true

lvim.builtin.nvimtree.setup.view.width = 60
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.ensure_installed = {
  "c",
  "lua",
  "tsx",
  "css",
  "bash",
  "json",
  "rust",
  "java",
  "yaml",
  "python",
  "javascript",
  "typescript",
}

lvim.builtin.telescope.defaults.dynamic_preview_title = true
lvim.builtin.telescope.defaults.sorting_strategy = "ascending"
lvim.builtin.telescope.defaults.selection_strategy = "closest"
