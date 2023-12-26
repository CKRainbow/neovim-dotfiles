local servers = {
  "lua_ls",
  "tsserver",
  "biome",
}

require("mason").setup({
  ui = {
    icons = {
      package_installed = "√",
      package_pending = "->",
      package_uninstalled = "×"
    }
  }
})

require("mason-nvim-dap").setup({
  ensure_installed = {
    "chrome",
  }
})

------------ lint --------------
require("lint").linters_by_ft = {
  javascript = {
    "biomejs"
  },
  typescript = {
    "biomejs"
  },
}

vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
  callback = function()
    local lint_status, lint = pcall(require, "lint")
    if lint_status then
      lint.try_lint()
    end
  end
})

---------- formatter --------------
require("conform").setup({
  formatter_by_ft = {
    typescript = { "biome" },
    javascript = { "biome" },
  },
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  },
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end
})

---------- lsp config -------------
require("mason-lspconfig").setup({
  ensure_installed = servers,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
  }

  server = vim.split(server, "@")[1]

  local require_ok, conf_opts = pcall(require, "lsp.settings." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end

  lspconfig[server].setup(opts)
end

require("lsp.handlers").setup()
