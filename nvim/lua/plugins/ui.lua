return {
  { 'nvim-tree/nvim-web-devicons' },
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', config = true },
  { 'lewis6991/gitsigns.nvim', config = true },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
      }
    }
  },
  {
    'akinsho/bufferline.nvim', version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    enabled = true,
    opts = {
      options = {
        numbers = "buffer_id",
      }
    }
  },
}
