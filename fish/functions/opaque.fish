# Defined in - @ line 1
function opaque --wraps='sed -ri "s/background_opacity: 0.8/background_opacity: 1/" .config/alacritty/alacritty.yml' --wraps='sed -ri "s/background_opacity: 0.8/background_opacity: 1/" ~/.config/alacritty/alacritty.yml' --description 'alias opaque sed -ri "s/background_opacity: 0.8/background_opacity: 1/" ~/.config/alacritty/alacritty.yml'
  sed -ri "s/background_opacity: 0.8/background_opacity: 1/" ~/.config/alacritty/alacritty.yml $argv;
end
