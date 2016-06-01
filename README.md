# vim-killer
killer的个人vim配置 集成ctags、cscope、目录树、有道翻译、自己封装了一些快捷键

##安装方式
在下载代码的目录执行 la 命令，会看到有 `.vim .vimrc` 两个文件，

将 `.vim .vimrc` 两个文件拷贝到主目录即可:

	cp -rv .vim ~
	cp -v vimrc ~

##有道辞典的插件问题
这里用到了一个有道辞典的插件，感谢https://github.com/ianva/vim-youdao-translater

使用有道词典需要python的Requests,ubuntu 安装requests:

	sudo apt-get install python-pip
	sudo pip install requests
 
