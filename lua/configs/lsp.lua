vim.diagnostic.config({
  virtual_text = {
    source = "if_many",
    prefix = "●",
    spacing = 2,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.o.updatetime = 300
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focusable = false })]]
