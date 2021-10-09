-- Name: Arnold Chand
-- Github: https://github.com/creativenull
-- My vimrc, pre-requisites:
-- + python3
-- + nnn
-- + ripgrep
-- + bat
-- + Environment variables:
--   + $PYTHON3_HOST_PROG
--
-- Currently, tested on a Linux machine (maybe macOS, Windows is a bit of a stretch)
-- =============================================================================

-- Load packages on the filetype event in `after/ftplugin`
function _G.LoadCommonPackages()
  vim.cmd('packadd vim-abolish')
  vim.cmd('packadd vim-repeat')
  vim.cmd('packadd vim-surround')
  vim.cmd('packadd kommentary')

  vim.cmd('packadd indent-blankline.nvim')
  require('cnull.plugins.ui.indent_blankline')

  vim.cmd('packadd todo-comments.nvim')
  require('todo-comments').setup()
end

-- Initialize
local core = require('cnull.core')
core.setup({
  config = {
    -- Leader key
    leader = ' ',

    -- Choose one: ddc, coq, completion, cmp (default)
    autocompletion = 'cmp',

    -- Choose one: telescope, snap, fzf (default)
    finder = 'telescope',

    -- Choose one: galaxyline, feline, lualine (default)
    statusline = 'lualine',

    -- Choose one: ultisnips, vsnip, luasnip (default)
    snippets = 'luasnip',

    -- Colorscheme config
    theme = {
      name = 'moonfly',
      transparent = true,
      on_before = function()
        vim.g.moonflyNormalFloat = true
      end,
    },

    -- Adjust packer config
    plugins = {
      init = {
        compile_path = vim.fn.stdpath('data') .. '/packer_compiled.lua',
      },
    },
  },

  -- Events
  on_before = function()
    local autocmd = require('cnull.core.event').autocmd

    -- Highlight text yank
    autocmd({
      clear = true,
      event = 'TextYankPost',
      exec = function()
        vim.highlight.on_yank({ higroup = 'Search', timeout = 500 })
      end,
    })
  end,

  on_after = function()
    require('cnull.user.keymaps')
    require('cnull.user.options')
    require('cnull.user.abbreviations')

    -- Custom user commands
    require('cnull.user.conceal')
    require('cnull.user.codeshot')
  end,
})
