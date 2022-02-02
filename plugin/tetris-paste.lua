if vim.fn.has("nvim-0.5") == 0 then
  return
end

if vim.g.loaded_tetris_paste_lua ~= nil then
  return
end

require('tetris-paste')

vim.g.loaded_tetris_paste_lua = 1
