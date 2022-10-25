local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    underline = true,
    signs = true,
  }
)
vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float({scope="line"})]]
vim.cmd [[autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]]

local cmp = require'cmp'
local lspkind = require('lspkind')

cmp.setup({
    window = {
        completion = { cmp.config.window.bordered(), winhighlight = 'FloatBorder:Border' },
        documentation = { cmp.config.window.bordered(), winhighlight = 'FloatBorder:Border' },
    },
})

cmp.setup {
  formatting = {
    format = lspkind.cmp_format(),
  },
}
require("mason").setup({
    ui = {
         border = "double",
    },
})
