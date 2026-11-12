-- Eviline-style config for lualine, adapted for e-ink
local lualine = require("lualine")
local mono = require("e-ink.palette").mono()

-- Color table for highlights
local colors = {
  bg       = "NONE",
  fg       = mono[12],
  muted    = mono[10],
  subtle   = mono[9],

  yellow   = mono[9],
  cyan     = mono[11],
  darkblue = mono[8],
  green    = mono[11],
  orange   = mono[10],
  violet   = mono[10],
  magenta  = mono[11],
  blue     = mono[12],
  red      = mono[9],
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand("%:p:h")
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

local config = {
  options = {
    component_separators = "",
    section_separators = "",
    theme = {
      normal = { c = { fg = colors.fg, bg = "NONE" } },
      inactive = { c = { fg = colors.subtle, bg = "NONE" } },
    },
    globalstatus = true,
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left({
  function()
    return "▊"
  end,
  color = { fg = colors.subtle },
  padding = { left = 0, right = 1 },
})

ins_left({
  function()
    return ""
  end,
  color = function()
    local mode_color = {
      n = colors.fg,
      i = colors.green,
      v = colors.yellow,
      [""] = colors.yellow,
      V = colors.yellow,
      c = colors.magenta,
      no = colors.fg,
      s = colors.orange,
      S = colors.orange,
      [""] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.fg,
      ce = colors.fg,
      r = colors.cyan,
      rm = colors.cyan,
      ["r?"] = colors.cyan,
      ["!"] = colors.fg,
      t = colors.fg,
    }
    return { fg = mode_color[vim.fn.mode()] or colors.fg, gui = "bold" }
  end,
  padding = { right = 1 },
})

ins_left({
  "filesize",
  cond = conditions.buffer_not_empty,
  color = { fg = colors.muted },
})

ins_left({
  "filename",
  cond = conditions.buffer_not_empty,
  color = { fg = colors.fg, gui = "bold" },
})

ins_left({
  "location",
  color = { fg = colors.muted },
})

ins_left({
  "progress",
  color = { fg = colors.fg, gui = "bold" },
})

ins_left({
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = { error = " ", warn = " ", info = " " },
  diagnostics_color = {
    error = { fg = colors.red },
    warn = { fg = colors.yellow },
    info = { fg = colors.cyan },
  },
})

ins_left({
  function()
    return "%="
  end,
})

ins_left({
  function()
    local msg = "No Active Lsp"
    local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = " LSP:",
  color = { fg = colors.fg, gui = "bold" },
})

ins_right({
  "o:encoding",
  fmt = string.upper,
  cond = conditions.hide_in_width,
  color = { fg = colors.muted, gui = "bold" },
})

ins_right({
  "fileformat",
  fmt = string.upper,
  icons_enabled = false,
  color = { fg = colors.muted, gui = "bold" },
})

ins_right({
  "branch",
  icon = "",
  color = { fg = colors.fg, gui = "bold" },
})

ins_right({
  "diff",
  symbols = { added = " ", modified = "󰝤 ", removed = " " },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
})

ins_right({
  function()
    return "▊"
  end,
  color = { fg = colors.subtle },
  padding = { left = 1 },
})

lualine.setup(config)

vim.api.nvim_set_hl(0, "StatusLine", { fg = colors.fg, bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusLineNC", { fg = colors.subtle, bg = "NONE" })
