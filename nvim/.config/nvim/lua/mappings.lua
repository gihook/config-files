function map(mod, shortcut, command)
  vim.api.nvim_set_keymap(
    mod,
    shortcut,
    command,
    { noremap = true, silent = true }
  )
end

function nmap(shortcut, command)
  map("n", shortcut, command)
end

function imap(shortcut, command)
  map("i", shortcut, command)
end

nmap("<leader>sv", ":source $MYVIMRC<cr>")
nmap("<leader>ev", ":vs $MYVIMRC<cr>")

nmap("<C-n>", ":NvimTreeToggle<cr>")
nmap("<leader>ff", ":NvimTreeFindFile<cr>")

nmap("<C-h>", "<C-w>h")
nmap("<C-j>", "<C-w>j")
nmap("<C-k>", "<C-w>k")
nmap("<C-l>", "<C-w>l")

imap("<C-u>", "<esc>bgUwea")

-- Find files using Telescope command-line sugar.
nmap("<C-p>", "<cmd>Telescope find_files<cr>")
nmap("<leader>f", "<cmd>Telescope live_grep<cr>")
nmap("<leader>bb", "<cmd>Telescope buffers<cr>")
nmap("<leader>hh", "<cmd>Telescope help_tags<cr>")

-- LSP
nmap('K', '<cmd>Lspsaga hover_doc<cr>')
imap('<C-k>', '<cmd>Lspsaga hover_doc<cr>')
nmap('gh', '<cmd>Lspsaga lsp_finder<cr>')
nmap('<C-e>', '<cmd>Lspsaga show_line_diagnostics<CR>')
