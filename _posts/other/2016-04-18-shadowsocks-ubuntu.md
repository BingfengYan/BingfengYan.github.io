---
layout: article
title:  "ubuntu安装shadowsocks"
categories: OTHER
comments: true
image:
    teaser: /CV/11.png
---

>> 一直使用[搬瓦工](https://bandwagonhost.com/)搭建shadowsocks服务，然后在windows和安卓手机上轻松科学上网，只要下载对应的程序即可。但后来转战ubuntu，花了我好长时间才成功。

# 安装shadowsocks
1. 安装shadowsocks命令行程序，配置命令：（个人比较推荐这种方法，因为在第一次安装时也是安装的GUI的，但是一打开就死机，第二次安装时还无法下载）  
命令如下：  
{% highlight bash%}
sudo apt-get install python-pip
sudo pip install shadowsocks
{% endhighlight %}  
因为shadowsocks是使用python的，所有要用pip下载.  
# 启动shadowsocks
安装好后，在本地要使用sslocal，通过sslocal --help查看帮助。  
通过命令配置各个参数如：sslocal -s 11.22.33.44 -p 50003 -k "123456" -l 1080 -t 600 -m aes-256-cfb，但是我使用的是配置文件(-c)，在任意一个文件夹下创建一个文件名可为shadowsocks.json。内容如下：  
{% highlight bash%}
{
"server" : "XX.XX.XX.210",
"server_port" : XX3,
"localPort" : 1080,
"password" : "NDFXXXXXX",
"timeout" : 600,
"method" : "aes-256-cfb"
}
{% endhighlight %}   
各个参数含义参考帮助文档  
2. 或者选择GUI安装
通过PPA源安装，仅支持Ubuntu 14.04或更高版本。   
{% highlight bash%}
sudo add-apt-repository ppa:hzwhuang/ss-qt5
sudo apt-get update
sudo apt-get install shadowsocks-qt5
{% endhighlight %}   
# 配置浏览器
假如你上面任选一种方式已经开始运行sslocal了，这里拿chrome来示范。  
1. 安装switchyOmega，可以在[这里下载](https://github.com/FelisCatus/SwitchyOmega)（但是我没有试）或者在直接在google网上商城下载(需越墙)。方便期间我上传了[switchyOmega](download/Other/SwitchyOmega.crx)。下载好插件后打开浏览器扩展插件处，把刚才下载的文件托进去即安装完成。
2. 安装好插件后新建情景模式，命名为ss，其他全部默认。之后在代理协议选择SOCKS5，地址为127.0.0.1,端口为1080。然后保存。
3. 配置自动切换，但是我没有这么做。直接选择ss上网，这样的话就是所有网址都使用ss上网。
# 开机启动  
如果你选择了第二种可以不管这个  
以前都是每次开机都要输入
{% highlight bash%}
sslocal  -c /home/mudao/shadowsocks.json
{% endhighlight %}   
我们现在可以在你的ubuntu上安装一个叫做supervisor的程序来管理你的sslocal启动。关于supervisor更多点击这  
{% highlight bash%}
sudo apt-get install supervisor
{% endhighlight %}   
安装好后我们可以在/etc/supervisor/目录下找到supervisor.conf配置文件，我们可以用以下命令来编辑  
{% highlight bash%}
sudo gedit /etc/supervisor/supervisor.conf
{% endhighlight %}   
在这个文件的最后加上以下内容  
{% highlight bash%}
[program:shadowsocks]
command=sslocal -c /home/mudao/shadowsocks.json
autostart=true
autorestart=true
user=root
log_stderr=true
logfile=/var/log/shadowsocks.log
{% endhighlight %}   
command = 这里json文件的路径根据你的文件路径来填写。确认无误后记得保存。sslocal 和ssserver这两个命令是被存在 /usr/local/bin/下面的，我们要拷贝一份命令文件到/bin  
{% highlight bash%}
sudo cp /usr/local/bin/sslocal /bin
{% endhighlight %}   
现在关掉你之前运行sslocal命令的终端，再打开终端输入
{% highlight bash%}
sudo service supervisor restart
{% endhighlight %}   
 然后去打开浏览器看看可不可以继续代理上网。你也可以用
{% highlight bash%}
ps -ef|grep sslocal
{% endhighlight %}   
命令查看sslocal是否在运行。  
这个时候我们需要在/etc下编辑一个叫rc.local的文件 ，让supervisor开机启动。  
{% highlight bash%}
sudo gedit /etc/rc.local 
{% endhighlight %}   
在这个配置文件的exit 0前面一行加上   
{% highlight bash%}
service supervisor start
{% endhighlight %}   
 保存。看你是否配置成功你可以在现在关机重启之后直接打开浏览器看是否代理成功。


参考文献[linux-ubuntu使用shadowsocks客户端配置](https://aitanlu.com/ubuntu-shadowsocks-ke-hu-duan-pei-zhi.html)

