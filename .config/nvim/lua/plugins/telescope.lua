local builtin = require('telescope.builtin')

return {
  {
    "nvim-telescope/telescope.nvim", branch = "0.1.x",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-ui-select.nvim" },
    },
    keys = {
      { "<C-p>", builtin.find_files, desc = "Telescope find files" },
      { "<leader>fg", builtin.git_files, desc = "Telescope git files" },
      { "<C-f>", builtin.live_grep, desc = "Telescope live grep" },
      { "<leader>fb", builtin.buffers, desc = "Telescope buffers" },
      { "<leader>pws", function ()
        local word = vim.fn.expand("<cword>")
        builtin.grep_string({ search = word })
      end },
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
        file_ignore_patterns = { ".git", "node_modules" },
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
