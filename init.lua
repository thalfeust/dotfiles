-- Nvim Session loader for TMUX.
function ConstructNvimSessionFileName()
  local session_id_raw = vim.fn.system('tmux display-message -p "#{session_id}"'):gsub('\n', '')
  local session_id = session_id_raw:gsub('^$', '')
  local window_index = vim.fn.system('tmux display-message -p "#{window_index}"'):gsub('\n', '')
  local pane_index = vim.fn.system('tmux display-message -p "#{pane_index}"'):gsub('\n', '')
  return vim.fn.getcwd() .. '/.TmuxNvimSession-' .. session_id .. '-' .. window_index .. '-' .. pane_index .. '.vim'
end

function StartTmuxPaneNvimSession()
  if vim.fn.exists("$TMUX_PANE") == 1 then
    local session_file = ConstructNvimSessionFileName()
    -- print('Attempting to load Tmux Pane Nvim Session from ' .. session_file)
    if vim.fn.filereadable(session_file) == 1 then
      vim.cmd('source ' .. session_file)
      print("Loading Session from " .. session_file)
    end
    vim.cmd('Obsession ' .. session_file)
    print("Saving Session to " .. session_file)
    -- Reload buffer to re-enable syntax highlighting and a few issues
    vim.defer_fn(function() 
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_name(buf) ~= "" then
          vim.api.nvim_buf_call(buf, function() vim.cmd('e') end)
        end
      end
    end, 100)
  end
end

if vim.fn.exists('$TMUX') == 1 then
  vim.cmd('autocmd VimEnter * lua StartTmuxPaneNvimSession()')
end