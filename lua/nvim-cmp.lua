-- import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  return
end

-- import luasnip plugin safely
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
  return
end

-- load VSCode-like snippets from plugins (e.g., friendly-snippets)

require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- previous suggestion
    ["<Tab>"] = cmp.mapping.select_next_item(),   -- next suggestion
    ["<C-Space>"] = cmp.mapping.complete(),       -- show completion suggestions
    ["<C-e>"] = cmp.mapping.abort(),              -- close completion window
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  -- sources for autocompletion
  sources = cmp.config.sources({
    { name = "nvim_lsp" }, -- LSP
    { name = "luasnip" },  -- snippets
    { name = "buffer" },   -- text within the current buffer
    { name = "path" },     -- file system paths
  }),
})


-- Use buffer source for `/`.
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
      { name = 'path' }
    },
    {
      { name = 'cmdline' }
    })
})

-- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
-- if cmp_autopairs == nil then
--   return
-- end
--
-- cmp.event:on(
--   "confirm_done",
--   cmp_autopairs.on_confirm_done()
-- )
