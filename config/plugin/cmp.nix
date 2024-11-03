{
  plugins = {
    cmp = {
      enable = true;
      settings = {
        autoEnableSources = true;

        performance = {
          debounce = 60;
          fetchingTimeout = 200;
          maxViewEntries = 30;
        };

        formatting = {
          fields = [
            "kind"
            "abbr"
            "menu"
          ];
        };

        sources = [
          {name = "nvim_lsp";}
          {name = "buffer";}
          {
            name = "path"; # file system paths
            keywordLength = 3;
          }
        ];

        window = {
          completion = {
            scrollbar = true;
          };
        };

        mapping = {
          "<C-j>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 'n'})";
          "<C-k>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 'n'})";
          "<C-c>" = "cmp.mapping(cmp.mapping.abort(), {'i', 'n'})";
          "<C-b>" = "cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'n'})";
          "<C-f>" = "cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'n'})";
          "<CR>" = "cmp.mapping(cmp.mapping.confirm({ select = true }), {'i', 'n'})";
        };
      };
    };
    cmp-nvim-lsp = {
      enable = true;
    }; # lsp
    cmp-buffer = {
      enable = true;
    };
    cmp-path = {
      enable = true;
    }; # file system paths
    cmp-cmdline = {
      enable = true;
    }; # autocomplete for cmdline
  };
  extraConfigLua = ''
    local cmp = require'cmp'

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({'/', "?" }, {
      sources = {
        { name = 'buffer' }
      }
    })

    -- Use cmdline source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      sources = cmp.config.sources({
        { name = 'cmdline' }
      })
    })
  '';
}
