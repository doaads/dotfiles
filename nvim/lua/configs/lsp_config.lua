require("mason").setup()
require("mason-lspconfig").setup({
})

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	--require("lsp-format").on_attach(client, bufnr)  -- FOR LSP FORMAT, NOT USED NOW

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap=true, silent=true, buffer=bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wl', function()
	  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	--	vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
	vim.keymap.set('n', 'g?', vim.diagnostic.open_float, bufopts)
end

local coq = require "coq"
local lsp_flags = {
	debounce_text_changes = 150,
}

--require'lspconfig'.pyright.setup(coq.lsp_ensure_capabilities( {
--	on_attach = on_attach,
--}))

require'lspconfig'.pyright.setup(( {
	on_attach = on_attach,
}))

--require'lspconfig'.ccls.setup(coq.lsp_ensure_capabilities( {
--	on_attach = on_attach,
--	init_options = {
--		cache = {
--			directory = "/tmp/ccls_cache"
--		}
--	}
--}))

require'lspconfig'.clangd.setup(coq.lsp_ensure_capabilities( {
	on_attach = on_attach,
}))

require'lspconfig'.rust_analyzer.setup(coq.lsp_ensure_capabilities( {
	on_attach = on_attach,
}))

require'lspconfig'.jdtls.setup(coq.lsp_ensure_capabilities( {
	on_attach = on_attach,
}))
