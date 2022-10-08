require("ts_context_commentstring.internal").update_commentstring({
	key = "__multiline",
})

require("ts_context_commentstring.internal").calculate_commentstring({
	location = require("ts_context_commentstring.utils").get_cursor_location(),
})
