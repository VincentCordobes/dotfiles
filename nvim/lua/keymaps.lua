function map(tbl, f)
  local t = {}
  for k, v in pairs(tbl) do
    t[k] = f(v)
  end
  return t
end

vim.keymap.set("n", "<leader>a", ':Grep<space>""<left>', { desc = "Grep" })

vim.keymap.set("v", "<leader>a", function()
  local lines = vim.fn.getregion(
    vim.fn.getpos("v"),
    vim.fn.getpos("."),
    { type = vim.fn.mode() }
  )
  local is_multiline = #lines > 1
  if is_multiline then
    -- default to regex pattern
    local lines = map(lines, function(line)
      return vim.fn.escape(line, ".*[]^${}()|?+\\")
    end)
    local line = table.concat(lines, "\\n")
    local line = vim.fn.escape(line, "|")
    return string.format("<esc>:Grep -U -- %s", vim.fn.shellescape(line, 1))
  else
    local line = lines[1]
    local line = vim.fn.escape(line, "|")
    return string.format("<esc>:Grep -F -- %s", vim.fn.shellescape(line, 1))
  end
end, { expr = true, desc = "Grep visual selection" })
vim.keymap.set("n", "<leader><space>", "<cmd>noh<cr>", {
  desc = "Clear hlsearch",
  silent = true,
})

-- Dont go to the next occurence on * search
vim.keymap.set(
  "n",
  "*",
  [[:let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>]],
  {
    desc = "Star search",
    silent = true,
  }
)

vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

vim.keymap.set("n", "<Up>", "gk")
vim.keymap.set("n", "<Down>", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "j", "gj")

vim.keymap.set("x", "Q", ":'<,'>:normal @q<CR>")
