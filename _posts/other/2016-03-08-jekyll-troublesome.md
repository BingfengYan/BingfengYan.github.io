---
layout: article
title:  "jekyll使用中遇到的问题"
categories: other
image:
    teaser: /other/使用jekyll在github搭建博客/微信截图_20160310184438.png
data : 
---

> 本文主要描写在使用jekyll遇到的问题及解决办法。其中基本安装过程见[使用jekyll在github搭建博客](other/github-pages-using-jekyll/)

1. 如何在jekyll使用公式  
 - 修改html头部。  
在每个页面开头加上这么一句，在Jekyll下可以通过修改default.html加上。
{% highlight bash%}
<script type="text/javascript"
src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>
{% endhighlight %}  
 - 使用Tex语法编写mathjex公式，语法教程[在这里](http://www.onemathematicalcat.org/MathJaxDocumentation/TeXSyntax.htm)  
2. 
