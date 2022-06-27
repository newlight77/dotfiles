set runtimepath+=~/.ndotfiles/vim_config

runtime ~/.ndotfiles/vim_config/general.vim
runtime ~/.ndotfiles/vim_config/general-mappings.vim
runtime ~/.ndotfiles/vim_config/functions.vim
runtime ~/.ndotfiles/vim_config/filetypes.vim
runtime ~/.ndotfiles/vim_config/filetypes-mappings.vim
runtime ~/.ndotfiles/vim_config/plugins.vim
runtime ~/.ndotfiles/vim_config/plugins-functions.vim

runtime ~/.ndotfiles/vim_config/theme-color.vim

try
  runtime ~/.ndotfiles/vim_config/custom.vim
catch
endtry
