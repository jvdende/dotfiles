local float_opts = {
  focusable = false,
  scope = 'cursor',
  -- border = 'solid',
}

vim.diagnostic.config({
  virtual_text = false,
  jump = { float = float_opts },
})

vim.api.nvim_create_autocmd('CursorMoved', {
  buffer = bufnr,
  callback = function()
    vim.diagnostic.open_float(nil, float_opts)
  end,
})
