
return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "rcarriga/nvim-dap-ui",  -- Interface for nvim-dap
      {
        "theHamsta/nvim-dap-virtual-text",  -- Adds virtual text annotations for DAP
        opts = {},
      },
    },
    config = function()
      -- Set up nvim-dap-ui (visual interface for nvim-dap)
      local dap_ui = require("dapui")
      dap_ui.setup()
      local dap, dapui = require("dap"), require("dapui")

      vim.fn.sign_define('DapBreakpoint',{ text ='🔴', texthl ='', linehl ='', numhl =''})
      vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})

      -- Open and close dap-ui automatically when debugging
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

      -- Set up nvim-dap-virtual-text (displays virtual text for debugging)
      local dap_virtual_text = require("nvim-dap-virtual-text")
      dap_virtual_text.setup()

      -- Optionally, you can configure other things like custom keybindings or UI settings here
    end,
  }
}
