local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
	'html',
	'tsserver',
	'clangd',
})

lsp.on_attach(function(client, bufnr)
end)
lsp.setup()


