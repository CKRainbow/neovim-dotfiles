-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'
-- jk移动时光标下上方保留8行
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
-- 缩进2个空格等于一个Tab
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftround = true
-- 搜索大小写不敏感，除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true
-- 边输入边搜索
vim.o.incsearch = true
-- 不可见字符的显示，这里只把空格显示为一个点
vim.o.list = true
vim.opt.listchars = {
  space = "·",
  tab = "--",
}

vim.o.updatetime = 300
