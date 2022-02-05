Vim TETRIS Paste in Lua
====


## Ref.

[Rasukarusan/vim-tetris-paste](https://github.com/Rasukarusan/vim-tetris-paste)
with some enhencements, including:

- inline-paste
- delay-tuning
- correct calculation on line-number / git-sign toggled
- correct calculation on multiple v-split

## Install

```lua
use {
  'nyngwang/tetris-paste.lua',
  config = function ()
    require('tetris-paste').setup {
      delay_ms = 10 -- default
    }
  end
}
vim.keymap.set('n', 'p', function() vim.cmd('TetrisPaste') end, {nowait=true, noremap=true, silent=true})
vim.cmd[[ hi TetrisBlock guifg=#ffffff guibg=#dd6900 ]]
```
