--[[
-- This is actual code (suprising)
-- Used for generating matricies/vectors for latex using luascript.
-- Functions (i, t, sn, s, d, fmta) are imported where this file is actually used, 
-- this is kind of stupid, I'll admit it. (The file is: /lua/config/luasnip.lua)
--]]

local line_begin = require("luasnip.extras.expand_conditions").line_begin

--- Builds a latex matrix row.
--- @param row_length (number) How many items the row will have
--- @param current_index (number) Used by luasnip functions. Each
--- luasnip node needs an index (one based) that is unique for forward jump.
--- If previous rows were generated, this should equal #rows * row_length.
--- @return A latex matrix row that is has luasnip nodes indexing each item.
local function build_matrix_row(row_length, current_index)
    local inner_index = current_index
    local matrix_row = {}
    local matrix_item_separator = " & "
    local matrix_row_end = " \\\\ "
    for j=1, row_length - 1 do
        table.insert(matrix_row, i(current_index))
        table.insert(matrix_row, t(matrix_item_separator))
        current_index = current_index + 1
    end
    table.insert(matrix_row, i(current_index))
    table.insert(matrix_row, t(matrix_row_end))
    return matrix_row
end

--- Builds a latex matrix
--- @param row_length (number) The length of each row in the matrix
--- @param column_length (number) The amount of columns in the matrix
--- @return A latex matrix's inners (brackets not included so this is somewhat generic).
--- Each item in the matrix has a luasnip nodes indexing it, this allows a user with a
--- (jumpnode) keybind to quickly create a matrix and jump to the precise location where 
--- and item should be using their keybind.
local function build_matrix(row_length, column_length)
    local matrix = {}
    local current_index = 1
    for i=1, column_length do
        vim.list_extend(matrix, build_matrix_row(row_length, current_index))
        current_index = current_index + row_length
    end
    return matrix
end

--- Builds a latex matrix from snippet information
--- @param _ (not used)
--- @param snip (luasnip snippet) a snippet that will be parsed and 
--- used to build a latex matrix.
--- @return A latex matrix's inners (brackets not included so this is somewhat generic).
--- Each item in the matrix has a luasnip nodes indexing it, this allows a user with a
--- (jumpnode) keybind to quickly create a matrix and jump to the precise location where 
--- and item should be using their keybind.
local function create_matrix_from_snippet(_, snip)
    local x = tonumber(snip.captures[1])
    local y = tonumber(snip.captures[1])
    return sn(nil, build_matrix(x, y))
end

return {
    -- Matrix
    s({ 
        trig="m([%d]+).([%d]+)", -- m5.5 builds a bracket matrix with 5 rows and 5 columns (.tex files only)
        wordTrig = false,
        regTrig = true,
        snippetType="autosnippet" 
    },
    fmta(
    [[
    \begin{bmatrix}
        <>
    \end{bmatrix}
    ]],
    { 
        d(1, create_matrix_from_snippet, {}),
    }),
    { condition = line_begin}),
}
