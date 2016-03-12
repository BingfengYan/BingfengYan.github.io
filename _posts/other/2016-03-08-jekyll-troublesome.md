---
layout: article
title:  "jekyll使用中遇到的问题"
categories: other
image:
    teaser: /other/使用jekyll在github搭建博客/微信截图_20160310184438.png
data : 
---

> 本文主要描写在使用jekyll遇到的问题及解决办法。其中基本安装过程见[使用jekyll在github搭建博客](other/github-pages-using-jekyll/)

# 如何在jekyll使用公式  
 - 修改html头部。  
在每个页面开头加上这么一句，在Jekyll下可以通过修改default.html加上。
{% highlight bash%}
<script type="text/javascript"
src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>
{% endhighlight %}  
 - 使用Tex语法编写mathjex公式，语法教程[在这里](http://www.onemathematicalcat.org/MathJaxDocumentation/TeXSyntax.htm)  

# 在博客中添加百度统计：可参考[给你的博客添加一些实用工具](http://yxmblog.com/internet/2015/06/15/jekyll-tools.html)，和[百度统计](http://tongji.baidu.com/web/19631615/overview/sole?siteId=8295465)
 - 注册登录：不用多说，第一步肯定是注册登录了，http://tongji.baidu.com/web/welcome/login。  
 - 添加网址并获取js代码：进入后选择网站中心将你的网址添加进去，成功后将鼠标移到新增的网址那一栏上会显示出“获取代码”选项，点进去就可以看到js代码了，复制一下。  
 - 添加js代码：将上面复制的代码添加到你的主题模板中，本人是添加在_layouts/default.html的<head>前面。  
 - 	检测代码安装是否成功：在右侧有个代码安装检查，输入你要监控的网址，点击自动检查即可。
 - 	以后就可以到[这里](http://tongji.baidu.com/web/19631615/source/searchword?siteId=8295465)里查看了。

# 添加主页分页：可参考[使用Jekyll在Github上搭建个人博客（分页实现）](https://segmentfault.com/a/1190000000406015)和[Pagination](http://jekyllrb.com/docs/pagination/)
 - 开启分页功能：首先我们需要在jekyll中开启分页功能，在jekyll的_config.yml中加入分页配置：  
{% highlight bash%}
paginate: 5
paginate_path: "page:num"
{% endhighlight %} 
第一行定义了每页的文章数量，而第二行则定义了在分页的结果，比如在/index.html中使用分页，定义为page:num，则第二页的路径将是/page2/index.html，第三页的路径将是/page3/index.html，以此类推
同时也要在gem下添加：
{% highlight bash%}
 - jekyll-paginate
{% endhighlight %} 
 - 使用分页：在index.html用下边覆盖以前代码，一定是"html"后缀，*在头内不能有permalink*
{% highlight bash%}
<!-- This loops through the paginated posts -->
{% for post in paginator.posts %}
  <h1><a href="{{ post.url }}">{{ post.title }}</a></h1>
  <p class="author">
    <span class="date">{{ post.date }}</span>
  </p>
{% endfor %}
<!-- Pagination links -->
<div class="pagination">
  {% if paginator.previous_page %}
    <a href="{{ paginator.previous_page_path }}" class="previous">Previous</a>
  {% else %}
    <span class="previous">Previous</span>
  {% endif %}
  <span class="page_number ">Page: {{ paginator.page }} of {{ paginator.total_pages }}</span>
  {% if paginator.next_page %}
    <a href="{{ paginator.next_page_path }}" class="next">Next</a>
  {% else %}
    <span class="next ">Next</span>
  {% endif %}
</div>
{% endhighlight %}   
# 添加站内搜索，可参考[swiftype为博客添加搜索引擎](http://blog.yinwoods.com/myshare/%E4%BD%BF%E7%94%A8swiftype%E4%B8%BA%E5%8D%9A%E5%AE%A2%E6%B7%BB%E5%8A%A0%E6%90%9C%E7%B4%A2%E5%BC%95%E6%93%8E.html)和swiftype官网内提示  
1. 1、首先去[swiftype](https://swiftype.com)注册一个账号;
2. 接着添加自己想要配置的网站地址并为新设定的引擎添加一个名字（非会员只能设置一个引擎）。
3. 收到验证邮件后去自己的邮箱验证，验证成功后swiftype即开始抓取网站内容
4. 接下来选择Setup and integration点击Install search engine进入搜索引擎个性化配置界面。可以自定义外观、搜索内容显示方式等等。
5. 配置完成后将产生代码添加到网站并激活搜索引擎即可使用。我把
{% highlight bash%}
<input type="text" class="st-default-search-input">
{% endhighlight %}
暂放在了_layouts\default.html的<body id="js-body">里边，以后在给他开辟新的空间；
{% highlight bash%}
<script type="text/javascript">
(function(w,d,t,u,n,s,e){w['SwiftypeObject']=n;w[n]=w[n]||function(){
(w[n].q=w[n].q||[]).push(arguments);};s=d.createElement(t);
e=d.getElementsByTagName(t)[0];s.async=1;s.src=u;e.parentNode.insertBefore(s,e);
})(window,document,'script','//s.swiftypecdn.com/install/v2/st.js','_st');

_st('install','4dExjPWahYGQn_x_899Y','2.0.0');
</script>
{% endhighlight %}
放在了_layouts\default.html最前面的<script type="text/javascript"内
# RSS订阅
RSS订阅是站点用来和其他站点之间共享内容的一种简易方式,即Really Simple Syndication(简易信息聚合)。Jekyll添加RSS订阅步骤如下：  
1. 在_config.yml文件 添加下列属性：
{% highlight bash%}
username: yxmsw2007
description: yxmsw2007's blog
baseurl: /yxmsw2007.github.io
{% endhighlight %}
*注：如果你的配置文件中已有类似的属性，如name或url等则无需按我这个添加，不过对应的feed.xml要做相应的修改*
2. 在网站根目录下添加 feed.xml
我的feed.xml代码如下：
{% highlight bash%}
username: yxmsw2007
---
layout: none
---
<?xml version="1.0" encoding="UTF-8"?> 
<?xml-stylesheet type="text/css" href="book.css"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom"> 
    <channel> 
        <title>{{ site.username }}</title> 
        <description>{{ site.description }}</description> 
        <link>{{ site.baseurl}}</link> 
        <atom:link href="{{site.baseurl}}/feed.xml" rel="self" type="application/rss+xml" /> 
        {% for post in site.posts limit:10 %} 
        <item> 
            <title>{{ post.title }}</title> 
            <description>{{ post.content | xml_escape }}</description> 
            <pubDate>{{ post.date | date: "%a, %d %b %Y %H:%M:%S %z" }}</pubDate> 
            <link>{{ site.baseurl}}{{ post.url }}</link> 
            <guid isPermaLink="true">{{ site.baseurl}}{{ post.url }}</guid> 
        </item> 
        {% endfor %}
    </channel> 
</rss>
{% endhighlight %}
*注：1.；里边变量应根据第1步改变；2.如果你用jekyll进行本地调试，启动服务的时候可能会报找不到layout：none的情况，不需要管他。*
3. 发布
在你网站的合适地方添加如下代码，我把它和上边的搜索框放在了一起：
{% highlight bash%}
username: yxmsw2007
<a href="/feed.xml" target="_blank">RSS订阅</a>
{% endhighlight %}
