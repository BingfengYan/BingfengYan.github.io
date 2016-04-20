---
layout: article
title:  "git使用中遇到的问题"
categories: other
image:
    teaser: /other/gittroublesome/20160310184456.png
---

> git使用中遇到的问题：1.版本回退后推送；2.解决每次push输入密码问题；


1. 当在[本地版本回退](http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000/0013744142037508cf42e51debf49668810645e02887691000)时，在上传remote时，会出现：  
{% highlight bash%}
Pushing to git@github.com:519ebayproject/519ebayproject.git
To git@github.com:519ebayproject/519ebayproject.git
 ! [rejected]        master -> master (non-fast-forward)
error: failed to push some refs to 'git@github.com:519ebayproject/519ebayproject.git'
hint: Updates were rejected because the tip of your current branch is behind
hint: its remote counterpart. Merge the remote changes (e.g. 'git pull')
hint: before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
{% endhighlight %}
这时应该强行推送：[参考网页](http://stackoverflow.com/questions/10298291/cannot-push-to-github-keeps-saying-need-merge)  
{% highlight bash%}
git push -f origin <branch>
{% endhighlight %}

2. 在github.com上 建立了一个小项目，可是在每次push的时候，都要输入用户名和密码，很是麻烦  
原因是使用了https方式 push  
在termail里边 输入  
{% highlight bash%}
git remote -v 
{% endhighlight %}  
可以看到形如一下的返回结果  
{% highlight bash%}
origin https://github.com/username/project.git (fetch)
origin https://github.com/username/project.git (push)
{% endhighlight %}  
下面把它换成ssh方式的。  
{% highlight bash%}
a. git remote rm origin
b. git remote add origin git@github.com:username/project.git
c. git push origin 
{% endhighlight %}