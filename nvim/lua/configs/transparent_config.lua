require("transparent").setup({
  groups = { -- table: default groups
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLineNr', 'EndOfBuffer', 'TelescopeNormal', 'TelescopeBorder', 'TelescopeTitle',
	'lualine_c_normal', 'lualine_x_filetype_DevIconDefault_normal', 'lualine_x_filetype_DevIconDefault_replace',
	'lualine_x_filetype_DevIconVim_normal', 'lualine_x_filetype_DevIconLua_normal', 'BufferTabpages', 'BufferTabpageFill',
	'lualine_transitional_lualine_b_normal_to_lualine_c_normal', 'lualine_transitional_lualine_b_insert_to_lualine_c_normal',
	'lualine_transitional_lualine_b_diff_modified_normal_to_lualine_c_normal', 'lualine_transitional_lualine_b_diff_modified_normal_to_lualine_c_normal',
	'lualine_transitional_lualine_b_diff_modified_command_to_lualine_c_normal',
  },
  extra_groups = {}, -- table: additional groups that should be cleared
  exclude_groups = {}, -- table: groups you don't want to clear
})

