vim.log.level = "warn"
vim.wo.relativenumber = true

lvim.format_on_save.enabled = true
lvim.format_on_save.timeout = 2000

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
    command = "revive",
    filetypes = { "go" }
  },
  {
    command = "eslint",
    filetypes = { "typescript", "typescriptreact" }
  },
}

lvim.plugins = {
  "folke/tokyonight.nvim",
  {
    "yetone/avante.nvim",
    lazy = false,
    version = false,
    event = "VeryLazy",
    opts = {
      provider = "ollama",
      auto_suggestions_provider = "ollama",

      vendors = {
        ollama = {
          api_key_name = "",
          model = "mistral",
          __inherited_from = "openai",
          endpoint = "http://127.0.0.1:11434/v1",
        },
      },

      suggestion = {
        next = "<M-]>",
        prev = "<M-[>",
        accept = "<M-h>",
        dismiss = "<C-]>",
      },
    },
    build = "make",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-tree/nvim-web-devicons",
      "zbirenbaum/copilot.lua",
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            prompt_for_file_name = false,
            embed_image_as_base64 = false,
            drag_and_drop = {
              insert_mode = true,
            },
            use_absolute_path = true,
          },
        },
      },
      {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  }
}


lvim.colorscheme = "tokyonight"

lvim.meta = "ctrl"
lvim.leader = "space"

lvim.keys.normal_mode["<C-s>"] = ":w<CR>"
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
  "go",
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

require("tokyonight").setup({
  style = "moon",
  transparent = true,
  styles = {
    floats = "transparent",
    sidebars = "transparent",
  },
})

vim.cmd [[colorscheme tokyonight]]
