return {
  "saghen/blink.cmp",
  dependencies = {
    "L3MON4D3/LuaSnip", version = 'v2.*',
    "xzbdmw/colorful-menu.nvim",
  },
  version = "1.*",
  opts = {
    enabled = function() return not vim.tbl_contains({ "Avante", "AvanteInput", "markdown" }, vim.bo.filetype) end,
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono"
    },
    completion = {
      list = {
        selection = {
          auto_insert = false,
        }
      },
      menu = {
        draw = {
          -- columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } },
          components = {
            label = {
              text = function(ctx)
                return require("colorful-menu").blink_components_text(ctx)
              end,
              highlight = function(ctx)
                return require("colorful-menu").blink_components_highlight(ctx)
              end,
            },
          },
        },
      },
    },
    signature = { enabled = true },
    snippets = { preset = 'luasnip' },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
  },
}
