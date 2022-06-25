set runtimepath+=~/.ndotfiles/vim_config

source ~/.ndotfiles/vim_config/general.vim
source ~/.ndotfiles/vim_config/plugins.vim
source ~/.ndotfiles/vim_config/functions.vim
source ~/.ndotfiles/vim_config/filetypes.vim
source ~/.ndotfiles/vim_config/general-mappings.vim
source ~/.ndotfiles/vim_config/plugins-mappings.vim
source ~/.ndotfiles/vim_config/filetypes-mappings.vim
source ~/.ndotfiles/vim_config/plugins-color-theme.vim

try
  source ~/.ndotfiles/vim_config/custom.vim
catch
endtry
