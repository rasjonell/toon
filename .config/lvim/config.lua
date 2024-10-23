vim.log.level = "warn"
vim.wo.relativenumber = true
lvim.format_on_save.enabled = true
lvim.format_on_save.timeout = 5000

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettier",
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "css", "html" },
  }
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    command = "eslint",
    filetypes = { "typescript", "typescriptreact" }
  },
  {
    command = "revive",
    filetypes = { "go" }
  }
}

lvim.plugins = {
  "tiagovla/tokyodark.nvim",
  "xiyaowong/transparent.nvim",
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
}


lvim.colorscheme = "catppuccin-mocha"

vim.g.tokyodark_color_gamma = "1.0"
vim.g.tokyodark_enable_italic = true
vim.g.tokyodark_enable_italic_comment = true
vim.g.tokyodark_transparent_background = true

lvim.meta = "ctrl"
lvim.leader = "space"

lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

lvim.builtin.alpha.active = true
lvim.builtin.terminal.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

lvim.builtin.bufferline.active = true

lvim.builtin.treesitter.ignore_install = { "haskell", "vimdoc" }
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.ensure_installed = {
  "lua",
  "tsx",
  "css",
  "bash",
  "json",
  "rust",
  "yaml",
  "javascript",
  "typescript",
}

require("transparent").setup({ -- Optional, you don't have to run setup.
  groups = {                   -- table: default groups
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
    'EndOfBuffer',
  },
  extra_groups = {
    "NormalFloat",
    "NvimTreeNormal",
  },                   -- table: additional groups that should be cleared
  exclude_groups = {}, -- table: groups you don't want to clear
})
