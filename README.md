# MY Config


## pacman 换源

在 `/etc/pacman.conf` 中写入

```conf
[archlinuxcn]
Server = http://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch
```

安装 `archlinuxcn-keyring` 包导入 `GPG key`

```bash
sudo pacman -Syyu
sudo pacman -Sy archlinuxcn-keyring
```

## 按键

修改按键映射在 `~/.Xmodmap` 修改

修改 `Caps_Lock` 为 `Escape`

```xmodmap
clear lock 
keycode 66 = Escape
```


## APP

1. man

用户手册

```bash
sudo pcaman -S man
```

2.  base-devel

编译器等等的基础工具

```bash
sudo pacman -S base-devel
```


3. screenkey

捕捉键盘按键。

```bash
sudo pacman -S screenkey
```


4. neovim

nvim

```bash
sudo pacman -S neovim
```

5. xorg

图形界面服务器

```bash
sudo pacman -S xorg xorg-xinit
```

6. git

```bash
sudo pacman -S git
```

7. unzip

解压`zip`

```bash
sudo pacman -S unzip
```

8. nerd-fonts-terminus

终端图标

```bash
sudo pacman -S nerd-fonts-terminus
```

9. yay

```bash
sudo pacman -S yay
```

10. emoji 字体

```bash
yay -S ttf-linux-libertine ttf-inconsolata ttf-joypixels ttf-twemoji-color noto-fonts-emoji ttf-liberation ttf-droid
sudo pacman -S ttf-nerd-fonts-symbols
```

11. 中文字体


```bash
yay -S wqy-bitmapfont wqy-microhei wqy-microhei-lite wqy-zenhei adobe-source-han-mono-cn-fonts adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts
```

12. 输入法

```bash
sudo pacman -S fcitx-im fcitx-configtool fcitx-rime
```

在 `.xinxit` 写入

```bash
export XMODIFIERS="@im=fcitx"
export GTK_IM_MODULE="fcitx"
export QT_IM_MODULE="fcitx"
fcitx
```

13. 屏幕亮度调节

```bash
sudo pacman -S acpilight
```

- 添加当前用户到 video 组，实现免 root 控制亮度

```bash
sudo gpasswd video -a [user]
```



## chrome 插件


1. Proxy SwitchyOmega 插件

chromium 代理插件

- [github](https://github.com/FelisCatus/SwitchyOmega)
- [chrome](https://chrome.google.com/webstore/detail/proxy-switchyomega/padekgcemlokbadohgkifijomclgjgif/related)

2. vimium

- [github](https://github.com/philc/vimium)
- [chrome](https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb/related)


