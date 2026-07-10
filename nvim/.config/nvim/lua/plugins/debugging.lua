return {
	"mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "mfussenegger/nvim-dap-python",
    "leoluz/nvim-dap-go",
  },
	config = function()

    local dap, dapui = require("dap"), require("dapui")
    dapui.setup()

    require("dap-python").setup("python3")
    -- If using the above, then `python3 -m debugpy --version`
    -- must work in the shell

    -- dap ui startung with nvim dap
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.keymap.set('n', '<F5>', function() dap.continue() end)
    vim.keymap.set('n', '<F10>', function() dap.step_over() end)
    vim.keymap.set('n', '<F11>', function() dap.step_into() end)
    vim.keymap.set('n', '<F12>', function() dap.step_out() end)
    vim.keymap.set('n', '<Leader>db', function() dap.toggle_breakpoint() end)
    vim.keymap.set('n', '<Leader>dB', function() dap.set_breakpoint() end)
    vim.keymap.set('n', '<Leader>dlp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
    vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end)

  end,
}
