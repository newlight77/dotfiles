set runtimepath+=~/.ndotfiles/vim_config

source ~/.ndotfiles/vim_config/general.vim
source ~/.ndotfiles/vim_config/general-functions.vim
source ~/.ndotfiles/vim_config/general-mappings.vim
source ~/.ndotfiles/vim_config/filetypes.vim
source ~/.ndotfiles/vim_config/filetypes-mappings.vim

" source plugins
source ~/.ndotfiles/vim_config/plugins.vim
source ~/.ndotfiles/vim_config/plugins-functions.vim

" source theme
source ~/.ndotfiles/vim_config/theme-color.vim


try
  source ~/.ndotfiles/vim_config/custom.vim
catch
endtry


" source plugin configurations
source ~/.ndotfiles/vim_config/after/plugin/ack.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/airline.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/ale.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/arg-wrap.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/auto-paris.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/buf-explorer.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/close-tag.rc.vim

source ~/.ndotfiles/vim_config/after/plugin/coc.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/ctrlp.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/deoplete.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/easy-align.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/editorconfig.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/emmet-vim.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/expand-region.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/fugitive.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/fzf.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/git-gutter.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/goyo.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/gv.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/indentline.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/javascript.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/js-beautify.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/lightline.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/listtoggle.rc.vim

source ~/.ndotfiles/vim_config/after/plugin/markdown.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/match-tag-always.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/maxima.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/mru.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/neosnipet.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/nerdcommenter.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/nerdtree.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/nerdtreegit.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/open-browser.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/snipmate.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/sqlitedb.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/surround.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/tagbar.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/telescope.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/tern.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/toggle-jekyll.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/treesitter.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/undotree.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/vim-css3.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/vim-go.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/vim-grep.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/vim-move.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/vim-multiple-cursors.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/vim-session.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/vim-tmux.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/vimwiki.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/web-devicons.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/yankstack.rc.vim
source ~/.ndotfiles/vim_config/after/plugin/zen-coding.rc.vim

if has("nvim")
  source ~/.ndotfiles/vim_config/after/plugin/cmp.rc.vim
  source ~/.ndotfiles/vim_config/after/plugin/lsp-colors.rc.vim
  source ~/.ndotfiles/vim_config/after/plugin/lsp-config.rc.vim
  source ~/.ndotfiles/vim_config/after/plugin/lsp-installer.rc.lua
  source ~/.ndotfiles/vim_config/after/plugin/lsp-saga.rc.vim
  source ~/.ndotfiles/vim_config/after/plugin/lspkind.rc.lua
endif
