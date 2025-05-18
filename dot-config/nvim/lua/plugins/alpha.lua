-- NVIM dashboard upon calling nvim with no arguments
return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- optional icons
  config = function()
    local alpha = require'alpha'
    local dashboard = require'alpha.themes.dashboard'

    -- Set header
    dashboard.section.header.val = {
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
    }

    dashboard.section.buttons.val = {
      -- Set menu     󱦟
      dashboard.button("n", "󰝒  > New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "󰱼  > Find file", ":lua require('fzf-lua').files()<CR>"),
      dashboard.button("r", "  > Recent files", ":lua require('fzf-lua').oldfiles()<CR>"),
      dashboard.button("e", "  > Explorer", ":Neotree toggle<CR>"),
      dashboard.button("l", "󰒲  > Lazy", ":Lazy<CR>"),
      dashboard.button("c", "  > Config", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
      dashboard.button("q", "  > Quit NVIM", ":q<CR>"),
    }

    -- Footer (optional)
    dashboard.section.footer.val = "⚡ Neovim loaded with alpha-nvim"

    -- Send config to alpha
    alpha.setup(dashboard.opts)
  end
}
