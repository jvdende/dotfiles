return {
  { "kylechui/nvim-surround", version = "*", event = "VeryLazy", config = true },
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
      }
    }
  },
  {
    "ThePrimeagen/harpoon",
    lazy = false,
    branch = "harpoon2",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    keys = {
      { "<leader>a", function() require("harpoon"):list():add() end, desc = 'Harpoon add' },
      { "<C-S-P>", function() require("harpoon"):list():prev() end, desc = 'Harpoon previous' },
      { "<C-S-N>", function() require("harpoon"):list():next() end, desc = 'Harpoon next' },
      {
        "<C-e>",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = 'Harpoon quick menu'
      },
    },
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      settings = {
        save_on_toggle = true,
      }
    }
  },
}
