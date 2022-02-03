Vim TETRIS Paste in Lua
====


## Intro.

This is a Lua rewrite of [Rasukarusan/vim-tetris-paste](https://github.com/Rasukarusan/vim-tetris-paste), 
so NeoVim users can also play with it. Works nicely on nightly.

https://user-images.githubusercontent.com/24765272/152363153-6f0c542e-0ea0-4eea-b34f-73644b34c5eb.mov

Inline

https://user-images.githubusercontent.com/24765272/152428612-a7b219d2-ee60-463c-89d9-adba4df9a339.mov


## Usage (packer.nvim)

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
vim.cmd[[
  hi TetrisBlock guifg=#ffffff guibg=#dd6900
]]
```

----

(Original Content)

## Original Demo

<img src="https://user-images.githubusercontent.com/17779386/69538032-bbfabd80-0fc4-11ea-85e2-4da46b2317b8.gif" width=700>


## Requirement

- NeoVim(0.5) // I change this to 0.5, for no reason
- +clipboard

This script use `floating window` and some neovim method.
