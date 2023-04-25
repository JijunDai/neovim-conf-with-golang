local function keymap(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

local wk = require("which-key")

vim.o.timeoutlen = 250

wk.setup({
    show_help = false,
    show_keys = false,
    key_labels = { ["<leader>"] = "SPC" },
})

-- better moving keys
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

keymap("n", "<C-;>", "<cmd>tabnext<CR>")
keymap("n", "<C-.>", "<cmd>tabprevious<CR>")

keymap("t", "<ESC>", "<C-\\><C-n>")

keymap("n", "<C-s>", "<cmd> w <CR>")

keymap("i", "<C-z>", "<C-O>u")

-- nitpicky stuff
keymap("n", "J", "mzJ`z")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- better indentation
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- better moving lines
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- undotree

-- resizing
keymap("n", "<C-Up>", ":resize -2<CR>")
keymap("n", "<C-Down>", ":resize +2<CR>")
keymap("n", "<C-Left>", ":vertical resize -2<CR>")
keymap("n", "<C-Right>", ":vertical resize +2<CR>")

-- U = redo
keymap("n", "U", "<C-r>")

-- lsp
keymap("n", "K", ":lua vim.lsp.buf.hover()<CR>")

keymap("t", "<C-h>", "<cmd>wincmd h<CR>")
keymap("t", "<C-j>", "<cmd>wincmd j<CR>")
keymap("t", "<C-k>", "<cmd>wincmd k<CR>")
keymap("t", "<C-l>", "<cmd>wincmd l<CR>")

keymap("t", "<C-Up>", "<cmd>resize -2<CR>")
keymap("t", "<C-Down>", "<cmd>resize +2<CR>")
keymap("t", "<C-Left>", "<cmd>vertical resize -2<CR>")
keymap("t", "<C-Right>", "<cmd>vertical resize +2<CR>")
-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

vim.keymap.set("n", "<leader>dc", '<cmd>lua require"dap".continue()<CR>', { desc = "Debug continue" })
vim.keymap.set("n", "<leader>dsv", '<cmd>lua require"dap".step_over()<CR>', { desc = "Debug step_over" })
vim.keymap.set("n", "<leader>dsi", '<cmd>lua require"dap".step_into()<CR>', { desc = "Debug step_into" })
vim.keymap.set("n", "<leader>dso", '<cmd>lua require"dap".step_out()<CR>', { desc = "Debug step_out" })
vim.keymap.set("n", "<leader>dbp", '<cmd>lua require"dap".toggle_breakpoint()<CR>', { desc = "Toggle breakpoint" })
vim.keymap.set(
    "n",
    "<leader>dpc",
    '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
    { desc = "Set breakpoint condition" }
)
vim.keymap.set(
    "n",
    "<leader>dpm",
    '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',
    { desc = "Set breakpoint message" }
)
vim.keymap.set("n", "<leader>dro", '<cmd>lua require"dap".repl.open()<CR>', { desc = "repl.open" })
vim.keymap.set("n", "<leader>drl", '<cmd>lua require"dap".repl.run_last()<CR>', { desc = "repl.run_last" })

local leader = {
    ["f"] = {
        name = "+telescope",
        ["f"] = { "<cmd> Telescope find_files <CR>", "Find Files" },
        ["a"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find All Files" },
        ["e"] = { "<cmd> Telescope file_browser <CR>", "File Browser" },
        ["w"] = { "<cmd> Telescope live_grep <CR>", "Live Grep" },
        ["b"] = { "<cmd> Telescope buffers <CR>", "Buffers" },
        ["h"] = { "<cmd> Telescope help_tags <CR>", "Help Tags" },
        ["o"] = { "<cmd> Telescope oldfiles <CR>", "Old Files" },
        ["c"] = { "<cmd> Telescope colorscheme <CR>", "Colorschemes" },
    },
    ["<TAB>"] = {
        name = "+tab",
        ["<tab>"] = { "<cmd>tabnew<CR>", "New Tab" },
        ["n"] = { "<cmd>tabnext<CR>", "Next" },
        ["d"] = { "<cmd>tabclose<CR>", "Close" },
        ["p"] = { "<cmd>tabprevious<CR>", "Previous" },
    },
    ["b"] = {
        name = "+buffer",
        ["d"] = { "<cmd>bd<CR>", "Delete Buffer" },
        ["n"] = { "<cmd>BufferLineCycleNext<CR>", "Next Buffer" },
        ["p"] = { "<cmd>BufferLineCyclePrev<CR>", "Prev Buffer" },
        ["c"] = { "<cmd>BufferLinePickClose<CR>", "Close Buffer" },
        ["1"] = { "<cmd>BufferLineGoToBuffer 1<CR>", "GoTo Buffer 1" },
        ["2"] = { "<cmd>BufferLineGoToBuffer 2<CR>", "GoTo Buffer 2" },
        ["3"] = { "<cmd>BufferLineGoToBuffer 3<CR>", "GoTo Buffer 3" },
        ["4"] = { "<cmd>BufferLineGoToBuffer 4<CR>", "GoTo Buffer 4" },
        ["5"] = { "<cmd>BufferLineGoToBuffer 5<CR>", "GoTo Buffer 5" },
        ["6"] = { "<cmd>BufferLineGoToBuffer 6<CR>", "GoTo Buffer 6" },
        ["7"] = { "<cmd>BufferLineGoToBuffer 7<CR>", "GoTo Buffer 7" },
        ["8"] = { "<cmd>BufferLineGoToBuffer 8<CR>", "GoTo Buffer 8" },
        ["9"] = { "<cmd>BufferLineGoToBuffer 9<CR>", "GoTo Buffer 9" },
        ["m"] = {
            name = "+move",
            ["n"] = { "<cmd>BufferLineMoveNext<CR>", "Next Buffer" },
            ["p"] = { "<cmd>BufferLineMovePrev<CR>", "Prev Buffer" },
        },
    },
    ["o"] = {
        name = "+open",
        ["t"] = { "<cmd> ToggleTerm size=20<CR>", "Terminal" },
        ["f"] = { "<cmd> NvimTreeToggle<CR>", "File Explorer" },
        ["d"] = { "<cmd> DiffviewOpen<CR>", "DiffView" },
        ["g"] = { "<cmd> Neogit<CR>", "Neogit" },
    },
    ["u"] = { "<cmd> UndotreeToggle<CR>", "Undo Tree" },
    ["g"] = {
        name = "+goto",
        ["d"] = { "<cmd> Telescope lsp_definitions<CR>", "Definition" },
        ["i"] = { "<cmd> Telescope lsp_implementation<CR>", "Implementation" },
        ["r"] = { "<cmd> Telescope lsp_references<CR>", "References" },
    },
    ["c"] = {
        name = "+code",
        ["r"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
        ["f"] = { "<cmd> FormatWrite<CR>", "Format Document" },
    },
}

wk.register(leader, { prefix = "<leader>" })
