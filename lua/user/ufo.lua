local status_ok, ufo = pcall(require, "ufo")
if not status_ok then
  return
end

ufo.setup({
  open_fold_hl_timeout = 150,
  close_fold_kinds = {'imports', 'comment'},
  provider_selector = function(bufnr, filetype)
    return { "treesitter", "indent" }
  end,
})


-- za -> toggle fold
-- zo -> open current fold
-- zc -> close current fold
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
vim.keymap.set('n', 'K', function()
  local winid = require('ufo').peekFoldedLinesUnderCursor()
  if not winid then
      -- choose one of coc.nvim and nvim lsp
      vim.lsp.buf.hover()
  end
end)
