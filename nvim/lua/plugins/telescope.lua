return {
  {
    "nvim-telescope/telescope.nvim", branch = "0.1.x",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-ui-select.nvim" },
    },
    keys = {
      { "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Telescope find files" },
      { "<C-f>", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Telescope buffers" },
      { "z=", "<cmd>Telescope spell_suggest<cr>", desc = "Telescope spell suggest" },
    },
    opts = {
      pickers = {
        buffers = {
          show_all_buffers = true,
          sort_mru = true,
        },
        find_files = {
          hidden = true,
          -- no_ignore = true,
        },
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
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {}
        }
      }
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("ui-select")
    end,
  },
}
