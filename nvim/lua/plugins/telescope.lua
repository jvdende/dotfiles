return {
  {
    "nvim-telescope/telescope.nvim", branch = "0.1.x",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
      { "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Telescope find files" },
      { "<C-f>", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Telescope buffers" },
    },
    opts = {
      pickers = {
        buffers = {
          show_all_buffers = true,
          sort_mru = true,
        },
        find_files = {
          hidden = true
        }
      },
      defaults = {
        file_ignore_patterns = { ".git/", "node_modules" },
        mappings = {
          i = {
            ["<C-k>"] = "move_selection_previous",
            ["<C-j>"] = "move_selection_next",
          },
        }
      },
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("fzf")
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  }
}
