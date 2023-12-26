local fn = vim.fn

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local nvim_tree_plugin = {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {}
  end,
}

local bufferline_plugin = {
  'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'
}

local nvim_treesitter_plugin = {
  "nvim-treesitter/nvim-treesitter", build = ":TSUpdate"
}

local nvim_autopairs_plugin = {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {}
}
local lexima_vim_plugin = {
  "cohama/lexima.vim",
  event = { "InsertEnter", "CmdlineEnter" },
}

local comment_plugin = {
  "numToStr/Comment.nvim",
  opts = {},
  lazy = false,
}

local nvim_surround_plugin = {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      -- Configuration here, or leave empty to use defaults
    })
  end
}

local hop_plugin = {
  "phaazon/hop.nvim",
  version = "v2",
  config = function()
    require("hop").setup({
      case_insensitive = true,
      multi_windows = true,
    })
  end
}

local nvim_telescope_plugin = {
  "nvim-telescope/telescope.nvim",
  version = "0.1.5",
  dependencies = {
    "nvim-lua/plenary.nvim"
  }
}

local which_key_plugin = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 100
  end,
  opts = {

  }
}

local dashboard_plugin = {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" }
  }
}

local term_toggle_plugin = {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {

  }
}

-- git plugin
local vim_fugitive_plugin = {
  "tpope/vim-fugitive"
}

-- context display for treesitter
local nvim_treesitter_context_plugin = {
  "nvim-treesitter/nvim-treesitter-context"
}

-- statusline
local lualine_plugin = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  }
}

-- indent line
local indent_blankline_plugin = {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opt = {},
  config = function()
    require("ibl").setup({
      exclude = {
        filetypes = {
          "dashboard"
        }
      }
    })
  end
}

-- lsp loading process
local fidget_plugin = {
  "j-hui/fidget.nvim",
  opts = {}
}


if vim.g.vscode then
  require("lazy").setup({
    nvim_surround_plugin,
    hop_plugin,
  })
else
  require("lazy").setup(
    {
      -- autocomplete
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      -- snippets
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      -- theme
      "rebelot/kanagawa.nvim",
      -- util plugins
      nvim_tree_plugin,
      bufferline_plugin,
      nvim_treesitter_plugin,
      "rrethy/vim-illuminate",
      -- nvim_autopairs_plugin,
      lexima_vim_plugin,
      comment_plugin,
      "JoosepAlviste/nvim-ts-context-commentstring",
      "mg979/vim-visual-multi",
      nvim_surround_plugin,
      hop_plugin,
      nvim_telescope_plugin,
      which_key_plugin,
      dashboard_plugin,
      term_toggle_plugin,
      lualine_plugin,
      indent_blankline_plugin,
      fidget_plugin,
      vim_fugitive_plugin,
      nvim_treesitter_context_plugin,
      -- lsp
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      -- dap
      "mfussenegger/nvim-dap",
      "jay-babu/mason-nvim-dap.nvim",
      -- lint
      "mfussenegger/nvim-lint",
      -- formatter
      "stevearc/conform.nvim",
    }
  )
end

require("plugin_setup")
