---
layout: article
title:  "使用jekyll在github搭建博客"
date:   2016-03-07 20:13:18 +0800
categories: other
---

> 本文主要讲述在github创建个人主页，安装jekyll，下载修改模板，上传模版

## github主页创建

1. 首先在[github](https://github.com)网站注册帐号;
2. 创建完帐号后，个人界面右上角“+”处添加!"New repository"
![如图1](/images/other/使用jekyll在github搭建博客/微信截图_20160308205300.png)
![如图2](/images/other/使用jekyll在github搭建博客/1111.png)
*注意：*1.在上图中第一步填写的是“username.github.io”,下边在应该在master分支上编辑，且在使用jekyll serve访问网页时应是“username.github.io”；假如是随意填写的文件,下边应该在gh-pages分支上编写，网页访问时应是“username.github.com/projectname”。2.需要说明一下，在上边创建时，假如添加"readme.md"文件，下一步应该clone远程文件。
3. 创建了仓库后，我们就需要管理它，无论是管理本地仓库还是远程仓库都需要Git客户端。Git客户端实际上十分强大，它本身就可以offline的创建本地仓库，而本地仓库和远程仓库之间的同步也是通过Git客户端完成的。这里省略了windows下安装和使用Git客户端的基本技巧，您应该已经掌握此技能了。虽然，您仍然可以按照本教程的指引完成一个简单的网站，但是后期的维护工作无论如何都不能少了这项技能。


## 安装jekyll

1. 首先，按需到 [RubyInstallers](http://rubyinstaller.org/downloads)(需要翻墙)下载一个 Ruby 安装包，根据实际需求，鄙人选择“Ruby 2.2.2 (x64)”。
安装的时候注意勾选“Add Ruby executables to your PATH”，设置环境变量，这样一来，你将能在 Windows 命令行直接使用 Ruby 的相关命令。
![如图3](/images/other/使用jekyll在github搭建博客/222.png)  
*Add Ruby executables to your PATH*
2. 安装 Ruby DevKit  
除此，由于 Jekyll 的一些依赖需要支持（例如 yajl-ruby），还需要安装一个 [Ruby DevKit](http://rubyinstaller.org/downloads)(一定要注意与Ruby版本的对应性)，Ruby 的开发工具包，一样在此 按需获取，鄙人选择 DevKit-mingw64-64-4.7.2-20130224-1432-sfx.exe。
这是一个压缩包， 为它建个目录（永久）并解压进去，例如 C:\RubyDevKit，进入此目录并初始化。  
{% highlight bash %}
{% raw %}
cd C:\RubyDevKit
ruby dk.rb init
{% endraw %}
{% endhighlight %}
若它不能自动获取 Ruby 目录时，需编辑其目录下的 config.yml 文件手动照葫芦画飘在后面加上(一定要参考文件里边的格式书写，当时在这了栽了很长时间当时解决方法在[在里](http://stackoverflow.com/questions/30113666/invalid-configuration-or-no-rubies-listed-please-fix-config-yml-and-rerun-ru))  
{% highlight bash %}
{% raw %}
- C:/Ruby22-x64
{% endraw %}
{% endhighlight %}  
最后安装 DevKit  
{% highlight bash %}
{% raw %}
ruby dk.rb install
{% endraw %}
{% endhighlight %}  

3. 安装 Jekyll  
假如你打算将博客托管到 GitHub 上，建议直接跳到 github-pages(这句话的意思是假如不需要在本地仿真的话可以跳过)
和 Linux 一样，在 Windows 上安装 Jekyll 仅需在命令行输入(这个是在线安装，只能翻墙才行，但是会出现连接失败等错误，一定要多试几次；当然网页也有的说使用淘宝源，但是我没有试)  
{% highlight bash %}
{% raw %}
gem install jekyll
{% endraw %}
{% endhighlight %}  
等待安装后，你就可以使用 Jekyll，使用 jekyll new 命令即可简单生成一个默认的博客，例如  
{% highlight bash %}
{% raw %}
jekyll new blog
{% endraw %}
{% endhighlight %}  
测试jekyll服务：  
安装好之后就可以测试我们的环境了。用cmd进入到上一节我们创建的目录，执行下面命令：(当时我用各个游览器没有出现网页，我又用火狐浏览器就可以了)  
{% highlight bash %}
{% raw %}
$jekyll serve
{% endraw %}
{% endhighlight %}  
jekyll此时会在localhost的4000端口监听http请求，用浏览器访问http://localhost:4000，之前的页面出现了！  
*补充：*  
jekyll是如何工作的
在jekyll解析你的网站结构前，需要确保网站目录像下面那样：
{% highlight bash %}
{% raw %}
|—— _config.yml  
|—— _includes  
|—— _layouts  
|	|—— default.html  
|   |—— post.html  
|—— _posts  
|   |—— 20011-10-25-open-source-is-good.html  
|   |—— 20011-04-26-hello-world.html  
|—— _site  
|—— index.html  
|—— assets  
   |—— css  
       |—— style.css  
   |—— javascripts  

{% endraw %}
{% endhighlight %}  
说明：   
- _config.yml：保存配置，该配置将影响jekyll构造网站的各种行为。关于配置的详细文档在这里  
- _includes：该目录下的文件可以用来作为公共的内容被其他文章引用，就跟C语言include头文件的机制完全一样，jekyll在解析时会对{\% include \%}(这里是人为的添加的“\”)标记扩展成对应的在_includes文件夹中的文件 
- _layouts：该目录下的文件作为主要的模板文件  
- _posts：文章或网页应当放在这个目录中，但需要注意的是，文章的文件名必须是YYYY-MM-DD-title  
- _site：上面提到过，这是jekyll默认的转化结果存放的目录  
- assets：这个目录没有强制的要求，主要目的是存放你的资源文件，图片、样式表、脚本等。 
*一个例子:*  
完成一个例子总是最快的入门方式。  
对于基于静态页面的网站，你显然不希望每篇文章都要写html、head等与文章本身无关的重复的东西，那么容易想到的是将这些东西作为模板提取出来，以便复用，_layouts文件夹中的文件可以作为这样的模板。现在我们在_layouts文件夹中创建一个模板文件，default.html：
{% highlight bash %}
{% raw %}  

<html>  
   <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
       <title>My blog</title>
   </head>
   <body>
   {{content }}
   </body>
<html>  

{% endraw %}
{% endhighlight %}  
default.html包含了每个html都需要的一些标记，以及一个个liquid标记。{{ … }}是liquid中用来表示“内容”的标记，其中的对象在解析时会被替换成文件到页面中  
content：表示在这里的地方用子页面的内容替换。  
现在我们来实现一个主页，在根目录下，创建一个index.html  
{% highlight bash %}
{% raw %}  

---  
layout: default  
---  
<h1>Hello jekyll</h1>  
<p>This is the index page</p>  


{% endraw %}
{% endhighlight %}  
除了普通的html标记外，开头这一段称为YAML格式，以一行---开头，一行---结尾，在虚线的中间以key-value的形式对一些全局变量进行赋值。  
layout变量表示该文章应当使用_layouts/default这个文件作为父模板，并将index.html中的内容替换父模板中的{{content }}标记。  
在根目录中启动jekyll serve，并访问http://localhost:4000，你将得到下面页面：  
![如图4](/images/other/使用jekyll在github搭建博客/2222.png)  
该页面的Html源码如下，可以看到，index.html中的内容替换了default.html中的{{content }}  
{% highlight bash %}
{% raw %}  

<html>  
  <head>  
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />  
      <title>My blog</title>  
  </head>  
  <body>  
  <h1>Hello jekyll</h1>  
<p>This is the index page</p>  
  </body>  
<html>  
 


{% endraw %}
{% endhighlight %}   
现在请观察一下_site中的index.html，就是上面的Html代码！OK，现在你明白jekyll的工作方式了吧，它仅仅一次性的完成静态页面的转化，其余的事情全都交给普通的web server了！  
需要注意的是，如果你失败了，请确保你的文件都是UTF-8 without BOM的格式。  
4. GitHub Pages Ruby Gem  
GitHub 提供 github-pages 这个 gem，方便我们本地搭建和 GitHub Pages 线上相同的 Jekyll 环境，包括 Jekyll、少部分插件、Markdown 渲染引擎等等。  
安装 gem(这个也是在线安装的，多试几次就好)  

{% highlight bash %}
{% raw %}  
gem install github-pages  
{% endraw %}
{% endhighlight %}  
或许版本不够新，但一定最适合将博客托管在 GitHub Pages 的你。  
若你的博客托管在 GitHub，又想使用语法高亮（pygments），那么你需要安装 Python。到 Python Releases for Windows 按需下载 Python 2，安装时和 Ruby 一样，如图注意勾选设置环境变量的选项。  
![如图5](/images/other/使用jekyll在github搭建博客/1112.png)  
Python 设置环境变量  
安装 pygments  
{% highlight bash %}
{% raw %}  
pip install pygments   
{% endraw %}
{% endhighlight %}  
安装对应的 gem  
{% highlight bash %}
{% raw %}  
gem install pygments.rb   
{% endraw %}
{% endhighlight %}  
在配置中启用（不知道怎么配置，但是查网上还想说默认就是这样配置的）  
{% highlight bash %}
{% raw %}  
highlighter: pygments  
{% endraw %}
{% endhighlight %}  
你也可以使用 Rouge，安装  
{% highlight bash %}
{% raw %}  
gem install rouge  
{% endraw %}
{% endhighlight %} 
在配置中启用  
{% highlight bash %}
{% raw %}  
highlighter: rouge   
{% endraw %}
{% endhighlight %} 
5. 安装 wdm（可选） 
从 v2.4.0 开始，Jekyll 本地部署时，会相当于以前版本加 --watch 一样，监听其源文件的变化，而 Windows 似乎有时候并不会奏效，不过鄙人使用并没碰到。当然你若碰到，可安装 wdm (Windows Directory Monitor ) 来改善这个问题。  
鄙人本不想安装，但运行 jekyll s 时，会有以下提醒  
{% highlight bash %}
{% raw %}  
Please add the following to your Gemfile to avoid polling for changes:
  gem 'wdm', '>= 0.1.0' if Gem.win_platform?
{% endraw %}
{% endhighlight %} 
于是强迫症发，只好安装（我也遇到了，所以也照着做了）
{% highlight bash %}
{% raw %}  
gem install wdm  
{% endraw %}
{% endhighlight %} 

