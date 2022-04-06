## 一、下载nvim
github地址：https://github.com/neovim/neovim
macos直接使用homebrew
```shell
brew install neovim
```

## 二、下载本配置文件
nvim配置文件默认在~/.config/nvim/init.vim，没有则新建，或者直接在~/.config文件下 clone本reepo
```shell
cd ~/.config
git clone git@github.com:fourierrr/nvim.git
```
本配置文件定义了所有需要安装的nvim插件，包括
- airblade/vim-gitgutter
- preservim/nerdtree
- Xuyuanp/nerdtree-git-plugin
- majutsushi/tagbar
- junegunn/fzf
- tpope/vim-commentary
- fatih/vim-go
- SirVer/ultisnips
- iamcco/markdown-preview.nvim
- vim-airline/vim-airline
- neoclide/coc.nvim
- ayu-theme/ayu-vim
- yegappan/mru
- rakr/vim-one
- jiangmiao/auto-pairs


## 三、下载并使用vim-plug安装插件
### 3.1、下载
github地址：https://github.com/junegunn/vim-plug
对于neovim，直接使用以下命令安装
```sheell
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
### 3.2 加速vim-plug下载github源
国内用户可以修改vim-plug的相关配置解决github无法访问或者下载慢的问题
```shell
#vim-plug默认配置文件地址
vim ~/.local/share/nvim/site/autoload/plug.vim
```

> https://hub.fastgit.xyz/ 镜像站2022.4.6测试仍然可以使用 


然后使用github镜像站进行替换，在vim命令模式中
```vim
%s/github.com/hub.fastgit.xyz/g
```

### 3.3 通过vim-plug安装所有插件
打开nvim配置文件
```shell
vim ~/.config/nvim/init.vim
```
在vim命令模式中，使用如下命令安装所有插件
```vim
:PlugInstall
```

## 四、安装部分必要的库以及配置插件
