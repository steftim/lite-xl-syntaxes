-- mod-version:3
local syntax = require "core.syntax"

syntax.add {
    name = "Device Tree",
    files = {"%.dts$", "%.dtsi$"},
    comment = "//",
    block_comment = {"/*", "*/"},
    patterns = {
        {pattern = "//.*", type = "comment"},
        {pattern = {"/%*", "%*/"}, type = "comment"},
        {pattern = {'"', '"', ';'}, type = "string"},
        {pattern = {"<", ">", "\\"}, type = "literal"},
        {pattern = "#.-%s", type = "operator"},
        {pattern = "&+().+();", type = {"operator", "literal", "normal"}},
        {pattern = ".+():%s", type = {"keyword2", "operator"}}, -- const: 
        {pattern = "}+();", type = {"operator", "normal"}}, -- };
        {pattern = ".+()%s+(){", type = {"keyword", "normal", "operator"}}, -- const {
        {
            pattern = "=+()%s+().+()[;][+]",
            type = {"operator", "normal", "literal", "normal"}
        }, {pattern = "[%a-][%w-]*;", type = "function"}
    },
    symbols = {}
}
