local status_ok, nvim_hop = pcall(require, "hop")
if not status_ok then
    return
end

vim.cmd [[ hi HopNextKey cterm=bold ctermfg=176 gui=bold guibg=#ff00ff guifg=#ffffff ]]
vim.cmd [[ hi HopNextKey1 cterm=bold ctermfg=176 gui=bold guibg=#ff00ff guifg=#ffffff ]]
vim.cmd [[ hi HopNextKey2 cterm=bold ctermfg=176 gui=bold guibg=#ff00ff guifg=#ffffff ]]

nvim_hop.setup({
    case_insensitive = true,
    char2_fallback_key = '<CR>',
    quit_key = '<Esc>'
})

vim.keymap.set('n', 'f', function()
    return nvim_hop.hint_char2()
end, {
    silent = true,
    noremap = true,
    desc = "nvim-hop char2"
})
