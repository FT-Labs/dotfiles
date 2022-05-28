local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local kmap = vim.api.nvim_set_keymap

vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

-- Goes to next closed fold
kmap("n", "zj", ":call NextClosedFold('j')<cr>", opts)
kmap("n", "zk", ":call NextClosedFold('k')<cr>", opts)

-- Window navigation
kmap("n", "<C-h>", "<C-w>h", opts)
kmap("n", "<C-j>", "<C-w>j", opts)
kmap("n", "<C-k>", "<C-w>k", opts)
kmap("n", "<C-l>", "<C-w>l", opts)


-- kmap("n", "<leader>d", ":bd<cr>", opts) Old way to delete buffer
kmap("n", "<leader>d", ":w | :Bdelete<cr>", opts) -- better way, syncs with nvim tree
kmap("n", "<leader>D", ":Bwipeout!<cr>", opts) -- close buffer without saving
kmap("n", "<Tab>h", ":vertical resize -4<cr>", opts)
kmap("n", "<Tab>l", ":vertical resize +4<cr>", opts)
kmap("n", "<Tab>j", ":resize +4<cr>", opts)
kmap("n", "<Tab>k", ":resize -4<cr>", opts)

-- Shift tab to escape current character
kmap("i", "<S-Tab>", "<right>", opts)

-- Navigate buffers
kmap("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
kmap("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)

-- F Keys
kmap("n", "<F1>", ":NvimTreeToggle<cr>", opts)
kmap("i", "<F2>", "<C-O>za", opts) -- toggle fold
kmap("n", "<F2>", "za", opts) -- toggle fold
kmap("i", "<F1>", "<C-O>:NvimTreeToggle<cr>", opts)
kmap("n", "<F4>", ":! compwrite && clear && g++ -std=c++17 -O3 %<cr> | :vsp |terminal ./a.out<inp.txt <cr>", opts)
kmap("n", "<F5>", ":! compwrite && clear && gcc -std=c99 -O3 %<cr> | :vsp |terminal ./a.out<inp.txt <cr>", opts)

-- Toggle tags
kmap("n", "<leader>t", ":SymbolsOutline<cr>", opts)
-- Restart lsp && refresh files
kmap(
  "n",
  "<leader>r",
  ":NvimTreeRefresh<cr> | :LspRestart<cr> :lua require('notify')('Lsp restarted and files refreshed',1,{title='RESTART',timeout=500})<cr>",
  opts
)

kmap("v", "<leader>e", ":<C-U>let i=0 | '<,'>g/^/s//\\=i.' '/ | let i=i+1 | nohl<CR>", opts)

-- Move text up down
kmap("v", "<A-j>", ":m .+1<CR>==", opts)
kmap("v", "<A-k>", ":m .-2<CR>==", opts)
kmap("x", "J", ":move '>+1<CR>gv-gv", opts)
kmap("x", "K", ":move '<-2<CR>gv-gv", opts)
kmap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
kmap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Better indenting
kmap("v", "<", "<gv", opts)
kmap("v", ">", ">gv", opts)
-- Ctrl+c to copy in selection mode
kmap(
  "v",
  "<C-c>",
  'y:call system("xclip -i -selection clipboard", getreg("\\""))<CR>:call system("xclip -i", getreg("\\""))<CR> :lua require("notify")("Copied to clipboard!",0,{title="CLIPBOARD",timeout=300})<CR>',
  opts
)

-- Better terminal navigation
kmap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
kmap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
kmap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
kmap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
kmap("t", "<Esc><C-\\><C-n>", ":bd!<cr>", term_opts)

kmap(
  "n",
  "<leader>f",
  "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
  opts
)
kmap("n", "<leader>F", "<cmd>Telescope find_files<cr>", opts)
kmap(
  "n",
  "<leader>k",
  "<cmd>lua require'telescope.builtin'.keymaps(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
  opts
)
kmap("n", "<c-g>", "<cmd>Telescope live_grep<cr>", opts)

require "phyvim.config.macros"
