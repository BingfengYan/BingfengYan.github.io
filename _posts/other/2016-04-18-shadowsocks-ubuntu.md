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
我目前没有去试



参考文献[linux-ubuntu使用shadowsocks客户端配置](https://aitanlu.com/ubuntu-shadowsocks-ke-hu-duan-pei-zhi.html)

