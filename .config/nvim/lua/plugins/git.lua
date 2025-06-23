return {
  { 'lewis6991/gitsigns.nvim', config = true },
  {
    'tpope/vim-fugitive',
    lazy = false,
    keys = {
      { "<leader>gs", vim.cmd.Git, desc = "Git status" },
    }
  },
}
