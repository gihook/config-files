local function map(mod, shortcut, command)
  vim.api.nvim_set_keymap(
    mod,
    shortcut,
    command,
    { noremap = true, silent = true }
  )
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

vmap("<C-c>", '<esc>"+y')
imap("<C-v>", '<esc>"+pa')

nmap("<space>sv", ":source $MYVIMRC<cr>")
nmap("<space>ev", ":vs $MYVIMRC<cr>")

nmap("<C-n>", ":NERDTreeToggle<cr>")
nmap("<space>ff", ":NERDTreeFind<cr>")
nmap("<space>fs", ":Rg<cr>")
nmap("<space>b", ":Buffers<cr>")

nmap("<C-h>", "<C-w>h")
nmap("<C-j>", "<C-w>j")
nmap("<C-k>", "<C-w>k")
nmap("<C-l>", "<C-w>l")

nmap("<C-p>", ":Files<cr>")

nmap("<M-h>", ":tabprev")
nmap("<M-l>", ":tabnext")

imap("<C-u>", "<esc>bgUwea")

-- LSP

nmap('gd', ':lua vim.lsp.buf.definition()<cr>')
nmap('gD', ':lua vim.lsp.buf.declaration()<cr>')
nmap('gi', ':lua vim.lsp.buf.implementation()<cr>')
nmap('gr', ':lua vim.lsp.buf.references()<cr>')
nmap('K', ':lua vim.lsp.buf.hover()<cr>')
nmap('<space>ac', ':lua vim.lsp.buf.code_action()<cr>')
nmap('<space>rn', ':lua vim.lsp.buf.rename()<cr>')

nmap('<space>f', ':lua vim.lsp.buf.formatting_sync()<cr>')
