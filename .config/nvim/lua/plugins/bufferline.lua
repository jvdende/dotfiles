return {
  {
    'akinsho/bufferline.nvim', version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      options = {
        numbers = "buffer_id",
        diagnostics = "nvim_lsp",
        show_buffer_close_icons = false,
      }
    }
  },
}
