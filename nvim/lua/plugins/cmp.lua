return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",  -- для интеграции с LSP
      "hrsh7th/cmp-buffer",    -- источник для автодополнения из буфера
      "hrsh7th/cmp-path",      -- источник для автодополнения путей
      "hrsh7th/vim-vsnip", -- добавьте этот плагин для сниппетов
      "hrsh7th/cmp-vsnip", -- source для vim-vsnip
    },
    config = function()
    -- Убедитесь, что nvim-cmp установлен и настроен
    local cmp = require('cmp')

    cmp.setup({
    snippet = {
        expand = function(args)
        -- Для SnipMate, например
        vim.fn["vsnip#anonymous"](args.body)  -- Для vsnip
        end,
    },
     mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item(),  -- Перейти к следующему элементу
        ['<C-p>'] = cmp.mapping.select_prev_item(),  -- Перейти к предыдущему элементу
        ['<C-Space>'] = cmp.mapping.complete(),        -- Вызов автодополнения
        ['<C-e>'] = cmp.mapping.close(),               -- Закрытие списка
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Подтверждение выбора
    },
    sources = {
        { name = 'nvim_lsp' },  -- Подсказки от LSP
        { name = 'buffer' },    -- Подсказки из буфера
        { name = 'path' },      -- Подсказки для файлов
        { name = 'cmdline' },   -- Подсказки для командной строки
        },
    })

    end,
  }
}

