return{
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            local servers = {"lua_ls", "tsserver", "jdtls"}
            require("mason-lspconfig").setup({
                ensure_installed = servers
            })
            local lspconfig = require("lspconfig")
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            for _, lsp in ipairs(servers) do
                lspconfig[lsp].setup({
                    capabilities = capabilities
                })
            end
        end
    },
    {
        "neovim/nvim-lspconfig",
    },
}
