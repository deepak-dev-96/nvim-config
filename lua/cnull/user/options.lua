local undodir = vim.fn.stdpath('cache') .. '/undo'

if vim.fn.isdirectory(undodir) == 0 then
  if vim.fn.has('win32') == 1 then
    vim.fn.system({'mkdir', undodir})
  else
    vim.fn.system({'mkdir', '-p', undodir})
  end
end

-- Completion options
vim.opt.completeopt = {'menuone', 'noinsert', 'noselect'}
vim.opt.shortmess:append('c')

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Editor
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.showmatch = true
vim.opt.wrap = false
vim.opt.colorcolumn = '120'
vim.opt.scrolloff = 5
vim.opt.lazyredraw = true
vim.opt.spell = false

-- System
vim.opt.encoding = 'utf-8'
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.updatetime = 250
vim.opt.undofile = true
vim.opt.undodir = undodir
vim.opt.undolevels = 10000
vim.opt.history = 10000
vim.opt.backspace = {'indent', 'eol', 'start'}
vim.opt.ttimeoutlen = 50
vim.opt.mouse = ''
vim.opt.wildignorecase = true

-- UI
vim.opt.hidden = true
vim.opt.signcolumn = 'yes'
vim.opt.cmdheight = 2
vim.opt.showtabline = 2
vim.opt.laststatus = 2
