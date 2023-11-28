-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- QOL + NAV
    use({
        'nvim-telescope/telescope.nvim',
        tag = '0.1.x',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    })
    use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })
    use({ 'ThePrimeagen/harpoon' })
    use({ 'mbbill/undotree' })
    use({ 'tpope/vim-fugitive' })
    use({ 'lewis6991/gitsigns.nvim' })
    use({ 'folke/zen-mode.nvim' })
    use({ 'andweeb/presence.nvim' })
    use({ 'ellisonleao/glow.nvim' })
    use({ 'numToStr/Comment.nvim' })
    use({ 'rcarriga/nvim-notify' })
    use({ 'kyazdani42/nvim-web-devicons' })
    use({ 'yamatsum/nvim-nonicons' })
    use({ 'tjdevries/express_line.nvim', requires = { { 'nvim-lua/plenary.nvim' } } })

    use({ 'tpope/vim-dadbod' })
    use ({ 'j-hui/fidget.nvim', tag = 'legacy'  })

    -- LSP + TREESITTER
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('nvim-treesitter/nvim-treesitter-context')
    use({
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },   -- Required
            { 'williamboman/mason.nvim' }, -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-buffer' }, -- Optional
            { 'hrsh7th/cmp-path' }, -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' }, -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },   -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    })

    -- COLORS
    use({ 'norcalli/nvim-colorizer.lua' })
    use({ 'ellisonleao/gruvbox.nvim' })
    use({
        'catppuccin/nvim',
        as = 'catppuccin'
    })
    use({ 'Mofiqul/vscode.nvim' })
    use({ 'rebelot/kanagawa.nvim' })
    use({ 'EdenEast/nightfox.nvim' })
    use({ 'folke/tokyonight.nvim' })
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
    })
    use({ 'ribru17/bamboo.nvim' })

    use({ '~/dev/tairiki.nvim/' })

    use({
        'tjdevries/gruvbuddy.nvim',
        requires = { 'tjdevries/colorbuddy.nvim' }
    })
end)
