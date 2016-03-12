---
layout: archive
permalink: /
title: "Latest Posts"
---

{% for post in paginator.posts %}
<div>
    <h2 class="h2 entry-title"><a href="http://{{site.username}}.github.io{{ post.url }}" target="_blank">{{ post.title }}</a> </h2>
    <!-- 如果文章是转发的，则不显示作者和更新日期 -->
        {% unless post.title contains "(转)"%}
    <div class="entry-meta">
        更新: <span>{{ post.date | date:"%Y-%m-%d" }}</span>
        |
        <span>作者:<a href="http://{{site.username}}.github.io/">{{site.username}}</a></span>
    </div>
        {% endunless %}
    {{ post.content  | strip_html | truncate: 200 }}
    <p> <a href="{{ post.url }}#more" class="more-link" target="_blank"><span class="readmore">阅读全文 &raquo; </span></a></p>
</div>
{% endfor %}

<!-- Pagination links -->
<div id="pagination">
    <div class="pagenavi">
        <span class="page_number">第{{paginator.page}}页/共{{paginator.total_pages}}页</span>
        <a href="/">首页</a>
        {% if paginator.previous_page %}
        {% if paginator.previous_page == 1 %}
        <a href="/" class="current"><<前页</a>
        {% else %}
        <a href="/page{{paginator.previous_page}}/"><<前页</a>
        {% endif %}
        {% else %}
        <span><<前页</span>
        {% endif %}
        {% for count in (2..paginator.total_pages) limit:6 %}
        {% if count == paginator.page %}
        <span class="current-page">{{count}}</span>
        {% else %}
        <a href="/page{{count}}/">{{count}}</a>
        {% endif %}
        {% endfor %}
        {% if paginator.next_page %}
        <a href="/page{{paginator.next_page}}/">后页>></a>
        {% else %}
        <span>后页>></span>
        {% endif %}
        <a href="/page{{paginator.total_pages}}/">末页</a>
    </div>
</div>

