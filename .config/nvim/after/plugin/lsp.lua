local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
	'html',
	'tsserver',
	'clangd',
})

lsp.set_preferences({
    sign_icons = { }
})

lsp.on_attach(function(client, bufnr)
end)

lsp.setup()
