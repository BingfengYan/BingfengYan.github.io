---
layout: article
title:  "ubuntu上遇到的问题"
categories: other
image:
    teaser: /other/使用jekyll在github搭建博客/微信截图_20160310184438.png
data : 
---
> 本文主要描写了使用ubuntu时遇到的一些问题

1. Opencv在ubuntu安装过程可参考[Installing OpenCV 2.4.9 in Ubuntu 14.04 LTS](http://www.samontab.com/web/2014/06/installing-opencv-2-4-9-in-ubuntu-14-04-lts/),其中
{% highlight bash%}
mkdir build
cd build
cmake -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D INSTALL_C_EXAMPLES=ON -D INSTALL_PYTHON_EXAMPLES=ON -D BUILD_EXAMPLES=ON -D WITH_QT=ON -D WITH_OPENGL=ON -D WITH_VTK=ON ..
{% endhighlight %}  
修改为如下
{% highlight bash%}
cd build
cmake -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D INSTALL_C_EXAMPLES=ON -D INSTALL_PYTHON_EXAMPLES=ON -D BUILD_EXAMPLES=ON -D WITH_QT=ON -D WITH_OPENGL=ON -D WITH_VTK=ON ./
{% endhighlight %}  
其他地方比较详细。
