return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
          require("neo-tree").setup({
      ---...other options
        filesystem = {
          window = {
            mappings = {
              -- Make the mapping anything you want
              ["R"] = "easy",
            },
          },
          commands = {
            ["easy"] = function(state)
              local node = state.tree:get_node()
              local path = node.type == "directory" and node.path or vim.fs.dirname(node.path)
              require("easy-dotnet").create_new_item(path, function()
                require("neo-tree.sources.manager").refresh(state.name)
              end)
            end
          }
        },
      })
		vim.keymap.set("n", "<leader>fs", ":Neotree filesystem reveal left<CR>")
	end,
}
