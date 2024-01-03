------------------------- hop -----------------------------

local hop = require('hop')
vim.keymap.set('', 'f', function()
  hop.hint_char1({ current_line_only = true })
end, { remap = true })
vim.keymap.set('', 'F', function()
  hop.hint_char2({})
end, { remap = true })
vim.keymap.set('', 't', function()
  hop.hint_patterns({})
end, { remap = true })
vim.keymap.set('', 'T', function()
  hop.hint_lines_skip_whitespace({})
end, { remap = true })

if vim.g.vscode then
  return
end
--------------------- lualine ----------------------------
require("treesitter-context").setup({
  enable = true,
  line_numbers = true,
})

--------------------- lualine ----------------------------
require("lualine").setup({
  options = {
    theme = "material-nvim"
  }
})
--------------------- toggleterm -------------------------
require("toggleterm").setup({
  open_mapping = [[<C-\>]],
  start_in_insert = true,
  direction = "float",
})

--------------------- dashboard --------------------------
require("dashboard").setup({
  config = {
    header = {
      '          ▀████▀▄▄              ▄█ ',
      '            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ',
      '    ▄        █          ▀▀▀▀▄  ▄▀  ',
      '   ▄▀ ▀▄      ▀▄              ▀▄▀  ',
      '  ▄▀    █     █▀   ▄█▀▄      ▄█    ',
      '  ▀▄     ▀▄  █     ▀██▀     ██▄█   ',
      '   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ',
      '    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ',
      '   █   █  █      ▄▄           ▄▀   ',
    },
    shortcut = {
      -- action can be a function type
      { desc = " Dotfile", group = '@property', key = 'e', action = 'edit $MYVIMRC' },
      { desc = " Files", group = 'Label', key = 'f', action = 'Telescope find_files' },
      { desc = " Words", group = 'DiagnosticHint', key = 'w', action = 'Telescope live_grep' },
    },
    footer = {
      "✨ Never Give Up!"
    }
  }
})

--------------------- telescope --------------------------
local telescope_builtin = require("telescope.builtin")

vim.keymap.set('n', "<leader>ff", telescope_builtin.find_files, {})
vim.keymap.set('n', "<leader>fg", telescope_builtin.live_grep, {})
vim.keymap.set('n', "<leader>fb", telescope_builtin.buffers, {})
vim.keymap.set('n', "<leader>fh", telescope_builtin.help_tags, {})
--------------------- nvim-tree --------------------------
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

require("nvim-web-devicons").setup({})

---------------------- bufferline -------------------------
require("bufferline").setup({
  options = {
    mode = "buffer",
    diagnostics = "nvim_lsp",
    offests = { {
      filetype = "NvimTree",
      text = "File Explorer",
      highlight = "Directory",
      text_align = "left",
    } }
  }
})

----------------------- nvim-treesitter ---------------------
require 'nvim-treesitter.configs'.setup {
  -- 安装 language parser
  -- :TSInstallInfo 命令查看支持的语言
  ensure_installed = {
    "c",
    "html", "css", "javascript", "typescript", "tsx",
    "lua",
    "vim", "vimdoc",
    "markdown",
  },
  -- 启用代码高亮功能
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  -- 启用增量选择
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      node_decremental = '<BS>',
      scope_incremental = '<TAB>',
    }
  },
  -- 启用基于Treesitter的代码格式化(=) . NOTE: This is an experimental feature.
  indent = {
    enable = true
  }
}
-- 开启 Folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.wo.foldlevel = 99

---------------------------- Autocomplete and Snippet ----------------------
require("nvim-cmp")

-------------------------- Comment ---------------------------------------
require("Comment").setup({
  prehook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
})
---------------------------- Language Server Protocal ----------------------
require("lsp.setup")
---------------------------- Color Scheme ----------------------------------
local colorscheme = "material"
vim.g.material_style = "darker"
require("material").setup({
  contrast = {
    terminal = true,            -- Enable contrast for the built-in terminal
    sidebars = true,            -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
    floating_windows = true,    -- Enable contrast for floating windows
    cursor_line = true,         -- Enable darker background for the cursor line
    non_current_windows = true, -- Enable contrasted background for non-current windows
    filetypes = {},             -- Specify which filetypes get the contrasted (darker) background
  },
  plugins = {                   -- Uncomment the plugins that you use to highlight them
    -- Available plugins:
    "dap",
    "dashboard",
    -- "eyeliner",
    "fidget",
    -- "flash",
    -- "gitsigns",
    -- "harpoon",
    -- "hop",
    "illuminate",
    "indent-blankline",
    -- "lspsaga",
    -- "mini",
    -- "neogit",
    -- "neotest",
    -- "neo-tree",
    -- "neorg",
    -- "noice",
    "nvim-cmp",
    -- "nvim-navic",
    "nvim-tree",
    "nvim-web-devicons",
    -- "rainbow-delimiters",
    -- "sneak",
    "telescope",
    -- "trouble",
    "which-key",
  },

  disable = {
    colored_cursor = false, -- Disable the colored cursor
    borders = false,        -- Disable borders between verticaly split windows
    background = false,     -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
    term_colors = false,    -- Prevent the theme from setting terminal colors
    eob_lines = false       -- Hide the end-of-buffer lines
  },

  high_visibility = {
    lighter = true,    -- Enable higher contrast text for lighter style
    darker = true      -- Enable higher contrast text for darker style
  },
  custom_colors = nil, -- If you want to override the default colors, set this to a function
})
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " 没有找到！")
  return
end
