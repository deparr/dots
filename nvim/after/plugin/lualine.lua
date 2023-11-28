local hasLL, lualine = pcall(require, 'lualine')
local hasEl = pcall(require, 'el')
if not hasLL or hasEl then
  return
end
lualine.setup({
  options = {
    theme = 'auto',
    globalstatus = true,
    always_divide_middle = false,
    component_separators = { left = '', right = '' }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {
      'branch',
      --{ 'diagnostics', sources = { 'nvim_lsp' } }
    },
    lualine_c = {
      '%=',
      {
        'filetype',
        icon = { align = 'right' },
        icon_only = true,
        colored = false,
        separator = '',
        padding = { left = 1, right = 1 }
      },
      {
        'filename',
        separator = '',
        padding = { left = 1, right = 1 }
      }
    },
    lualine_x = {
      {
        'fileformat',
        symbols = {
          unix = 'lf',
          dos = 'crlf',
          mac = 'lf'
        },
        color = { fg = '#696969' }
      },
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = { 'quickfix' }
})

