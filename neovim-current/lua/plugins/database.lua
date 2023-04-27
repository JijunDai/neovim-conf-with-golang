return {
    {
        "tpope/vim-dadbod",
        dependencies = {
            "kristijanhusak/vim-dadbod-ui",
            "kristijanhusak/vim-dadbod-completion",
        },
        opts = {
            db_competion = function()
                require("cmp").setup.buffer({ sources = { { name = "vim-dadbod-completion" } } })
            end,
        },
        config = function(_, opts)
            vim.g.db_ui_save_location = vim.fn.stdpath("config") .. require("plenary.path").path.sep .. "db_ui"
            vim.g.db_ui_use_nerd_fonts = 1
            vim.g.db_ui_show_help = 0

            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "sql",
                },
                command = [[setlocal omnifunc=vim_dadbod_completion#omni]],
            })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "sql",
                    "mysql",
                    "plsql",
                },
                callback = function()
                    vim.schedule(opts.db_completion)
                end,
            })
        end,
        keys = {
            { "<leader>Dt", "<cmd>DBUIToggle<cr>", desc = "Toggle UI" },
            { "<leader>Df", "<cmd>DBUIFindBuffer<cr>", desc = "Find Buffer" },
            { "<leader>Dr", "<cmd>DBUIRenameBuffer<cr>", desc = "Rename Buffer" },
            { "<leader>Dq", "<cmd>DBUILastQueryInfo<cr>", desc = "Last Query Info" },
        },
    },
}
