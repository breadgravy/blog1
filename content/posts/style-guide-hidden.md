+++
title = 'Style Guide: Hidden From The Home List'
date = 2026-08-20
tags = ['style-guide', 'placeholder']
tldr = 'Placeholder post with hidden = true: absent from the home page list, still built and still listed under /posts/.'
hidden = true
+++

Placeholder content for the `hidden` front matter flag. This post should
appear under [all articles](../) and under its
[tags](../../tags/style-guide/), but *not* on the home page list.

If it shows up on the home page, the `where ... "Params.hidden" "ne" true`
filter in `layouts/index.html` has regressed.

- Built: yes
- In the RSS feed: yes
- On the home page: no
