-- This is the init.lua file, which gets picked by vim.
-- Vim looks for scripts based on the vim runtime path.
-- :set runtimepath? will show all paths which vim looks for and sources/executes them. (like this path .config/nvim/)
-- Since nvim works with lua, it will source lua files instead of vim scripts.
-- More infos for me to read: https://neovim.io/doc/user/lua-guide.html

-- Package Manager: Lazy

-- This code looks for a path in my filesystem (.local/share/nvim...) and checks if it exists.
-- If not it will do a git clone from the official lazy repo and save the source code in this directory.
-- This code is just there to ensure the directory exists and contains the source code.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath })

    if vim.v.shell_error ~= 0 then
      vim.api.nvim_echo({
        { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
        { out, "WarningMsg" },
        { "\nPress any key to exit..." },
      }, true, {})
      vim.fn.getchar()
      os.exit(1)
    end
  end
  vim.opt.rtp:prepend(lazypath)

  -- With require i can call lua modules, which gets automatically executed
  --
  require("vim-options")

  -- This sets up all the plugins and imports all the functionality and functions to configure the plugins.
  -- This needs to be called before and configuration for plugins can be done.
  -- Lazy will automatically load plugins from the lua/plugins/ directory (this is the convention in a multi file setup).
  require("lazy").setup("plugins");
