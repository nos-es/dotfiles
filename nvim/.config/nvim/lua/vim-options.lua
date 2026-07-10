-- Basic vim settings for indent and spaces
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- See linenumbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Config to see errors and warnings right on the specific line.
vim.diagnostic.config({
  virtual_text = true,   -- inline text on the line
  signs = true,          -- icons in the sign column (gutter)
  underline = true,      -- underline the problematic part
  update_in_insert = false,
  severity_sort = true,
})

