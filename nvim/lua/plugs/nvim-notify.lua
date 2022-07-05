local status_ok, nvim_notify = pcall(require, "notify")
if not status_ok then
    return
end

nvim_notify.setup({
    -- Animation style
    stages = "fade_in_slide_out",
    -- Default timeout for notifications
    timeout = 1500,
    background_colour = "#2E3440"
})

vim.notify = nvim_notify
