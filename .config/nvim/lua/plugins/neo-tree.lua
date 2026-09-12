return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("neo-tree").setup({
          enable_git_status = true,
          enable_diagnostics = true,
          filesystem = {
              follow_current_file = { enabled = true },
              use_libuv_file_watcher = true,
          },
          window = {
              postion = "left",
              width = 30
          },
          -- source_selector = {
          --     winbar = true,
          --     statusline = true
          -- },
      })
      vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { silent = true, noremap = true })
    end,
  }
}
