local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()

local nvim_lsp = require('lspconfig')

nvim_lsp.hls.setup({
      on_attach = on_attach,
      root_dir = vim.loop.cwd,
      settings = {
          haskell = {
              hlintOn = true,
          }
       }
  })

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

require('lspconfig.ui.windows').default_options.border = 'double'

-- Variable rename popup
local function dorename(win)
  local new_name = vim.trim(vim.fn.getline('.'))
  vim.api.nvim_win_close(win, true)
  vim.lsp.buf.rename(new_name)
end

local function rename()
  local opts = {
    relative = 'cursor',
    row = 0,
    col = 0,
    width = 30,
    height = 1,
    style = 'minimal',
    border = 'single'
  }
  local cword = vim.fn.expand('<cword>')
  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buf, true, opts)
  local fmt =  '<cmd>lua Rename.dorename(%d)<CR>'

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, {cword})
  vim.api.nvim_buf_set_keymap(buf, 'i', '<CR>', string.format(fmt, win), {silent=true})
end

_G.Rename = {
   rename = rename,
   dorename = dorename
}

vim.api.nvim_set_keymap('n', 'rn', '<cmd>lua Rename.rename()<CR>', {silent = true})

-- Github Copilot
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-A>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
