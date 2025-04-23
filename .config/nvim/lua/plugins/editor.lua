return {
  { 'lewis6991/gitsigns.nvim', config = true },
  {
    'tpope/vim-fugitive',
    lazy = false,
    keys = {
      { "<leader>gs", vim.cmd.Git, desc = "Git status" },
    }
  },
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
  {
    "kylechui/nvim-surround",
    enabled = true,
    event = "VeryLazy",
    opts = {
      keymaps = {
        normal = "gsa",
        normal_cur = "gsaa",
        normal_line = "gsA",
        normal_cur_line = "gsAA",
        delete = "gsd",
        change = "gsc",
        change_line = "gsC",
      }
    }
  },
}
