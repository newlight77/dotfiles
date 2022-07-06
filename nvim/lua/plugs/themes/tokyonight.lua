local status_ok, tokyonight = pcall(require, "tokyonight")
if not status_ok then
  return
end

local lualine_ok, lualine = pcall(require, "lualine")
if lualine_ok then
  lualine.setup {
    options = {
      theme = 'tokyonight'
    }
  }
end

vim.o.termguicolors = true
vim.o.background = 'dark'

vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = {
  none = "NONE",
  bg_dark = "#0e0f18",
  bg = "#181a27",
  bg_highlight = "#292e42",
  terminal_black = "#3a415f",
  fg = "#c0caf5",
  fg_dark = "#a9b1d6",
  fg_gutter = "#3b4261",
  dark3 = "#545c7e",
  comment = "#565f89",
  dark5 = "#737aa2",
  cyan = "#47b7f9",
  blue = "#5970fc",
  blue0 = "#443fbe",
  blue1 = "#2499f5",
  blue2 = "#0898d4",
  blue5 = "#68d2fd",
  blue6 = "#17f8f3",
  blue7 = "#3b578f",
  magenta = "#d30ad7",
  magenta2 = "#cc0c69",
  purple = "#b457ea",
  orange = "#fd6a4f",
  yellow = "#f4b810",
  green = "#61d922",
  green1 = "#0af262",
  green2 = "#3d9f34",
  teal = "#09ddb3",
  red = "#f7516f",
  red1 = "#df3a3a",
  git = { change = "#6183bb", add = "#449dab", delete = "#914c54", conflict = "#bb7a61" },
  gitSigns = { add = "#164846", change = "#394b70", delete = "#823c41" },
}

-- Load the colorscheme
vim.cmd[[colorscheme tokyonight]]



-- local config = require("tokyonight.config")
-- local colors = require("tokyonight.colors").setup(config) -- pass in any of the config options as explained above
-- local utils = require("tokyonight.util")

-- someplugin.background = colors.bg_dark
-- someplugin.my_error = util.brighten(colors.red1, 0.3)
