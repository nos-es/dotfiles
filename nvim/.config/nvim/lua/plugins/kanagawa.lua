return {
  'rebelot/kanagawa.nvim',
  -- The config function will be executed when the plugin is loaded.
  -- It also runs the default setup function of the plugin: require(PLUGINNAME).setup(opts)
  config = function()
    -- Color Scheme
    vim.cmd("colorscheme kanagawa-dragon")
  end
}
