Vim TETRIS Paste in Lua
====

## Important

I'm not the author. I just found this fun so I spent some minutes (~~to get some downvotes on the forum~~)
translating it into Lua version, so more people can play with it. Yup, I'm just a promotion guy :P

if you want to give a star please go here __first__: [Rasukarusan/vim-tetris-paste](https://github.com/Rasukarusan/vim-tetris-paste)

## Tested On

I have tested it on the `master` branch of neovim, working fine :)

```
NVIM v0.7.0-dev+994-g5be2cdd91
Build type: Release
LuaJIT 2.1.0-beta3
```

## Usage (packer.nvim)

```lua
use {
  'nyngwang/tetris-paste.lua'
}
vim.keymap.set('n', 'p', function() vim.cmd('TetrisPaste') end, {nowait=true, noremap=true, silent=true})
```

----

(Original Content)

## Original Demo

<img src="https://user-images.githubusercontent.com/17779386/69538032-bbfabd80-0fc4-11ea-85e2-4da46b2317b8.gif" width=700>


## Requirement

- NeoVim(0.5) // I change this to 0.5, for no reason
- +clipboard

This script use `floating window` and some neovim method.
