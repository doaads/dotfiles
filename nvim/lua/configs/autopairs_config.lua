local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')

npairs.setup({
	check_ts = true,
	ts_config = {
		lua = {'string'}, -- it will not add pair on that treesitter node
		javascript = {'template_string'},
		java = false, -- don't check treesitter on java
	},
})

local ts_conds = require('nvim-autopairs.ts-conds')
