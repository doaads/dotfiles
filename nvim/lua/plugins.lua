--[[
-- File containing all plugin definitions listed in following categories:
-- * LSP - Mason + lspconfig
-- * Treesitter
-- * Completion - COQ
-- * Telescope
-- * QoL - general QoL plugins and eyecandy
-- * Editor - main editor window looks and behaviour
-- * Utility - Other, including markdown docs
-- * Colorschemes
--]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim' -- packer

	-- -------- LSP / Linters --------------

	use {
		"williamboman/mason.nvim", -- mason
		"williamboman/mason-lspconfig.nvim",
		'neovim/nvim-lspconfig',
		'kosayoda/nvim-lightbulb', -- show lightbulb at code action
		'mfussenegger/nvim-lint', -- linters
	}

	-- -------- Treesitter --------------

	use {
		'nvim-treesitter/nvim-treesitter',
		'nvim-treesitter/nvim-treesitter-context',
		'nvim-treesitter/nvim-treesitter-textobjects',
	}

	-- -------- Completion --------------
	
	use {
		'ms-jpq/coq_nvim',
		requires = {
			'ms-jpq/coq.artifacts',
		}
	}

	-- --------- Telescope --------------
	-- fuzzy finding, ripgrep file finding
	
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'BurntSushi/ripgrep',
			'sharkdp/fd',
		}
	}

	-- --------- Visual / QoL -----------------
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		}
	}
	
	use {
		'romgrk/barbar.nvim', -- tablines
		'nvim-lualine/lualine.nvim', -- statusline
		'xiyaowong/transparent.nvim', -- transparency
	}

	-- ---------- Editor -----------------------
	
	use {
		'lukas-reineke/indent-blankline.nvim', -- indent lines
		'windwp/nvim-autopairs', -- autopairs
		'windwp/nvim-ts-autotag', -- autoclose HTML tags
		'yamatsum/nvim-cursorline', -- cursor line
	}

	use({	-- TODO: Try to make this more in-line with other definitions
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end
	})


	-- ----------- Utility ---------------------

	-- Markdown
	use {
		'davidgranstrom/nvim-markdown-preview', -- markdown doc preview
		'jghauser/follow-md-links.nvim', -- follow markdown links
		'dfendr/clipboard-image.nvim', -- paste images from clipboard (:PasteImg)
	}

	-- Misc
	use {
		'SirVer/ultisnips', -- snippets
		'christoomey/vim-tmux-navigator', -- navigating tmux
		'bfrg/vim-cpp-modern', -- modern cpp syntax highlighting
		'lambdalisue/suda.vim' -- sudo r/w file
	}

	-- ----------- Colorschemes ----------------
	use {
		'folke/tokyonight.nvim', -- tokyonight colorscheme
		'sainnhe/everforest', -- everforest colorscheme
		'morhetz/gruvbox', -- gruvbox colorscheme
		'navarasu/onedark.nvim', -- onedark colorscheme
		'nyoom-engineering/oxocarbon.nvim', -- oxocarbon colorscheme
		'catppuccin/nvim', -- catppuccin colorscheme
		'savq/melange-nvim', -- melange colorscheme
		'rebelot/kanagawa.nvim', -- kanagawa colorscheme
	}
end)
