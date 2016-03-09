---
layout: archive
permalink: /other/
title: "Latest Posts in *other*"
excerpt: 一些分散的知识点
---

<div class="tiles">
{% for post in site.posts %}
	{% if post.categories contains 'other' %}
		{% include post-grid.html %}
	{% endif %}
{% endfor %}
</div><!-- /.tiles -->
