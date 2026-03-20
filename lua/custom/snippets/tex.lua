local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")
-- local opt = require("luasnip.nodes.optional_arg")
-- local extras = require("luasnip.extras")
-- local l = extras.lambda
-- local rep = extras.rep
-- local p = extras.partial
-- local m = extras.match
-- local n = extras.nonempty
-- local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
-- local conds = require("luasnip.extras.expand_conditions")
-- local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
-- local parse = require("luasnip.util.parser").parse_snippet
-- local ms = ls.multi_snippet
-- local k = require("luasnip.nodes.key_indexer").new_key

local function mirror(args, parent, user_args)
    return args[1][1]
end

ls.setup({
    enable_autosnippets = true,
    update_events = "TextChanged,TextChangedI",
    ext_ops = nil,
})

ls.add_snippets("all", {

    -- operations
    -- limit
    s({
        trig = "lim"
    }, fmta("\\lim_{<>\\to<>}", {
                i(1, "n"), i(2, "+\\infty") })
    ),

    -- sum
    s({
        trig = "sum"
    }, fmta("\\sum_{<>}^{<>}", {
                i(1, "n=0"), i(2, "+\\infty") })
    ),

    -- integral
    s({
        trig = "integrale"
    }, fmta("\\int_{<>}^{<>}", {
                i(1, "a"), i(2, "b") })
    ),

    -- span
    s({
        trig = "span"
    }, fmta("\\Span{<>}", { i(1, "a") })
    ),


    -- envs
    -- matrix
    s({
        trig = "matrix",
    },
        fmta(
            [[
            \begin{<>matrix}
                <>
            \end{<>matrix}
            ]],
            { i(1, "p/b/v/B/V/small"), i(2), f(mirror, {1}, {}) })
    ),

    -- begin/end env
    s({
        trig = "begin",
    },
        fmta(
            [[
            \begin{<>}
                <>
            \end{<>}
            ]],
            { i(1), i(2), f(mirror, {1}, {}) })
    ),

    -- equation
    s({
        trig = "equazione",
    },
        fmta(
            [[
            \begin{equation}
                <>
            \end{equation}
            ]],
            { i(1) })
    ),

    -- equation star
    s({
        trig = "eq*",
    },
        fmta(
            [[
            \begin{equation*}
                <>
            \end{equation*}
            ]],
            { i(1) })
    ),

    -- align
    s({
        trig = "align",
    },
        fmta(
            [[
            \begin{align}
                <>
            \end{align}
            ]],
            { i(1) })
    ),

    -- align star
    s({
        trig = "ali*",
    },
        fmta(
            [[
            \begin{align*}
                <>
            \end{align*}
            ]],
            { i(1) })
    ),

    -- gather
    s({
        trig = "gather",
    },
        fmta(
            [[
            \begin{gather}
                <>
            \end{gather}
            ]],
            { i(1) })
    ),

    -- gather star
    s({
        trig = "gat*",
    },
        fmta(
            [[
            \begin{gather*}
                <>
            \end{gather*}
            ]],
            { i(1) })
    ),

    -- definition
    s({
        trig = "defn",
    },
        fmta(
            [[
            \begin{definizione}
                <>
            \end{definizione}
            ]],
            { i(1) })
    ),

    -- proposition
    s({
        trig = "propne",
    },
        fmta(
            [[
            \begin{proposizione}
                <>
            \end{proposizione}
            ]],
            { i(1) })
    ),

    -- lemma
    s({
        trig = "lemma",
    },
        fmta(
            [[
            \begin{lemma}
                <>
            \end{lemma}
            ]],
            { i(1) })
    ),

    -- teorema
    s({
        trig = "teorema",
    },
        fmta(
            [[
            \begin{teorema}
                <>
            \end{teorema}
            ]],
            { i(1) })
    ),

    -- example
    s({
        trig = "esempio",
    },
        fmta(
            [[
            \begin{esempio}
                <>
            \end{esempio}
            ]],
            { i(1) })
    ),

    -- corollary
    s({
        trig = "corollario",
    },
        fmta(
            [[
            \begin{corollario}
                <>
            \end{corollario}
            ]],
            { i(1) })
    ),

    -- observation
    s({
        trig = "osservazione",
    },
        fmta(
            [[
            \begin{osservazione}
                <>
            \end{osservazione}
            ]],
            { i(1) })
    ),

    -- property
    s({
        trig = "prop",
    },
        fmta(
            [[
            \begin{proprieta}
                <>
            \end{proprieta}
            ]],
            { i(1) })
    ),


    -- display math
    s({
        trig = "dm",
    },
        fmta(
            [[
            \[
                <>
            \]
            ]],
            { i(1) })
    ),

    -- text
    -- normal
    s({
        trig = "text",
    },
        fmta("\\text{<>}", { i(1) })
    ),

    -- italic
    s({
        trig = "italic",
    },
        fmta("\\textit{<>}", { i(1) })
    ),

    -- text
    s({
        trig = "bold",
    },
        fmta("\\textbf{<>}", { i(1) })
    ),


    -- singular set
    s({
        trig = "insieme"
    }, fmta("\\{<>\\}", { i(1, "a") })
    ),

    -- sets
    s({
        trig = "reali",
        },
        t("\\mathbb{R}")
    ),
    s({
        trig = "interi",
        },
        t("\\mathbb{Z}")
    ),
    s({
        trig = "naturali",
        },
        t("\\mathbb{N}")
    ),
    s({
        trig = "razionali",
        },
        t("\\mathbb{Q}")
    ),
    s({
        trig = "complessi",
        },
        t("\\mathbb{C}")
    ),

    -- variable mods
    -- vec
    s({
        trig = "vec",
        },
        fmta("\\vec{<>}", { i(1) })
    ),

    -- constants and such
    -- field
    s({
        trig = "campo",
        },
        t("\\mathbb{K}")
    ),

    -- lambda
    s({
        trig = "lambda",
        },
        t("\\lambda")
    ),

    -- epsilon
    s({
        trig = "epsilon",
        },
        t("\\varepsilon")
    ),
})

ls.add_snippets("all", {
    -- s({
    --     trig = "template",
    -- }, {
    --     -- nodes here
    -- }),

    -- subscript
    s({
        trig = "__",
        wordTrig = false
    }, {
        t("_{"),
        i(1),
        t("}")
    }),

    -- superscript
    s({
        trig = "^^",
        wordTrig = false
    }, {
        t("^{"),
        i(1),
        t("}")
    }),

    -- "regex" fraction
    s({
        trig = "(%S*)//",
        trigEngine = "pattern",
        wordTrig = false,
        -- regTrig = true,
    }, {
        f(function(_, snip)
            return "\\frac{" .. snip.captures[1] .. "}{"
        end, {}),
        i(1),
        t("}")
    }),

    -- empty fraction
    s({
        trig = "//",
        priority = 1001
    }, fmta(
            "\\frac{<>}{<>}",
            { i(1), i(2) })
    ),

    -- mathbb
    s({
        trig = "mbb",
    }, fmta(
            "\\mathbb{<>}",
            { i(1) })
    ),

}, {
        type = "autosnippets",
})
