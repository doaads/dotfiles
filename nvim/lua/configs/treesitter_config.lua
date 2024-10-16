  require'nvim-treesitter.configs'.setup {
	-- Modules and its options go here
	auto_install = true,
	highlight = {
		enable = true,
		disable = { 
			"latex"
			-- "markdown"
		},
	},
	incremental_selection = { enable = true },
	textobjects = { 
		enable = true,
	},
}

