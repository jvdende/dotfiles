return {
  {
    'github/copilot.vim',
    enabled = true,
    config = function ()
      vim.keymap.set('i', '<M-y>', 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })
      vim.g.copilot_no_tab_map = true
    end
  },
  {
    "yetone/avante.nvim",
    enabled = false,
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      -- "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
    opts = {
      -- hints = { enabled = false },
      provider = "openrouter",
      auto_suggestions_provider = "openrouter",
      behaviour = {
        auto_suggestions = true,
      },
      vendors = {
        openrouter = {
          __inherited_from = "openai",
          endpoint = "https://openrouter.ai/api/v1",
          model = "anthropic/claude-3.5-sonnet",
          api_key_name = "OPENROUTER_API_KEY",
          max_tokens = 8192,
        }
      },
    },
    config = function(_, opts)
      require('avante').setup(opts)
      -- views can only be fully collapsed with the global statusline
      vim.opt.laststatus = 3
    end,
  },
}
