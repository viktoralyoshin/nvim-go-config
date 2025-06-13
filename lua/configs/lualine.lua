local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white },
  },
  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },
  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white },
  },
}

require('lualine').setup {
  options = {
    theme = bubbles_theme,
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
        diff_color = {
          added = { fg = colors.cyan },
          modified = { fg = colors.blue },
          removed = { fg = colors.red },
        }
      }
    },
    lualine_c = {
      {
        'filename',
        path = 1,  -- Показывать относительный путь
        symbols = {
          modified = ' ●',  -- Иконка измененного файла
          readonly = ' \u{f023}',  -- Иконка только для чтения
          unnamed = ' \u{f29c}',   -- Иконка для безымянного буфера
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