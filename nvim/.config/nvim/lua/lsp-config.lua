local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {}
    print('server: ' .. server.name)

    -- (optional) Customize the options passed to the server
    if server.name == "tsserver" then
        local options = {
          on_attach = custom_attach,
          root_dir = function (pattern) return util.root_pattern("package.json", "tsconfig.json", ".git")(pattern) or vim.loop.cwd() end ,
          filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
          cmd = { "typescript-language-server", "--stdio" }
        }

	server:setup(options)
    else	
        -- This setup() function is exactly the same as lspconfig's setup function.
        -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
        server:setup(opts)
    end

end)
