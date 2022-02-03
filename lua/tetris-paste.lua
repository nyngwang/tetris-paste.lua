local NOREF_NOERR_TRUNC = { noremap = true, silent = true, nowait = true }
local NOREF_NOERR = { noremap = true, silent = true }
local EXPR_NOREF_NOERR_TRUNC = { expr = true, noremap = true, silent = true, nowait = true }
---------------------------------------------------------------------------------------------------

local M = {}
M.delay_ms = 10

local function move_floating_window(win_id, relative, row, col)
  local newConfig = {
    relative = relative,
    row = row,
    col = col,
  }
  vim.api.nvim_win_set_config(win_id, newConfig)
  vim.cmd('redraw')
end

local function create_window(config)
  local buf = vim.api.nvim_create_buf(false, true)
  local win_id = vim.api.nvim_open_win(buf, true, config)
  vim.cmd('hi TetrisBlock guifg=#ffffff guibg=#dd6900')

  vim.api.nvim_win_set_option(win_id, 'winhighlight', 'Normal:TetrisBlock')
  vim.api.nvim_win_set_option(win_id, 'winblend', 40)
  return win_id
end

local function transparency_window(win_id)
  local i = 0
  while i <= 50 do
    vim.api.nvim_win_set_option(win_id, 'winblend', i*2)
    i = i + 1
    if i % 2 == 0 then vim.cmd('redraw') end
  end
end

local function get_col()
  if not vim.o.number then return 0 end
  return vim.fn.line('$') + 1
end

local function get_width()
  return string.len(vim.fn.getreg('@*'))
end

local function get_height()
  return #vim.fn.split(vim.fn.getreg('@*'), '\n')
end

local function paste_to_current_window(number_of_line)
    if number_of_line == 1 then
      vim.fn.setreg('@*', vim.fn.substitute(vim.fn.getreg('@*'),'\n', '', 'g') .. '\n')
    end
    vim.cmd('normal! p')
end

local function insert_empty_line(row)
    local i = 0
    while i < row do
      vim.cmd("call append(expand('.'), '')")
      i = i + 1
    end
end

local function delete_empty_line(row)
  vim.cmd('normal! ' .. row ..'j')
  vim.cmd('normal! ' .. row ..'"_dd')
  vim.cmd('normal! ' .. row ..'k')
end
---------------------------------------------------------------------------------------------------
function M.setup(opts)
  M.delay_ms = opts.delay_ms
end

function M.main()
  local start_row = 10
  local col = get_col()
  local width = get_width()
  local height = get_height()
  local config = {
    relative = 'editor',
    row = start_row,
    col = col,
    width = width,
    height = height,
    anchor = 'NW',
    style = 'minimal'
  }
  if width == 0 or height == 0 then return end

  local win_id = create_window(config)

  vim.cmd("normal! P")
  vim.cmd("0windo :")

  -- " floating windowを上から降らす
  local move_y = vim.fn.line('.') - vim.fn.line('w0') - start_row + 1
  local i = 0
  while i <= move_y do
    move_floating_window(win_id, config.relative, config.row + i + 1, config.col)
    vim.cmd('sleep '..M.delay_ms..'ms')
    i = i + 1
  end

  insert_empty_line(height)

  transparency_window(win_id)

  paste_to_current_window(height)

  delete_empty_line(height)

  vim.api.nvim_win_close(win_id, true)
end



local function setup_vim_commands()
  vim.cmd [[
    command! TetrisPaste lua require'tetris-paste'.main()
  ]]
end

setup_vim_commands()

return M
