-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- add list of plugins to install
return packer.startup(function(use)
  -- packer can manage itself
  use("wbthomason/packer.nvim")

  use("bluz71/vim-nightfly-guicolors") -- preferred colorscheme
  -- vs-code like icons
  use("nvim-tree/nvim-web-devicons")
  use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

  use({ "romgrk/barbar.nvim", wants = "nvim-tree/nvim-web-devicons" }) -- https://github.com/romgrk/barbar.nvim
  -- statusline
  use("nvim-lualine/lualine.nvim")
  -- file explorer
  use({
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    --   config = [[require('josean.config.nvim-tree')]],
  })
  use({
    "nvim-telescope/telescope-fzf-native.nvim", -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
    run = "make",
  })
  use({
    "nvim-telescope/telescope.nvim", -- https://github.com/nvim-telescope/telescope.nvim
    requires = {
      "nvim-lua/plenary.nvim",
    },
    branch = "0.1.x",
  })

  -- Filetypes
  use("chrisbra/csv.vim") -- https://github.com/chrisbra/csv.vim
  -- git integration
  use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side
  -- treesitter configuration
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })
  use("nvim-treesitter/nvim-treesitter-textobjects") -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects

  -- essential plugins
  use("christoomey/vim-tmux-navigator") -- tmux & split window navigation
  use("szw/vim-maximizer") -- maximizes and restores current window
  use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
  use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)
  use({ "majutsushi/tagbar" }) -- code structure
  use({ "Yggdroot/indentLine" }) -- see indentation
  use({ "tpope/vim-fugitive" }) -- git integration
  use({ "junegunn/gv.vim" }) -- commit history
  use({ "ervandew/supertab" }) -- supertab
  -- use { "kylechui/nvim-surround", tag = "*" }  -- https://github.com/kylechui/nvim-surround
  -- commenting with gc
  use("numToStr/Comment.nvim")
  -- formatting & linting
  use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
  use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls
  -- auto closing
  use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags
  -- autocompletion
  use("hrsh7th/nvim-cmp") -- completion plugin
  use("hrsh7th/cmp-buffer") -- source for text in buffer
  use("hrsh7th/cmp-path") -- source for file system paths
  -- snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets
  -- managing & installing lsp servers, linters & formatters
  use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
  use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig
  -- configuring lsp servers
  use("neovim/nvim-lspconfig") -- easily configure language servers
  use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
  use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
  use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
  use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

  use("rhysd/vim-clang-format") -- https://github.com/rhysd/vim-clang-format
  use("fatih/vim-go") -- https://github.com/fatih/vim-go
  -- fzf
  --use({ "junegunn/fzf", run = "./install --bin" })

  -- fzf-lua and not use telescope
  --use("ibhagwan/fzf-lua")
  --use({
  --  "ibhagwan/fzf-lua",
  --  -- optional for icon support
  --  requires = { "nvim-tree/nvim-web-devicons" },
  --})

  -- english grammar check
  use("rhysd/vim-grammarous")
  -- ascii image
  use("samodostal/image.nvim")

  if packer_bootstrap then
    require("packer").sync()
  end
end)