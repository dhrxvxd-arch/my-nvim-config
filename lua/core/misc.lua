
function ColorMyPencils()
  vim.cmd.colorscheme("rose-pine-moon")

  local bg = vim.g.neovide and "#1d2021" or "none"

  local groups = {
    "Normal",
    "NormalNC",
    "NormalFloat",
    "FloatBorder",
    "FloatTitle",
    "SignColumn",
    "EndOfBuffer",
    "LineNr",
    "FoldColumn",
    "StatusLine",
    "StatusLineNC",
    "WinBar",
    "WinBarNC",
    "TabLine",
    "TabLineFill",
    "TabLineSel",
    "WinSeparator",
    "MsgArea",
    "Pmenu",
    "PmenuSbar",
    "PmenuThumb",
    "NeoTreeNormal",
    "NeoTreeNormalNC",
    "TelescopeNormal",
    "TelescopeBorder",
    "NoiceCmdline",
    "NoiceCmdlinePopup",
    "NotifyBackground",
  }

  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = bg })
  end

  vim.opt.cursorline = true

  vim.api.nvim_set_hl(0, "CursorLine", {
    bg = vim.g.neovide and "#26233a" or "#363347",
  })

  vim.api.nvim_set_hl(0, "CursorLineNr", {
    link = "LineNr",
  })

  if vim.g.neovide then
    vim.g.neovide_opacity = 1.0
    vim.g.neovide_normal_opacity = 1.0
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
    border = "none",
  })

  vim.api.nvim_set_hl(0, "FloatShadow", { blend = 100 })
  vim.api.nvim_set_hl(0, "FloatShadowThrough", { blend = 100 })

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
  require("telescope.builtin").find_files({
    prompt_title = "Open Project",
    cwd = vim.fn.expand("~/dev"),
    find_command = {
      "find",
      ".",
      "-mindepth", "1",
      "-maxdepth", "1",
      "-type", "d",
    },
    attach_mappings = function(prompt_bufnr, map)
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")

      local function select_dir()
        local selection = action_state.get_selected_entry()
        if not selection then
          return
        end

        actions.close(prompt_bufnr)

        local path = vim.fn.expand("~/dev/" .. selection.value)
        vim.cmd.cd(vim.fn.fnameescape(path))
        vim.cmd("Neotree reveal")
      end

      map("i", "<CR>", select_dir)
      map("n", "<CR>", select_dir)

      return true
    end,
  })
end

vim.api.nvim_create_user_command("OpenProject", open_project, {
	desc = "Find and open project file" })
vim.api.nvim_create_user_command("FloaTerminal", toggle_terminal, {
	desc = "Toggle floating terminal" })
vim.api.nvim_create_user_command("ScratchPad", toggle_scratchpad, {
	desc = "Toggle scratchpad" })

