local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
    -- package manager
    use("wbthomason/packer.nvim")

    -- LSP
    use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin

    use 'glepnir/lspsaga.nvim'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} },
        config = function()
            require("init-telescope")
        end,
    }

    -- Comment
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Statusline
    use {
        'windwp/windline.nvim',
        config = function()
            require('wlsample.evil_line')
        end
    }

    -- indent
    use({
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("init-indent")
        end,
    })

    -- gitsigns
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('gitsigns').setup()
        end
    }

    -- doom one theme
    use({
        "NTBBloodbath/doom-one.nvim",
        config = function()
            require('init-doom-one')
        end,
    })

    if packer_bootstrap then
        require('packer').sync()
    end
end)
