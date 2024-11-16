-- import all config files under /configs

local function load_imports()
	local files = {
		'configs/autopairs_config',
		'configs/barbar_config',
		'configs/cursorline_config',
		'configs/lualine_config',
		'configs/indentblank_config',
		'configs/telescope_config',
		'configs/tree_config',
		'configs/treesitter_config',
		'configs/lsp_config',
		'configs/transparent_config',
		'configs/lint_config',
	}

	for _, file in ipairs(files) do
		local ok, err = pcall(require, file)
	end
end

load_imports()
