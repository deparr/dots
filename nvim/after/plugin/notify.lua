require('notify').setup({
    fps = 60,
    stages = 'fade',
    timeout = 3000,
    icons = require('nvim-nonicons.extentions.nvim-notify'),
})

vim.notify = require('notify')

