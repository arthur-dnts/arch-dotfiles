return {
  "Vigemus/iron.nvim",
  keys = {
    { "<leader>rs", desc = "Iron: start REPL" },
    { "<leader>rr", desc = "Iron: restart REPL" },
    { "<leader>rf", desc = "Iron: focus REPL" },
    { "<leader>rh", desc = "Iron: hide REPL" },
    { "<leader>rl", desc = "Iron: send line" },
    { "<leader>rc", desc = "Iron: send code block (cell)" },
  },
  config = function()
    local iron = require("iron.core")

    iron.setup({
      config = {
        scratch_repl = true,
        repl_definition = {
          python = {
            command = function()
            local venv = vim.env.VIRTUAL_ENV
            if venv then
                return { venv .. "/bin/ipython", "--no-autoindent" }
            end
            return { "ipython", "--no-autoindent" }
            end,
            format = require("iron.fts.common").bracketed_paste,
          },
        },
        repl_open_cmd = require("iron.view").split.vertical.botright(0.4),
      },
      keymaps = {
        send_motion = "<leader>rc",
        visual_send = "<leader>rc",
        send_file = "<leader>rf",
        send_line = "<leader>rl",
        send_paragraph = "<leader>rp",
        cr = "<leader>r<cr>",
        interrupt = "<leader>r<c-c>",
        exit = "<leader>rq",
        clear = "<leader>rl",
      },
      highlight = {
        italic = true,
      },
      ignore_blank_lines = true,
    })

    vim.keymap.set({ "n", "v" }, "<leader>rs", "<cmd>IronRepl<cr>", { desc = "Iron: start REPL" })
    vim.keymap.set({"n", "v" }, "<leader>rr", "<cmd>IronRestart<cr>", { desc = "Iron: restart REPL" })
    vim.keymap.set({"n", "v" }, "<leader>rF", "<cmd>IronFocus<cr>", { desc = "Iron: focus REPL" })
    vim.keymap.set({"n", "v"}, "<leader>rh", "<cmd>IronHide<cr>", { desc = "Iron: hide REPL" })
  end,
}
