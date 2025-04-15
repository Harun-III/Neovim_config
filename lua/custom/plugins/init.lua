local lint = require 'lint'

lint.linters.cpplint = {
  command = 'cpplint', -- You installed this via `pip3`
  args = { '--output=emacs', '-' },
  stream = 'stdout', -- This captures the output
  ignore_exitcode = true, -- Ignore non-zero exit codes from cpplint
}

lint.linters_by_ft = {
  cpp = { 'cpplint' }, -- Use cpplint for .cpp and .h files
  c = { 'cpplint' }, -- Use cpplint for .c files too
}

-- Auto-run linting when saving or editing files
vim.cmd [[
  augroup Linting
    autocmd!
    autocmd BufWritePost *.cpp,*.h lua require('lint').try_lint()
  augroup END
]]

-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {}
