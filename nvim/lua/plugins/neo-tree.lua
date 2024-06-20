return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false, -- 숨김 파일을 표시하도록 설정
          hide_gitignored = false, -- Git에 의해 무시된 파일을 표시
          hide_hidden = false,
        },
      },
      window = {
        mappings = {
          ["<cr>"] = "open_with_window_picker",
        },
      },
      commands = {
        open_with_window_picker = function(state)
          local node = state.tree:get_node()
          if node.type == "file" or node.type == "directory" then
            local picked_window_id = require("window-picker").pick_window() or vim.api.nvim_get_current_win()
            vim.api.nvim_set_current_win(picked_window_id)
            require("neo-tree.sources.filesystem").commands.open(state)
            vim.api.nvim_set_current_win(state.window)
          end
        end,
      },
    },
  },
}
