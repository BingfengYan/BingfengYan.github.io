---
layout: article
title:  "bundler安装教程（ubuntu）"
categories: other
image:
    teaser: /other/planarmotions/微信截图_20160311102506.png
---

> 本文主要是讲述bundler在ubuntu安装教程。

1. 在[bundler官网](http://www.cs.cornell.edu/~snavely/bundler/)*Download Bundler from the bundler_sfm repository on GitHub*下载bundler最新版;并解压，名字暂时命名为BASEPATH  
2. 在[网站sift](http://www.cs.ubc.ca/~lowe/keypoints/)下载焦点检测器并把sift文件拷贝到BASEPATH/bin下;  
3. 在[网站jhead](http://www.sentex.net/~mwandel/jhead/)下载jhead来computing focal lengths from Exif metadata，并把jhead拷贝到BASEPATH/bin下;  
4. 在命令行内使用sudo apt-get install ImageMagick安ImageMagick  
5. 运行make但这时会有错误  
 - error trying to exec 'f951': execvp: 没有那个文件或目录  
解决方法：是因为g++和gcc编译器的原因，检测两者版本是否一致，同时安装gfortran  
 - usr/bin/ld:%20cannot%20find%20-llapack  
解决办法：缺少库，使用apt-get install liblapack-dev安装库  
6. 编译完后改变系统环境变量 LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/path/to/bundler/bin  
7. 把example内的图片拷贝到utils内，在utils内运行bundler.py产生bundle文件夹和一些东东。使用bundler.py --extract-focal产生list.tst文件  
8. 把bundle文件夹下的bundle.out和Bundle2PMVS拷贝到utils内，运行./Bundle2PMVS list.txt bundle.out产生pmvs文件夹。
 - 修改pmvs文件夹下的prep_pmvs.sh ，修改UNDLER_BIN_PATH=/home/feng/boundler/bundler_sfm-master/src # Edit this line before running  
 - 修改： # Copy and rename files  
mv pmvs/et008.rd.jpg pmvs/visualize/00000000.jpg  
mv pmvs/00000000.txt pmvs/txt/  
mv pmvs/et006.rd.jpg pmvs/visualize/00000001.jpg  
mv pmvs/00000001.txt pmvs/txt/  
9. 运行sh pmvs/prep_pmvs.sh
