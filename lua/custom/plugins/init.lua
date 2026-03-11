-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
if jit.os == "Windows" then THEME_DIR = 'C:\\Users\\AndroidGamer\\AppData\\Local\\nvim\\lua\\custom\\plugins\\scarlet-forest\\'
else THEME_DIR = 'home/jake/.config/nvim/lua/custom/plugins/scarlet-forest/'
end

---@module 'lazy'
---@type LazySpec
return {
  {
    'rktjmp/lush.nvim',
    { dir = THEME_DIR, lazy = true },
  },

  {
    'lervag/vimtex',
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_imaps_enabled = 0
    end,
  },
}
