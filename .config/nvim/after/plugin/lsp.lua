local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
	'html',
	'tsserver',
	'clangd',
})

local cmp = require('cmp')
local cmp_mappings = lsp.defaults.cmp_mappings({})
cmp_mappings['<CR>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
})

lsp.set_preferences({
    sign_icons = { }
})

lsp.on_attach(function(client, bufnr)
end)

lsp.setup()
