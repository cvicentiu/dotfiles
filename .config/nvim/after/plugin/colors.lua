require('rose-pine').setup({
    --- @usage 'main' | 'moon'
    dark_variant = 'main',
    bold_vert_split = false,
    dim_nc_background = true,
    disable_background = true,
    disable_float_background = false,
    disable_italics = false,


    -- Change specific vim highlight groups
    highlight_groups = {
        -- TSProperty = { fg = p.iris, style = styles.italic },
        -- TSVariable = { style = 'none' },
        -- ColorColumn = { bg = 'surface' },
        ['@variable'] = { italic = false },

    }
})

-- set colorscheme after options
vim.cmd('colorscheme rose-pine')
function SetColorScheme(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

SetColorScheme()
