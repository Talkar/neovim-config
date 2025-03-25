return {
  "GustavEikaas/easy-dotnet.nvim",
  dependencies = { "nvim-lua/plenary.nvim", 'nvim-telescope/telescope.nvim', "mfussenegger/nvim-dap" },
  config = function()
    -- Easy-Dotnet setup
    local dotnet = require("easy-dotnet")
    dotnet.setup()

    -- DAP Configuration for .NET Debugging
    local dap = require("dap")
    local debug_dll = nil

    local function rebuild_project(co, path)
      local spinner = require("easy-dotnet.ui-modules.spinner").new()
      spinner:start_spinner("Building")
      vim.fn.jobstart(string.format("dotnet build %s", path), {
        on_exit = function(_, return_code)
          if return_code == 0 then
            spinner:stop_spinner("Built successfully")
          else
            spinner:stop_spinner("Build failed with exit code " .. return_code, vim.log.levels.ERROR)
            error("Build failed")
          end
          coroutine.resume(co)
        end,
      })
      coroutine.yield()
    end

    local function ensure_dll()
      if debug_dll ~= nil then
        return debug_dll
      end
      local dll = dotnet.get_debug_dll()
      debug_dll = dll
      return dll
    end

    -- Register .NET DAP configurations for cs and fsharp
    for _, value in ipairs({ "cs", "fsharp" }) do
      dap.configurations[value] = {
        {
          type = "coreclr",
          name = "launch - netcoredbg",
          request = "launch",
          env = function()
            local dll = ensure_dll()
            local vars = dotnet.get_environment_variables(dll.project_name, dll.relative_project_path)
            return vars or nil
          end,
          program = function()
            local dll = ensure_dll()
            local co = coroutine.running()
            rebuild_project(co, dll.project_path)
            return dll.relative_dll_path
          end,
          cwd = function()
            local dll = ensure_dll()
            return dll.relative_project_path
          end,
        }
      }
    end
    -- Clear the debug DLL after termination
    dap.listeners.before['event_terminated']['easy-dotnet'] = function()
      debug_dll = nil
    end

    -- Configure the DAP adapter for .NET (using netcoredbg)
    dap.adapters.coreclr = {
      type = "executable",
      command = "netcoredbg",
      args = { "--interpreter=vscode" },
    }

    -- Set key mappings or additional functionality for testing (optional)
    vim.keymap.set("n", "<leader>rt", dotnet.testrunner, {})

    -- dap keybindings
    vim.keymap.set("n", "<leader>db", function()
      require("dap").toggle_breakpoint()
    end, { noremap = true, silent = true, desc = "Toggle Breakpoint" })

    vim.keymap.set("n", "<leader>dc", function()
      require("dap").continue()
    end, { noremap = true, silent = true, desc = "Continue" })

    vim.keymap.set("n", "<leader>di", function()
      require("dap").step_into()
    end, { noremap = true, silent = true, desc = "Step into" })
  end
}
