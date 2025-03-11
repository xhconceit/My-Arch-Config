#  fcitx 输入法
export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:en_US
export QT_QPA_PLATFORMTHEME=qt6ct
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export SDL_IM_MODULE=fcitx
export INPUT_METHOD=fcitx
export GLFW_IM_MODUL=ibus
# 启动 dwm
exec dwm 
# 设置按键
[ -f "$HOME/.Xmodmap" ] && xmodmap "$HOME/.Xmodmap" 
