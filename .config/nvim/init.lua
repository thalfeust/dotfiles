require "user.options"

local is_colemak_layout = (layout == 'colemak')
require(is_colemak_layout and 'user.keymaps_colemak' or 'user.keymaps_qwerty')