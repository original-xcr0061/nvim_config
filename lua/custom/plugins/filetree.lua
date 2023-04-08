
-- NeoTree from : https://github.com/nvim-lua/kickstart.nvim 

vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return{
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
},

-- Key map for Neotree
vim.keymap.set("n", "<leader>ft", ":Neotree<CR>", { desc = '[F]ile [T]ree' })

