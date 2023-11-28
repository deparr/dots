require('notify').setup({
    fps = 60,
    stages = 'fade',
    timeout = 3000,
    icons = require('nvim-nonicons.extentions.nvim-notify'),
    background_colour = '#000000'
})

vim.notify = require('notify')

