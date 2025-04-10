function SetColorscheme(color)
  color = color or "onedark"
  vim.cmd.colorscheme(color)
end

return {
  {
    'catppuccin/nvim',
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      transparent_background = true,
      no_italic = true,
      color_overrides = {
        mocha = {
          base = "#000000",
          mantle = "#000000",
          crust = "#000000",
        },
      },
    },
    config = function(_, opts)
      require('catppuccin').setup(opts)
    end
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      options = {
        transparent = true,
      }
    }
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        sidebars = 'transparent',
        floats = 'transparent',
      },
    }
  },
  {
    'projekt0n/github-nvim-theme',
    lazy = false,
    priority = 1000,
    opts = {
      options = {
        transparent = true,
        terminal_colors = true,
      }
    },
    config = function(_, opts)
      require('github-theme').setup(opts)
    end
  },
  {
    "rose-pine/neovim",
    priority = 1000,
    opts =  {
      styles = {
        bold = false,
        italic = false,
        transparency = true,
      }
    },
    config = function(_, opts)
      require('rose-pine').setup(opts)
    end
  },
  {
    'navarasu/onedark.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      style = 'dark',
      transparent = true,
      term_colors = true,
      lualine = { transparent = true },
      telescope = { transparent = true },
      diagnostics = {
        darker = true,
      },
      colors = {
        black = "#0e1013",
        bg0 = "#1f2329",
        bg1 = "#282c34",
        bg2 = "#30363f",
        bg3 = "#323641",
        bg_d = "#181b20",
        bg_blue = "#61afef",
        bg_yellow = "#e8c88c",
      }
    },
    config = function(_, opts)
      require('onedark').setup(opts)
      SetColorscheme('onedark')
    end,
  },
}
