local octo = require("octo")
local wk = require("which-key")

octo.setup({
  picker = "snacks",
  gh_cmd = vim.fn.expand('$HOME/Development/dotfiles/zsh/scripts/gh.sh'),
  ssh_aliases = {
    ['.*%.github%.com'] = 'github.com'
  }
})
