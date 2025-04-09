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
  {
    'echasnovski/mini.surround', enabled = false, version = false,
    opts = {
      mappings = {
        add = "gsa", -- Add surrounding in Normal and Visual modes
        delete = "gsd", -- Delete surrounding
        find = "gsf", -- Find surrounding (to the right)
        find_left = "gsF", -- Find surrounding (to the left)
        highlight = "gsh", -- Highlight surrounding
        replace = "gsr", -- Replace surrounding
        update_n_lines = "gsn", -- Update `n_lines`
      },
    },
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = 'LspAttach', -- Or `LspAttach`
    priority = 1000,    -- needs to be loaded in first
    opts = {
      preset = 'simple',
      signs = {
        diag = "●",
        arrow = '',
      },
      options = {
        show_source = true,
        multilines = true,
        -- show_all_diags_on_cursorline = true,
      }
    },
    config = function(_, opts)
      require('tiny-inline-diagnostic').setup(opts)
      vim.diagnostic.config({ virtual_text = false })
    end
  },
}
