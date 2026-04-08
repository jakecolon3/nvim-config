vim.loader.enable()

-- # hooks
local hooks = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind

  -- treesitter update hook
  if name == 'nvim-treesitter' and kind == 'update' then
    if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
    vim.cmd('TSUpdate')
  end
end

vim.api.nvim_create_autocmd('PackChanged', { callback = hooks })

local gh = function(url)
    return 'https://github.com/' .. url
end

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- # netrw opts
-- sets the size in percentage of the window created when splitting
vim.g.netrw_winsize = 80

-- disables the banner by default (I to re-enable it)
-- bugged with wayland so it has to be off for now
-- vim.g.netrw_banner = 0

-- freaks out if this is on default
-- vim.g.netrw_clipboard = 0

-- sets the default <cr> behaviour to "use the last accessed window" (splits if none are open)
vim.g.netrw_browse_split = 4

-- [[ options ]]
require 'options'

-- [[ keymaps ]]
require 'keymaps'

-- [[ autocommands ]]
require 'autocommands'
