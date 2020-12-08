# Defined in - @ line 1
function transparent --wraps='sed -ri "s/background_opacity: 1/background_opacity: 0.8/" ~/.config/alacritty/alacritty.yml' --description 'alias transparent sed -ri "s/background_opacity: 1/background_opacity: 0.8/" ~/.config/alacritty/alacritty.yml'
  sed -ri "s/background_opacity: 1/background_opacity: 0.8/" ~/.config/alacritty/alacritty.yml $argv;
end
