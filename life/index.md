---
layout: archive
permalink: /life/
title: "生活"
excerpt: 都是一些生活杂事
---

<div class="tiles">
{% for post in site.posts %}
	{% if post.categories contains 'life' %}
		{% include post-grid.html %}
	{% endif %}
{% endfor %}
</div><!-- /.tiles -->
