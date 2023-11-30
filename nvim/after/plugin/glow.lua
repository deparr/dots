require('glow').setup({
    install_path = '~/.local/bin',
    border = 'shadow',
})

vim.keymap.set('n', '<leader>rp', [[<cmd>Glow<CR>]])
