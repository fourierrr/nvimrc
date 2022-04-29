## 一、下载nvim以及前置依赖
### 1.1 neovim
github地址：https://github.com/neovim/neovim
macos直接使用homebrew
```shell
brew install neovim
```

### 1.2 node/yarn/fzf/ctags
包括coc在内的的许多插件依赖node和yarn，fzf插件需要fzf的可执行程序, tagbar依赖ctags的可执行程序,go补全依赖gopls
```shell
brew install node yarn fzf ctags gopls
```

### 1.3 pynvim
ultisnips需要python支持，有时候会报错no python3 provider,需要health check
此时需要安装pynvim
```shell
python3 -m pip install --user --upgrade pynvim
```

## 二、下载本配置文件
nvim配置文件默认在~/.config/nvim/init.vim，没有则新建，或者直接在~/.config文件下 clone本reepo
```shell
cd ~/.config
git clone git@github.com:fourierrr/nvim.git
```
本配置文件定义了所有需要安装的nvim插件，包括
- [airblade/vim-gitgutter](https://github.com/airblade/vim-gitgutter) 在视图左侧用+-等符号显示git diff
- [preservim/nerdtree](https://github.com/preservim/nerdtree) 侧栏文件树
- [Xuyuanp/nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin) 在文件树文件名前显示git diff
- [majutsushi/tagbar](https://github.com/preservim/tagbar) 右侧显示代码结构，例如按照struct、function列出
- [junegunn/fzf](https://github.com/junegunn/fzf) 强大的模糊搜索
- [tpope/vim-commentary](https://github.com/tpope/vim-commentary) 快捷注释/反注释，默认按键`gc`
- [fatih/vim-go](https://github.com/fatih/vim-go) 强大的vim go插件
- [SirVer/ultisnips](https://github.com/SirVer/ultisnips) 智能自动代码段填充
- [iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) markdown的html页面预览
- [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline) vim底部美化状态条
- [neoclide/coc.nvim](https://github.com/neoclide/coc.nvim) vim最代码强补全插件
- [yegappan/mru](https://github.com/yegappan/mru) 查看最近使用的文件列表
- [jiangmiao/auto-pairs](https://github.com/jiangmiao/auto-pairs) 自动括号补全
- [rakr/vim-one](https://github.com/rakr/vim-one) 一个漂亮的vim颜色主题
- [ayu-theme/ayu-vim](https://github.com/ayu-theme/ayu-vim) 一个漂亮的vim颜色主题

相关的设置可以去官方git repo查看，init.vim里也有部分注释说明了快捷键

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

