return {
  {
    'stevearc/oil.nvim',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { "<leader>pv", "<cmd>Oil<cr>", desc = "Open oil" },
    },
    opts = {
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
      },
      win_options = {
        winbar = "%{v:lua.require('oil').get_current_dir()}",
      },
    }
  },
}
