vim.api.nvim_create_user_command(
  "Grep",
  function(opts)
    local cmd = string.format("silent grep! %s", opts.args)
    vim.cmd(cmd)
  end,
  { desc = "Pretty grep", nargs = "+", complete = "file_in_path", range = true }
)

vim.api.nvim_create_user_command("FlowedCopy", function()
  local old_tw = vim.o.textwidth
  vim.o.textwidth = 999999999
  vim.cmd("silent normal! gvgqgvy")
  vim.o.textwidth = old_tw
  vim.cmd("silent normal! gvgq")
end, { range = true })
