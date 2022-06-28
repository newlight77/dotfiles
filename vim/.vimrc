set runtimepath+=~/.ndotfiles/vim_config

source ~/.ndotfiles/vim_config/general.vim
source ~/.ndotfiles/vim_config/general-functions.vim
source ~/.ndotfiles/vim_config/general-mappings.vim
source ~/.ndotfiles/vim_config/filetypes.vim
source ~/.ndotfiles/vim_config/filetypes-mappings.vim
source ~/.ndotfiles/vim_config/plugins.vim
source ~/.ndotfiles/vim_config/plugins-functions.vim

source ~/.ndotfiles/vim_config/theme-color.vim

try
  source ~/.ndotfiles/vim_config/custom.vim
catch
endtry
