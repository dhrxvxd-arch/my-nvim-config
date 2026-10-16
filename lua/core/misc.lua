
function ColorMyPencils()
  color = "rose-pine-moon"
  vim.cmd.colorscheme(color)

  if not vim.g.neovide then
    local transparent_groups = {
      "Normal",
      "NormalNC",
      "NormalFloat",
      "FloatBorder",
      "SignColumn",
      "EndOfBuffer",
      "LineNr",
      "FoldColumn",
      "StatusLine",
      "StatusLineNC",
      "TabLine",
      "TabLineFill",
      "TabLineSel",
      "WinSeparator",
      "NeoTreeNormal",
      "NeoTreeNormalNC",
    }

    for _, group in ipairs(transparent_groups) do
      vim.api.nvim_set_hl(0, group, { bg = "none" })
    end

    vim.opt.cursorline = true
    vim.api.nvim_set_hl(0, "CursorLine", {
      bg = "#363347",
    })
    vim.api.nvim_set_hl(0, "CursorLineNr", {
      link = "LineNr",
    })
  else
    local groups = {
      "Normal",
      "NormalNC",
      "NormalFloat",
      "SignColumn",
      "EndOfBuffer",
      "NeoTreeNormal",
      "NeoTreeNormalNC",
    }

    for _, group in ipairs(groups) do
      vim.api.nvim_set_hl(0, group, { bg = "#1d2021" })
    end
  end
end

local state = {
  terminal = {
    buf = -1,
    win = -1,
  },
  scratchpad = {
    buf = -1,
    win = -1,
  },
}

local function create_floating_window(opts)
  opts = opts or {}

  local width = opts.width or math.floor(vim.o.columns * 0.8)
  local height = opts.height or math.floor(vim.o.lines * 0.8)

  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  local buf
  if opts.buf and vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    style = "minimal",
    border = "rounded",
  })

  return {
    buf = buf,
    win = win,
  }
end

local function toggle_terminal()
  if not vim.api.nvim_win_is_valid(state.terminal.win) then
    state.terminal = create_floating_window({
      buf = state.terminal.buf,
    })

    if vim.bo[state.terminal.buf].buftype ~= "terminal" then
      vim.cmd.terminal()
    end

    vim.cmd.startinsert()
  else
    vim.api.nvim_win_hide(state.terminal.win)
  end
end

local function toggle_scratchpad()
  if not vim.api.nvim_win_is_valid(state.scratchpad.win) then
    state.scratchpad = create_floating_window({
      buf = state.scratchpad.buf,
    })
  else
    vim.api.nvim_win_hide(state.scratchpad.win)
  end
end

local function open_project()
  local path = vim.fn.input("Open project: ", "", "dir")

  if path == "" then
    return
  end

  path = vim.fn.expand(path)

  if vim.fn.isdirectory(path) == 0 then
    vim.notify("Not a directory: " .. path, vim.log.levels.ERROR)
    return
  end

  vim.cmd("cd " .. vim.fn.fnameescape(path))
  vim.cmd("Neotree reveal")
end

vim.api.nvim_create_user_command("OpenProject", open_project, {
	desc = "Find and open project file" })
vim.api.nvim_create_user_command("FloaTerminal", toggle_terminal, {
	desc = "Toggle floating terminal" })
vim.api.nvim_create_user_command("ScratchPad", toggle_scratchpad, {
	desc = "Toggle scratchpad" })

