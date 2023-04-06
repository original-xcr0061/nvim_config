# nvim_config

### Installation

Starting with the following:

* Install NeoVim form ['stable'](https://github.com/neovim/neovim/releases/tag/stable) 
* Clone this repo into `$HOME/.config/nvim/`
  * If you don't want to include it as a git repo, you can just clone it and then move the files to mentioned location.
* Start Neovim (`nvim`) and allow `lazy.nvim` to complete installation.
* Restart Neovim
* **You're ready to go!**


- Make sure to review the readmes of the plugins if you are experiencing errors. In particular:
  - [ripgrep](https://github.com/BurntSushi/ripgrep#installation) is required for multiple [telescope](https://github.com/nvim-telescope/telescope.nvim#suggested-dependencies) pickers.


Distribution Alternatives:
- [LazyVim](https://www.lazyvim.org/): A delightful distribution maintained by @folke (the author of lazy.nvim, the package manager used here)


### Configuration And Extension

* There are two primary configuration options available:
  * Include the `lua/kickstart/plugins/*` files in your configuration.
  * Add new configuration in `lua/custom/plugins/*` files, which will be auto sourced using `lazy.nvim`
    * NOTE: To enable this, you need to uncomment `{ import = 'custom.plugins' }` in your `init.lua`


#### Example: Adding an autopairs plugin

In the file: `lua/custom/plugins/autopairs.lua`, add:

```lua
-- File: lua/custom/plugins/autopairs.lua

return {
  "windwp/nvim-autopairs",
  config = function()
    require("nvim-autopairs").setup {}
  end,
}
```


This will automatically install `nvim-autopairs` and enable it on startup. For more information, see documentation for [lazy.nvim](https://github.com/folke/lazy.nvim).

#### Example: Adding a file tree plugin

In the file: `lua/custom/plugins/filetree.lua`, add:

```lua
-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function ()
    require('neo-tree').setup {}
  end,
}
```

This will install the tree plugin and add the command `:NeoTree` for you. You can explore the documentation at [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) for more information.

#### Example: Adding a file to change default options

To change default options, you can add a file in the `/after/plugin/` folder (see `:help load-plugins`) to include your own options, keymaps, autogroups, and more. The following is an example `defaults.lua` file (located at `$HOME/.config/nvim/after/plugin/defaults.lua`).

```lua
vim.opt.relativenumber = true

vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
```


### FAQ

* What should I do if I already have a pre-existing neovim configuration?
  * You should back it up, then delete all files associated with it.
  * This includes your existing init.lua and the neovim files in `~/.local` which can be deleted with `rm -rf ~/.local/share/nvim/`
  * You may also want to look at the [migration guide for lazy.nvim](https://github.com/folke/lazy.nvim#-migration-guide)
* What if I want to "uninstall" this configuration:
  * See [lazy.nvim uninstall](https://github.com/folke/lazy.nvim#-uninstalling) information
* Are there any cool videos about this plugin?
  * Current iteration of kickstart (coming soon)
  * Here is one about the previous iteration of kickstart: [video introduction to Kickstart.nvim](https://youtu.be/stqUbv-5u2s).
