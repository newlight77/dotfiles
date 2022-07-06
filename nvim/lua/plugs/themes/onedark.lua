local status_ok, onedark = pcall(require, "onedark")
if not status_ok then
  return
end

local lualine_ok, lualine = pcall(require, "lualine")
if lualine_ok then
  lualine.setup {
    options = {
      theme = 'onedark'
    }
  }
end


vim.o.termguicolors = true
vim.o.background = 'dark'
vim.g.onedark_terminal_italics = 2

onedark.setup {
  style = 'darker',
  transparent = true,
  colors = {
    bright_orange = "#ff8800",    -- define a new color
    green = '#00ffaa',            -- redefine an existing color
  },
  highlights = {
    TSKeyword = {fg = '$green'},
    TSString = {fg = '$bright_orange', bg = '#00ff00', fmt = 'bold'},
    TSFunction = {fg = '#0000ff', sp = '$cyan', fmt = 'underline,italic'},
  }
}

onedark.load()

vim.cmd [[colorscheme onedark]]
