##流程
```shell
./install
```
安装的最好方式是打开install.sh,然后一行一行复制黏贴执行

##快捷键
#####autojump
```
j foo       跳转到 foo 目录
jc bar      跳转到 bar 的子目录
jo music    用资源管理器打开 music 目录(前提是操作系统要有图形界面)
jco images  用资源管理器打开 images 子目录(前提是操作系统要有图形界面)
```
#####bash
```
ctags-c     为当前目录生成 c的ctags
ctags-c++   为当前目录生成 c++的ctags
ctags-php   为当前目录生成 php的ctags
tmns        新起一个 tmux session
tmnw        新起一个 tmux windows
tmas        attached 到 tmux 
tmkw        kill 一个 tmux
tmsw        选择 一个 tmux
dt          根据预设窗口打开 tmux
cscope-find 从当前目录找到匹配的文件生成cscope原始文件
cscope-make 根据cscope原始文件生成cscope数据库
```
#####tmux
```
ctrl-b + ?          查看当前配置的快捷键
ctrl-b + R          重载 .tmux.conf
ctrl-b + a          回到行首(代替shell的ctrl-a)
ctrl-b + [          进入复制模式,按 SPACE 键开始复制,按 RETURN 退出复制模式
ctrl-b + ]          黏贴

ctrl-b + x          关掉当前 pane
ctrl-b + z          最大化当前 pane
ctrl-b + 数字n       选择第 n 个windows                      
ctrl-b + ,          重命名当前 window
ctrl-b + c          创建一个新的 window
ctrl-b + &          关闭当前 window
ctrl-b + $          重命名当前 session
ctrl-b + (          选择上一个 session
ctrl-b + )          选择下一个 session
ctrl-b + D          选择一个 session

ctrl-b + |          在当前 pane 右边产生一个新的 pane
ctrl-b + -          在当前 pane 下边产生一个新的 pane

ctrl + ←            切换到当前 pane 左边的pane
ctrl + →            切换到当前 pane 左边的pane
ctrl + ↑            切换到当前 pane 上边的pane
ctrl + ↓            切换到当前 pane 下边的pane
ctrl-a + ctrl-←     向左扩大当前 pane 的区域     
ctrl-a + ctrl-→     向右扩大当前 pane 的区域     
```
