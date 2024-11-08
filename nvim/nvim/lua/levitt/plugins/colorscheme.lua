-- return {
--   "folke/tokyonight.nvim",
--   priority = 1000,
--   config = function()
--     local transparent = false -- set to true if you would like to enable transparency
--
--     local bg = "#011628"
--     local bg_dark = "#011423"
--     local bg_highlight = "#143652"
--     local bg_search = "#0A64AC"
--     local bg_visual = "#275378"
--     local fg = "#CBE0F0"
--     local fg_dark = "#B4D0E9"
--     local fg_gutter = "#627E97"
--     local border = "#547998"
--
--     require("tokyonight").setup({
--       style = "night",
--       transparent = transparent,
--       styles = {
--         sidebars = transparent and "transparent" or "dark",
--         floats = transparent and "transparent" or "dark",
--       },
--       on_colors = function(colors)
--         colors.bg = bg
--         colors.bg_dark = transparent and colors.none or bg_dark
--         colors.bg_float = transparent and colors.none or bg_dark
--         colors.bg_highlight = bg_highlight
--         colors.bg_popup = bg_dark
--         colors.bg_search = bg_search
--         colors.bg_sidebar = transparent and colors.none or bg_dark
--         colors.bg_statusline = transparent and colors.none or bg_dark
--         colors.bg_visual = bg_visual
--         colors.border = border
--         colors.fg = fg
--         colors.fg_dark = fg_dark
--         colors.fg_float = fg
--         colors.fg_gutter = fg_gutter
--         colors.fg_sidebar = fg_dark
--       end,
--       on_highlights = function(highlights, colors)
--         highlights.Keyword = { fg = "#cc619e", bold = true }
--         highlights.Variable = { fg = "#8BE9FD" }
--         highlights.Constant = { fg = "#BD93F9" }
--         highlights.Function = { fg = "#206431" }
--         highlights.String = { fg = "#FFFFFF" }
--         highlights.Comment = { fg = "#6272A4", italic = true }
--         -- Add more highlight groups as needed
--       end,
--     })
--
--     vim.cmd("colorscheme tokyonight")
--   end,
-- }

return {
  -- Add nvim-andromeda
  {
    "nobbmaestro/nvim-andromeda",
    dependencies = { "tjdevries/colorbuddy.nvim" },
    config = function()
      require("andromeda").setup({
        preset = "andromeda",
        transparent_bg = true,
        colors = {
          background = "#23262e",
          mono_1 = "#2f323c",
          mono_2 = "#3a3e4b",
          mono_3 = "#464959",
          mono_4 = "#606064",
          mono_5 = "#a0a1a7",
          mono_6 = "#d5ced9",
          primary = "#00e8c6",
          secondary = "#ff00aa",
        },
        styles = {
          italic = true,
        },
      })

      -- Apply the colorscheme
      vim.cmd("colorscheme andromeda")

      -- Set comments to italic
      vim.cmd([[highlight Comment cterm=italic gui=italic]])
    end,
  },

  -- Add lualine and configure it with andromeda theme
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nobbmaestro/nvim-andromeda" },
    config = function()
      local andromeda_lualine = require("andromeda.plugins.lualine")

      require("lualine").setup({
        options = {
          theme = andromeda_lualine.theme,
        },
        sections = andromeda_lualine.sections,
        inactive_sections = andromeda_lualine.inactive_sections,
      })
    end,
  },
}
