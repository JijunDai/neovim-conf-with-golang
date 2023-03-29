-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("plugins-setup")
require("core.options")
require("core.keymaps")
require("core.colorscheme")
require("plugins.nvim-web-devicons")
require("plugins.lualine")
require("plugins.nvim-tree")
require("plugins.comment")
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.gitsigns")
require("plugins.nvim-cmp")
require("plugins.barbar")
require("plugins.nvim-surround")
require("plugins.autopairs")
require("plugins.lsp.mason")
require("plugins.lsp.lspsaga")
require("plugins.lsp.lspconfig")
require("plugins.lsp.null-ls")
