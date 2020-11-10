# My-Arch-Config

# 写在前面

> 安装 `arch` 的教程参考 [@NiiiKlaus](https://github.com/NiiiKlaus) 和 [@theniceboy](https://github.com/theniceboy)

视频：[https://www.bilibili.com/video/av81146687](https://www.bilibili.com/video/av81146687)
文档：[https://github.com/NiiiKlaus/Get-my-Arch-Linux](https://github.com/NiiiKlaus/Get-my-Arch-Linux)

> 配置也是参考 [@NiiiKlaus](https://github.com/NiiiKlaus) 和 [@theniceboy](https://github.com/theniceboy) 后自己配置的

# 初步配置

> 在配置之前记得检查网络连接，确保连上了网，联网教程可以看 [@theniceboy](https://www.bilibili.com/video/av81146687) 视频和 [@NiiiKlaus](https://github.com/NiiiKlaus/Get-my-Arch-Linux/blob/master/system-installation.md/#2-%E8%BF%9E%E6%8E%A5%E7%BD%91%E7%BB%9C)

## 1. 安装 `man`

```shell
$ pacman -S man	# 用户手册
```

## 2. 安装 `base-devel`

```shell
$ pacman -S base-devel	# sudo、编译器等等的基础工具
```

## 3. 安装 `neovim`

```shell
$ pacman -S neovim	# 编辑器
```

## 4. 添加用户

```shell
$ useradd -m -G wheel [name]	# -m		创建家目录
				# -G		用户所属的组
				# [name]	用户名
$ passwd [name]			# 修改密码
```

## 5. 修改用户权限

```shell
$ nvim /etc/sudoers # 编辑sudoer file
		    # 去掉 "%wheel ALL=(ALL) ALL" 前面的注释，保存退出
```

## 6. 切换到低权限的用户

```shell
$ exit	# 退出root用户，并登陆 [name]
```

## 7. 安装 `Xorg`

```shell
$ sudo pacman -S xorg xorg-xinit	# 图形界面的服务器
```

## 8. 安装 `git`

```shell
$ sudo pacman -S git	# 版本管理器
```

## 9. 安装 `dwm`

+ 未配置 `dwm`

```shell
$ git clone https://git.suckless.org/dwm
```

+ 个人配置 `dwm`

```shell
$ git clone https://github.com/xhconceit/dwm
```

+ 安装命令

```shell
$ sudo make clean install
```

## 10. 终端模拟器 `st`

+ 未配置 `st`

```shell
$ git clone https://git.suckless.org/st
```

+ 个人配置 `st`

```shell
$ git clone https://github.com/xhconceit/st
```

+ 安装命令

```shell
$ sudo make clean install
```

## 11. 极简应用程序选择器 `dmenu`

+ 未配置 `dmenu`

```shell
$ git clone https://git.suckless.org/dmenu
```

+ 个人配置 `dmenu`

```shell
$ git clone https://github.com/xhconceit/dmenu
```

+ 安装命令

```shell
$ sudo make clean install
```

## 12. 启动 `dwm`

```shell
$ nvim ~/.xinitrc    # 输入 "exec dwm"
$ startx	    # 启动 dwm
```

## 13. 安装 app

```shell
$ sudo pacman -S chromium		# 浏览器
$ sudo pacman -S ranger			# 终端文件管理器
$ sudo pacman -S picom			# 窗口管理器
$ sudo pacman -S aria2			# 下载
$ sudo pacman -S fzf			# 搜索本地文件
$ sudo pacman -S scrot			# 截图
$ sudo pacman -S feh			# 图片查看软件
$ sudo pacman -S acpilight		# 亮度管理器
$ sudo pacman -S simplescreenrecorder	# 录屏软件
$ sudo pacman -S pulseaudio		# 录屏声音服务
$ sudo pacman -S pulseaudio-alsa	# 录屏声音服务
$ sudo pacman -S alsa-utils		# 调节音量
$ alsamixer				# 调节音量大小
```

## 14. `pacman` 换源

+ 换源

```shell
$ sudo nvim /etc/pacman.conf	# 换清华源，在尾部输入
				# [archlinuxcn]
				# Server = http://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch
```

+ 安装 `archlinuxcn-keyring` 包导入 `GPG key`

```shell
$ sudo pacman -Syyu
$ sudo pacman -Sy archlinuxcn-keyring
```

## 15. 安装 `yay`

```shell
$ sudo pacman -S yay
```

## 16. 安装 `emoji` 字体和中文字体

+ emoji 字体

```shell
$ yay -S ttf-linux-libertine ttf-inconsolata ttf-joypixels ttf-twemoji-color noto-fonts-emoji ttf-liberation ttf-droid
$ sudo pacman -S ttf-nerd-fonts-symbols
```

+ 中文字体

```shell
$ yay -S wqy-bitmapfont wqy-microhei wqy-microhei-lite wqy-zenhei adobe-source-han-mono-cn-fonts adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts
```

## 17. 安装输入法

```shell
$ sudo pacman -S fcitx-im		# fcitx
$ sudo pacman -S fcitx-configtool	# fcitx 配置
$ sudo pacman -S fcitx-rime		# rime
$ nvim ~/.xinxit			# 在最前面输入"
					# export XMODIFIERS="@im=fcitx"
					# export GTK_IM_MODULE="fcitx"
					# export QT_IM_MODULE="fcitx"
					# fcitx &"
$ reboot				# 重启
```

## 18. 屏幕亮度调节

+ 安装 ACPI 的亮度控制

```shell
$ sudo pacman -S acpilight
```

+ 添加当前用户到 video 组，实现免 root 控制亮度

```shell
$ sudo gpasswd video -a [user]
$ reboot
```

## 19. qv2rzy

```shell
$ sudo pacman -S v2ray qv2ray
```

+ 默认终端代理命令

```shell
$ export http_proxy="http://127.0.0.1:8889"
$ export https_proxy="http://127.0.0.1:8889"
```

## 20. golang

+ 下载

[https://golang.org/doc/install](https://golang.org/doc/install)

+ 解压

```shell
$ tar -C /usr/local -xzf go1.15.3.linux-amd64.tar.gz
```

+ 添加环境变量

在 `/etc/profile` 文件中添加：

```shell
$ export PATH=$PATH:/usr/local/go/bin
$ export GOPATH="/home/crush/code/go"
```

## 21. java

+ 安装 java8

```shell
$ sudo pacman -S jdk8-openjdk
```

+ 安装最新 jdk

```shell
$ sudo pacman -S jdk
```

+ 查看和切换 jdk

```shell
$ archlinux-java status			# 获取 jdk 列表
$ archlinux-java get			# 获取当前 jdk 名字
$ sudo archlinux-java set [jdk-name]	# 切换 jdk
```

## 22. nodejs

+ 安装

```shell
$ sudo pacman -S nodejs npm yarn
```

+ 设置 taobao 镜像

npm:
```shell
$ npm config set registry https://registry.npm.taobao.org
```

yarn:
```shell
$ yarn config set registry https://registry.npm.taobao.org
```

## 23. Neovim 配置

配置看 [https://github.com/xhconceit/nvim](https://github.com/xhconceit/nvim)

```shell
$ cd ~/.config/
$ git clone https://github.com/xhconceit/nvim
```

## 24. ssr-helper

+ 安装 ssr-helper (linux macOS 需要 root 权限)

```shell
# yarn 
$ yarn global add ssr-helper
# npm
$ npm install -g ssr-helper
```

+ 配置依赖

```shell
$ git clone -b manyuser https://github.com/shadowsocksr-backup/shadowsocksr.git	# 下载依赖
$ ssr config /home/noah/shadowsocksr						# 配置依赖
```

+ 安装 polipo 

```shell
$ sudo pacman -Ss polipo		# socks 代理转 http 代理
$ sudo vim /etc/polipo/config		# 添加以下配置
					# socksParentProxy = "127.0.0.1:1080"
					# socksProxyType = socks5
$ sudo systemctl restart polipo.service	# 重新启动 polipo
```

+ 默认终端代理命令

```shell
$ export http_proxy="http://127.0.0.1:8123"
$ export https_proxy="http://127.0.0.1:8123"
```

## 25. `virtualbox` 虚拟机

```shell
$ sudo pacman -S virtualbox	# 安装 virtualbox ，选择 virtualbox-host-modules-arch 模块
```

## 26. `ranger` 配置

+ 生成配置文件，在 ~/.config/ranger 文件夹下生成 rifle.conf commands.py commands_full.py rc.conf scope.sh

```shell
$ ranger --copy-config=all	# rc.conf		选项设置和快捷键
				# commands.py		能通过 : 执行的命令
				# commands_full.py	全套命令
				# rifle.conf		指定不同类型的文件的默认打开程序。
				# scope.sh		用于指定预览程序的文件
```

+ 预览图片

```shell
$ sudo pacman -S ueberzug	# 安装预览图片应用，修改 rc.conf 
				# set preview_images true
				# set preview_images_method ueberzug
```

+ 预览视频缩略图

```shell
$ sudo pacman -S ffmpegthumbnailer	# 安装预览视频缩略图应用，修改 scope.sh ，取消以下注销
					# #video/*)
					# #	#Thumbnail
					# #	ffmpegthumbnailer -i "${FILE_PATH}" -o "${IMAGE_CACHE_PATH}" -s 0 && exit 6
					# #	exit 1;;
```

+ 预览 html 

```shell
$ sudo pacman -S elinks
```

+ 打开视频

```shell
$ sudo pacman -S mpv	# ranger 默认使用 mpv 打开视频
```

+ 代码高亮

```shell
$ sudo pacman -S highlight
```

+ 删除配置

```shell
$ sudo pacman -S trash-cli	# 类似垃圾桶，将文件移动到 ~/.local/share/Trash ，修改 rc.conf 文件，在最后面添加
				# map dD shell trash %s
```

## 27. zsh

+ 安装 zsh

```shell
$ sudo pacman -S zsh
```

+ 切换 shell 为 zsh

```shell
$ sudo chsh -s /bin/zsh [name]
```

+ 安装 oh-my-zsh

```shell
$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

+ 安装插件

```shell
$ git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions						# 自动提示插件
$ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting		# 语法高亮
```

+ 配置插件

打开 `~/.zshrc` 在 `plugins` 添加
```shell
zsh-autosuggestions		# 自动提示插件
zsh-syntax-highlighting		# 语法高亮
extract				# 别名 x ，一键解压
z				# 常用目录之间跳转
```

+ 配置 vi-mode

在 `~/.zshrc` 文件尾部，添加

```shell
bindkey '^v' edit-command-line
bindkey -v

function zle-keymap-select {
        if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
                echo -ne '\e[1 q'
        elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
                echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# Use beam shape cursor on startup.
echo -ne '\e[5 q'

# Use beam shape cursor for each new prompt.
preexec() {
        echo -ne '\e[5 q'
}

_fix_cursor() {
        echo -ne '\e[5 q'
}
precmd_functions+=(_fix_cursor)

KEYTIMEOUT=1
```

## 28. 解压应用

```shell
$ sudo pacman -S unzip	# zip
```


## 29. chrome 插件

### iguge

[iguge](https://iguge.app/) 访问 google 

### Proxy SwitchyOmega 插件

chrome 管理多个 web 代理

1. chrome web store: 
[Proxy SwitchyOmega](https://chrome.google.com/webstore/detail/proxy-switchyomega/padekgcemlokbadohgkifijomclgjgif/related)

2. github: 
[Proxy SwitchyOmega](https://github.com/FelisCatus/SwitchyOmega)

### vimium

可以使用 vim 命令操作 chrome

1. chrome web store: 
[vimium](https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb/related)

2. github: 
[vimium](https://github.com/philc/vimium)

### Google Translate

google 翻译

1. chrome web store: 
[Google Translate](https://chrome.google.com/webstore/detail/google-translate/aapbdbdomjkkjkaonfhkkikfgjllcleb)

## 30. bashtop

+ 安装

```shell
$ sudo pacman -S bashtop		" bashtop
$ sudo pacman -S nerd-fonts-terminus	" bashtop 需要的字体
```

## 31. scrot

+ 安装

```shell
sudo pacman -S scrot	# -s 鼠标选择窗口或矩形
```

## 32. 挂载 iPhone

+ 安装

```shell
$ sudo pacman -S usbmuxd libplist libimobiledevice
$ yay -S ifuse
$ sudo mkdir /mnt/iPhone	# 新建文件夹
$ sudo chmod 777 /mnt/iPhone	# 修改文件夹权限
$ ifuse	/mnt/iPhone
```


