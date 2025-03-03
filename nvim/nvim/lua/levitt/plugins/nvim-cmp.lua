-- return {
--   "hrsh7th/nvim-cmp",
--   event = "InsertEnter",
--   dependencies = {
--     "hrsh7th/cmp-buffer", -- source for text in buffer
--     "hrsh7th/cmp-path", -- source for file system paths
--     {
--       "L3MON4D3/LuaSnip",
--       -- follow latest release.
--       version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
--       -- install jsregexp (optional!).
--       build = "make install_jsregexp",
--     },
--     "saadparwaiz1/cmp_luasnip", -- for autocompletion
--     "rafamadriz/friendly-snippets", -- useful snippets
--     "onsails/lspkind.nvim", -- vs-code like pictograms
--   },
--   config = function()
--     local cmp = require("cmp")
--
--     local luasnip = require("luasnip")
--
--     local lspkind = require("lspkind")
--
--     -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
--     require("luasnip.loaders.from_vscode").lazy_load()
--
--     cmp.setup({
--       completion = {
--         completeopt = "menu,menuone,preview,noselect",
--       },
--       snippet = { -- configure how nvim-cmp interacts with snippet engine
--         expand = function(args)
--           luasnip.lsp_expand(args.body)
--         end,
--       },
--       mapping = cmp.mapping.preset.insert({
--         ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
--         ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
--         ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--         ["<C-f>"] = cmp.mapping.scroll_docs(4),
--         ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
--         ["<C-e>"] = cmp.mapping.abort(), -- close completion window
--         ["<CR>"] = cmp.mapping.confirm({ select = false }),
--       }),
--       -- sources for autocompletion
--       sources = cmp.config.sources({
--         { name = "nvim_lsp"},
--         { name = "luasnip" }, -- snippets
--         { name = "buffer" }, -- text within current buffer
--         { name = "path" }, -- file system paths
--       }),
--
--       -- configure lspkind for vs-code like pictograms in completion menu
--       formatting = {
--         format = lspkind.cmp_format({
--           maxwidth = 50,
--           ellipsis_char = "...",
--         }),
--       },
--     })
--   end,
-- }

-- Auto-completion / Snippets
return {
  -- https://github.com/hrsh7th/nvim-cmp
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    -- Snippet engine & associated nvim-cmp source
    -- https://github.com/L3MON4D3/LuaSnip
    "L3MON4D3/LuaSnip",
    -- https://github.com/saadparwaiz1/cmp_luasnip
    "saadparwaiz1/cmp_luasnip",

    -- LSP completion capabilities
    -- https://github.com/hrsh7th/cmp-nvim-lsp
    "hrsh7th/cmp-nvim-lsp",

    -- Additional user-friendly snippets
    -- https://github.com/rafamadriz/friendly-snippets
    "rafamadriz/friendly-snippets",
    -- https://github.com/hrsh7th/cmp-buffer
    "hrsh7th/cmp-buffer",
    -- https://github.com/hrsh7th/cmp-path
    "hrsh7th/cmp-path",
    -- https://github.com/hrsh7th/cmp-cmdline
    "hrsh7th/cmp-cmdline",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    require("luasnip.loaders.from_vscode").lazy_load()
    luasnip.config.setup({})

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- scroll backward
        ["<C-f>"] = cmp.mapping.scroll_docs(4), -- scroll forward
        ["<C-Space>"] = cmp.mapping.complete({}), -- show completion suggestions
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
        -- Tab through suggestions or when a snippet is active, tab to the next argument
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        -- Tab backwards through suggestions or when a snippet is active, tab to the next argument
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- lsp
        { name = "luasnip" }, -- snippets
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
      }),
      window = {
        -- Add borders to completions popups
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
    })
  end,
}
