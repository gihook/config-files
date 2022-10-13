local function map(mod, shortcut, command)
	vim.api.nvim_set_keymap(mod, shortcut, command, { noremap = true, silent = true })
end

local function nmap(shortcut, command)
	map("n", shortcut, command)
end

local function imap(shortcut, command)
	map("i", shortcut, command)
end

local function vmap(shortcut, command)
	map("v", shortcut, command)
end

vmap("<C-c>", '"+y')
imap("<C-v>", '<esc>"+pa')

nmap("<space>sv", ":source $MYVIMRC<cr>")
nmap("<space>ev", ":vs $MYVIMRC<cr>")

nmap("<C-n>", ":NERDTreeToggle<cr>")
nmap("<space>ff", ":NERDTreeFind<cr>")
-- nmap("<space>fs", ":Rg<cr>")
nmap("<space>fs", ":lua require('telescope.builtin').live_grep()<cr>")
-- nmap("<space>b", ":Buffers<cr>")
nmap("<space>b", ":lua require('telescope.builtin').buffers()<cr>")

nmap("<C-h>", "<C-w>h")
nmap("<C-j>", "<C-w>j")
nmap("<C-k>", "<C-w>k")
nmap("<C-l>", "<C-w>l")

-- nmap("<C-p>", ":Files<cr>")
nmap("<C-p>", ":lua require('telescope.builtin').find_files()<cr>")

nmap("<M-h>", ":tabprev")
nmap("<M-l>", ":tabnext")

imap("<C-u>", "<esc>bgUwea")

-- LSP
nmap("gd", ":lua vim.lsp.buf.definition()<cr>")
nmap("gD", ":lua vim.lsp.buf.declaration()<cr>")
nmap("gi", ":lua vim.lsp.buf.implementation()<cr>")
nmap("gr", ":lua vim.lsp.buf.references()<cr>")

nmap("K", ":Lspsaga hover_doc<cr>")

nmap("gs", ":Lspsaga signature_help<CR>")

nmap("gh", ":Lspsaga lsp_finder<cr>")

nmap("<space>fa", ":lua vim.lsp.buf.format()<cr>")

nmap("<space>ac", ":Lspsaga code_action <cr>")
nmap("<space>rn", ":Lspsaga rename<cr>")
