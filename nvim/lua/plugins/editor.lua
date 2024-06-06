return {
  {
    "numToStr/Comment.nvim",
    opts = {
      toggler = {
        line = '<leader>cc',
        block = '<leader>bc',
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
