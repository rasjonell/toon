vim.log.level = "warn"
vim.wo.relativenumber = true

lvim.format_on_save.enabled = true
lvim.format_on_save.timeout = 2000

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "html" })

local lspconfig = require('lspconfig')
lspconfig.html.setup({
  filetypes = { "html" }
})

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
}

lvim.plugins = {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = true,
      styles = {
        floats = "transparent",
        sidebars = "transparent",
      },
    }
  },
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
          model = "deepseek-r1:14b",
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
      "hrsh7th/nvim-cmp",
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
      "zbirenbaum/copilot.lua",
      "nvim-tree/nvim-web-devicons",
      {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            use_absolute_path = true,
            prompt_for_file_name = false,
            embed_image_as_base64 = false,
            drag_and_drop = {
              insert_mode = true,
            },
          },
        },
      },
    },
  }
}

lvim.colorscheme = "tokyonight-night"

lvim.meta = "ctrl"
lvim.leader = "space"

lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

lvim.builtin.alpha.active = true
lvim.builtin.terminal.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

lvim.builtin.bufferline.active = true

lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.ignore_install = { "haskell", "vimdoc" }
lvim.builtin.treesitter.ensure_installed = {
  "go",
  "lua",
  "tsx",
  "css",
  "bash",
  "json",
  "rust",
  "yaml",
  "templ",
  "javascript",
  "typescript",
}

-- require('user.wheel')
