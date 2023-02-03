-- vim configurations for neovim in lua
vim.opt.encoding = 'utf-8'
vim.opt.syntax = 'on'
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.foldmethod = 'manual'
vim.opt.mouse = 'a'
vim.opt.relativenumber = true
vim.opt.backupdir='~/.cache/vim'
--vim.opt.nocompatible = true
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.cursorline = true

vim.api.nvim_exec('filetype plugin indent on',false)
vim.api.nvim_exec('let &packpath = &runtimepath',false)

vim.api.nvim_exec([[
    call plug#begin('~/.config/nvim/plugged')
        Plug 'folke/neodev.nvim'
		Plug 'preservim/NERDTree'
		Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
		Plug 'projekt0n/github-nvim-theme'
		Plug 'vim-airline/vim-airline-themes'
		Plug 'vim-airline/vim-airline'  
		Plug 'https://github.com/McSinyx/vim-octave.git',{'for':'octave'}
		Plug 'https://github.com/jalvesaq/Nvim-R.git',{'for':'R'}
		Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
		Plug 'yuezk/vim-js'
		Plug 'HerringtonDarkholme/yats.vim'
		Plug 'maxmellon/vim-jsx-pretty' 
		Plug 'neoclide/coc.nvim', {'branch': 'release'}
		Plug 'ryanoasis/vim-devicons'
		Plug 'bluz71/vim-nightfly-colors'
		Plug 'puremourning/vimspector'
    call plug#end()]]
,false)

-- Airline config
vim.g.airline_theme = 'transparent'
vim.g['airline#extensions#tabline#enabled'] = 1

-- Vimspector configuration
vim.g.vimspector_enable_mappings = 'HUMAN'
vim.g.vimspector_configurations = '~/.config/nvim/vimspector.json'

