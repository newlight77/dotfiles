local status_ok, lines = pcall(require, "indent_blankline")
if not status_ok then
  return
end

lines.setup {
    -- for example, context is off by default, use this to turn it on
    -- This highlights the name of block (Eg. Function name or class name, etc)
    show_current_context = false,
    show_current_context_start = true,
}