---
layout: article
title:  "jekyll使用中遇到的问题"
categories: other
image:
    teaser: /other/使用jekyll在github搭建博客/微信截图_20160310184438.png
data : 
---

> 本文主要描写在使用jekyll遇到的问题及解决办法。其中基本安装过程见[使用jekyll在github搭建博客](other/github-pages-using-jekyll/)

#如何在jekyll使用公式  
 - 修改html头部。  
在每个页面开头加上这么一句，在Jekyll下可以通过修改default.html加上。
{% highlight bash%}
<script type="text/javascript"
src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>
{% endhighlight %}  
 - 使用Tex语法编写mathjex公式，语法教程[在这里](http://www.onemathematicalcat.org/MathJaxDocumentation/TeXSyntax.htm)  
#在博客中添加百度统计：可参考[给你的博客添加一些实用工具](http://yxmblog.com/internet/2015/06/15/jekyll-tools.html)，和[百度统计](http://tongji.baidu.com/web/19631615/overview/sole?siteId=8295465)
 - 注册登录：不用多说，第一步肯定是注册登录了，http://tongji.baidu.com/web/welcome/login。  
 - 添加网址并获取js代码：进入后选择网站中心将你的网址添加进去，成功后将鼠标移到新增的网址那一栏上会显示出“获取代码”选项，点进去就可以看到js代码了，复制一下。  
 - 添加js代码：将上面复制的代码添加到你的主题模板中，本人是添加在_layouts/default.html的<head>前面。  
 - 	检测代码安装是否成功：在右侧有个代码安装检查，输入你要监控的网址，点击自动检查即可。
 - 	以后就可以到[这里](http://tongji.baidu.com/web/19631615/source/searchword?siteId=8295465)里查看了。  
#添加主页分页：可参考[使用Jekyll在Github上搭建个人博客（分页实现）](https://segmentfault.com/a/1190000000406015)和[Pagination](http://jekyllrb.com/docs/pagination/)
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
#