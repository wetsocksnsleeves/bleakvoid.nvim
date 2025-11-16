local M = {}

local c = {
    fg               = "#d1d1d1",
    bg               = "#000000",
    cursor           = "#fff67d",
    line_nr          = "#404040",
    visual           = "#303030",

    bracket          = "#cfcfcf",
    comment          = "#5a5a5a", -- slightly brighter
    string           = "#B06969", -- muted red

    func             = "#f0f0f0", -- brighter than identifiers
    identifier       = "#b0b0b0", -- normal variables
    type             = "#c8c8c8", -- between identifier and func
    type_builtin     = "#dddddd", -- brightest non-accent
    kw               = "#B06969",
    operator         = "#e6e6e6", -- make operators stand out

    search_highlight = "#fff67d",
    preprocessor     = "#6a7a8a",

    bool             = "#909090",
    constant         = "#a8a8a8", -- distinct from variables

    -- Pmenu colors
    pemnu_fg         = "#d1d1d1",
    pmenu_sel_bg     = "#202020",

    -- gitsigns colors
    added            = "#baffc9",
    changed          = "#ffffba",
    removed          = "#ffb3ba",

    -- EndOfBuffer color
    eob              = "#3c3c3c",

    -- LSP diagnostics colors
    error            = "#dea6a0",
    warning          = "#d6efd8",
    hint             = "#bedc74",
    info             = "#7fa1c3",
}

local hi = {
    -- UI
    Normal = { fg = c.fg, bg = c.bg },
    Cursor = { fg = c.cursor, bg = c.bg },
    LineNr = { fg = c.line_nr },
    Visual = { bg = c.visual },
    Float = { fg = c.fg, bg = c.bg },
    FloatBorder = { fg = c.pemnu_fg },
    TelescopeSelection = { bg = c.pmenu_sel_bg },
    Pmenu = { fg = c.pemnu_fg, bg = c.bg },
    PmenuSel = { fg = c.pemnu_fg, bg = c.pmenu_sel_bg, bold = true },

    -- Code
    Comment = { fg = c.comment, italic = true },
    String = { fg = c.string },
    Function = { fg = c.func },
    Keyword = { fg = c.kw, italic = true },
    Identifier = { fg = c.identifier },
    Type = { fg = c.type },
    PreProc = { fg = c.preprocessor },
    Boolean = { fg = c.string },
    Constant = { fg = c.constant },
    Special = { fg = c.fg },

    Search = { fg = c.search_highlight, bg = "NONE", bold = true },
    IncSearch = { fg = c.search_highlight, bg = "NONE", bold = true },
    Operator = { fg = c.fg },
    Delimiter = { fg = c.bracket },

    -- Tree Sitter
    ["@function"] = { fg = c.func },
    ["@keyword"] = { fg = c.kw, italic = true },

    ["@operator"] = { fg = c.operator },
    ["@punctuation.bracket"] = { fg = c.bracket },
    ["@punctuation.delimiter"] = { fg = c.bracket },

    ["@variable"] = { fg = c.identifier },
    ["@variable.builtin"] = { fg = c.identifier, italic = true },
    ["@variable.parameter"] = { fg = c.identifier },

    ["@property"] = { fg = c.identifier},
    ["@field"] = { fg = c.identifier},
    ["@type"] = { fg = c.type },

    -- EndOfBuffer
    EndOfBuffer = {
        fg = c.bg,
        bg = c.bg,
    },

    -- LSP
    DiagnosticError = { fg = c.error },
    DiagnosticWarn = { fg = c.warning },
    DiagnosticHint = { fg = c.hint },
    DiagnosticInfo = { fg = c.info },
    DiagnosticVirtualTextError = { fg = c.error },
    DiagnosticVirtualTextWarn = { fg = c.warning },
    DiagnosticVirtualTextHint = { fg = c.hint },
    DiagnosticVirtualTextInfo = { fg = c.info },

    DiagnosticUnderlineError = { underline = true, sp = c.error },
    DiagnosticUnderlineWarn = { underline = true, sp = c.warning },
    DiagnosticUnderlineHint = { underline = true, sp = c.hint },
    DiagnosticUnderlineInfo = { underline = true, sp = c.info },
}

function M.load()
    vim.cmd("hi clear")
    vim.o.termguicolors = true

    for group, opts in pairs(hi) do
        vim.api.nvim_set_hl(0, group, opts)
    end

    vim.g.colors_name = "bleakvoid"
end

return M
