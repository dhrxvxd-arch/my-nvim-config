return {
  "s1n7ax/nvim-window-picker",
  name = 'window-picker',
  enabled = false,
  event = 'VeryLazy',
  version = '2.*',
  config = function()
    require'window-picker'.setup()
  end,
}
