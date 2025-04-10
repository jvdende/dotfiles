return {
  { 'nvim-tree/nvim-web-devicons' },
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', config = true },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
        theme = "auto",
      }
    }
  },
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
