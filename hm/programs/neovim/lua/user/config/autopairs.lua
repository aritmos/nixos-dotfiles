local autopairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")

autopairs.setup()

-- `b'` => `b''`
autopairs.add_rules({
    Rule("b'", "'", "rust")
        :with_pair(cond.not_after_regex("'"))
})


-- `foo<` => `foo<>`
autopairs.add_rule(Rule('<', '>', {
    -- if you use nvim-ts-autotag, you may want to exclude these filetypes from this rule
    -- so that it doesn't conflict with nvim-ts-autotag
    '-html',
    '-javascriptreact',
    '-typescriptreact',
}):with_pair(
-- regex will make it so that it will auto-pair on
-- `a<` but not `a <`
-- The `:?:?` part makes it also
-- work on Rust generics like `some_func::<T>()`
    cond.before_regex('%a+:?:?$', 3)
):with_move(function(opts)
    return opts.char == '>'
end))

