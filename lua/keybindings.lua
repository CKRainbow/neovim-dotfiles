-- Leader key <leader>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
local mapset = vim.keymap.set
local opt = { noremap = true, silent = true }
local expr_opt = { noremap = true, silent = true, expr = true }

-- map('模式', '按键', '映射后按键', opt)
map("", "H", "^", opt)
map("", "L", "$", opt)


if vim.g.vscode then
  map("", "<Space>", "<Nop>", opt)

  map("n", "<Leader><Leader>", "<Cmd>lua require('vscode-neovim').call('workbench.action.quickOpen')<CR>", opt)

  map("n", "zO", "<Cmd>call VSCodeNotify('editor.unfoldAll')<CR>", opt)
  map("n", "zC", "<Cmd>call VSCodeNotify('editor.foldAll')<CR>", opt)
  map("n", "zo", "<Cmd>call VSCodeNotify('editor.unfold')<CR>", opt)
  map("n", "zc", "<Cmd>call VSCodeNotify('editor.fold')<CR>", opt)
else
  map("n", "<C-u>", "9k", opt)
  map("n", "<C-d>", "9j", opt)

  -- visual模式下连续缩进代码？
  map('v', '<', '<gv', opt)
  map('v', '>', '>gv', opt)

  -- 分屏相关
  map("n", "sv", ":vsp<CR>", opt)
  map("n", "sh", ":sp<CR>", opt)
  map("n", "sc", "<C-w>c", opt)
  map("n", "so", "<C-w>o", opt) -- close others

  -- 分屏之间跳转
  map("n", "<A-h>", "<C-w>h", opt)
  map("n", "<A-j>", "<C-w>j", opt)
  map("n", "<A-k>", "<C-w>k", opt)
  map("n", "<A-l>", "<C-w>l", opt)

  -- nvim-tree
  map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)

  -- bufferline 左右Tab切换
  map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
  map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
  -- 关闭当前 buffer
  map("n", "<leader>bc", ":bdelete %<CR>", opt)
  map("n", "<leader>bo", ":BufferLineCloseLeft<CR>:BufferLineCloseRight<CR>", opt)
  -- disable esc
  map("i", "<esc>", "<nop>", opt)
  map("i", "jk", "<esc>", opt)

  -- codeium
  -- vim.g.codeium_disable_bindings = 1
  -- mapset("i", "<M-Enter>", function()
  --   return vim.fn['codeium#Accept']()
  -- end, expr_opt)
  -- mapset("i", "<Tab>", function()
  --   return vim.fn['codeium#CycleCompletions'](1)
  -- end, expr_opt)
  -- mapset("i", "<S-Tab>", function()
  --   return vim.fn['codeium#CycleCompletions'](-1)
  -- end, expr_opt)
  -- mapset("i", "<C-x>", function()
  --   return vim.fn['codeium#Clear']()
  -- end, expr_opt)
  -- mapset("i", "<C-e>", function()
  --   return vim.fn['codeium#Complete']()
  -- end, expr_opt)
end
