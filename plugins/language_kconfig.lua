-- mod-version:3
local syntax = require "core.syntax"

syntax.add {
    name = "Linux Kconfig",
    files = {"Kconfig$"},
    comment = "#",
    patterns = {
        {pattern = "#.*", type = "comment"},
        {pattern = {'"', '"', ';'}, type = "string"},
        {pattern = "config+()%s+().*", type = {"operator", "normal", "string"}},
        {pattern = "depends+()%s+()on+()%s+().*", type = {"function", "normal", "function", "normal", "literal"}},
    },
    symbols = {
        ["bool"] = "literal",
        ["config"] = "keyword",
        ["source"] = "function",
        ["help"] = "operator",
        ["default"] = "keyword2",
        ["if"] = "keyword",
        ["endif"] = "keyword",
        ["menu"] = "keyword2",
        ["endmenu"] = "keyword2"        
    }
}
