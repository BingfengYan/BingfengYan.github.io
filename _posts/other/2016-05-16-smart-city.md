---
layout: article
title:  "智慧城市比赛总结"
categories: other
image:
    teaser: /other/smartcity/20160519085941.png
---

> 本文主要是关于智慧城市比赛准备阶段整理的一些东西

# 异常事件检测
## Abnormal Event Detection at 150 FPS in MATLAB  
1. [project网址](http://shijianping.me/),这个是第二作者的个人网页，里边可以找到源代码和测试数据。其他作者个人网页内暂时未找到有用的东西。  
2. 下载的代码可以直接运行，但是有部分是不能看到源代码的。  
3. 可以在[这个网址下到全部源代码](https://github.com/gongruya/abnormality-detection),下载后修改读取文件可运行。  
4. 这个[网址是C++的代码](https://github.com/gongruya/The-Realtime-Abnormal-Event-Detection-Project),暂时没有测试可用性，但是作者没有优化，效率不高。  
5. 这篇文章的主要思路是使用spare表示的方法，训练阶段构造正常事件表达式，在测试阶段时，看是否满足表达式，若步满足则为异常事件。  
## Histograms of Optical Flow Orientation and Magnitude to Detect Anomalous Events in Videos(HOFM)  
1. [project网址](http://www.ssig.dcc.ufmg.br/homf-descriptor-for-anomalous-pattern-recognition/)里边可以找到[代码下载网址](https://github.com/elbuenchicano/DescriptorHOM)  
2. 代码暂未运行，但看代码很简单。  
3. 该文章的思路很简单，首先提取时空特征，进行训练。测试时使用最近邻找是否该事件离正常事件足够进，若小于某个阈值的话则为正常事件。  
## Online Anomaly Detection in Crowd Scenes via Structure Analysis()ADC_SA)  
1. 该文章可以[在这里下载](http://crabwq.github.io/),这个是第三作者的个人网址，西安光机所的老牛人。但是还有找到源代码。  
2. 该文章的主要思路是行人识别->提取描述子->跟踪。这里知识简短的说一下，有可能不对。这篇文章已经看了好长时间了，有可能忘记了。  
3. 这是一篇online(在线)识别的。意思就是说不需要只需要一个视频前几帧图像进行训练，不用单独训练。  
## Online Learning with Self-Organizing Maps for Anomaly Detection in Crowd Scenes  
1. [文章下载地址](http://www.columbia.edu/~jf2776/)这个是作者的个人网站，  
2. [代码下载地址](https://github.com/flyfj/VisionProjects),整个是作者的github帐号，里边有好多好东西。代码是用c++写的，初步测试能运行，但是只能发现某帧有异常事件，不能事件定位。
3. 该文章也是属于online型的。文章还没看  
##   

还有好多文章，看了感觉没什么用处，就不上传了。

# 跨摄像头行人检测与跟踪
基本思路是：行人检测与跟踪，多个摄像头行人之间的重匹配。  
## Context-Aware Hypergraph Modeling for Re-identification and Summarization
1. [作者网址](http://www.santhoshsunderrajan.com/index.html),牛人一个。里边有好多跟踪的论文和代码。该文章看了一周多了还没看懂，可能是心不在焉吧，最近烦心事太多了。呆几天再看看。
2. [作者github帐号](https://github.com/santhosh-kumar)好多好东西奥。  
## Person Re-Identification by Multi-Channel Parts-Based CNN with Improved Triplet Loss Function  
1. [文章下载地址](http://www.contrib.andrew.cmu.edu/~dcheng1/papers.html)，这个是2015年龚老师那组进决赛后根据比赛写的，但是听作者意思是该文章和实际情况有点不一样，可以作为参考。源代码作者不给，文章我暂时还没有看。  

