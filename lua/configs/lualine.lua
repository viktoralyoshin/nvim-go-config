require('lualine').setup {
  options = {
    theme = "auto",
    component_separators = '',
    section_separators = { left = '\u{e0b4}', right = '\u{e0b6}' },
    icons_enabled = true,
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '\u{e0b6}' }, right_padding = 2 }
    },
    lualine_b = {
      { 'branch', icon = '\u{e725}' },
      {
        'diff',
        symbols = {
          added = '\u{eadc} ',
          modified = '\u{eade} ',
          removed = '\u{eadf} ',
        },
      }
    },
    lualine_c = {
      {
        'filename',
        path = 1,
        symbols = {
          modified = ' ●',
          readonly = ' \u{f023}',
          unnamed = ' \u{f29c}',
        }
      }
    },
    lualine_x = {
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = {
          error = '\u{f057} ',
          warn = '\u{f071} ',
          info = '\u{f05a} ',
          hint = '\u{f059} ',
        },
      },
      'encoding',
      'fileformat'
    },
    lualine_y = {
      {
        'filetype',
        icons_enabled = true,
        icon = { align = 'right' }
      },
      'progress'
    },
    lualine_z = {
      { 'location', separator = { right = '\u{e0b4}' }, left_padding = 2 }
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  extensions = { 'nvim-tree', 'toggleterm', 'quickfix' },
}