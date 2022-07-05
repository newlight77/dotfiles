local status_ok, neoscroll = pcall(require, "neoscroll")
if not status_ok then
    return
end

neoscroll.setup({
    easing_function = "quadratic"
})

local mappings = {}
-- Syntax: t[keys] = {function, {function arguments}}
-- Use the "sine" easing function
mappings["<C-u>"] = {"scroll", {"-vim.wo.scroll", "true", "20", [['cubic']]}}
mappings["<C-d>"] = {"scroll", {"vim.wo.scroll", "true", "20", [['cubic']]}}
-- Use the "circular" easing function
mappings["<C-b>"] = {"scroll", {"-vim.api.nvim_win_get_height(0)", "true", "50", [['cubic']]}}
mappings["<C-f>"] = {"scroll", {"vim.api.nvim_win_get_height(0)", "true", "50", [['cubic']]}}
-- Pass "nil" to disable the easing animation (constant scrolling speed)
mappings["<C-y>"] = {"scroll", {"-0.10", "false", "100", nil}}
mappings["<C-e>"] = {"scroll", {"0.10", "false", "100", nil}}
-- When no easing function is provided the default easing function (in this case "quadratic") will be used
mappings["zt"] = {"zt", {"10"}}
mappings["zz"] = {"zz", {"10"}}
mappings["zb"] = {"zb", {"10"}}

require("neoscroll.config").set_mappings(mappings)
