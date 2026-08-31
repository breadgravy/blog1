+++
title = 'Style Guide: A Deliberately Long Title That Wraps Onto Several Lines In The Window Titlebar, The Home List And The Browser Tab'
date = 2026-08-21
tags = ['style-guide', 'placeholder', 'edge-cases', 'layout', 'a-tag-with-a-very-long-name', 'hugo', 'css', 'dark-mode']
+++

Placeholder content for the awkward cases: a title long enough to wrap in the
`.mac-titlebar`, a tag list long enough to wrap in the footer nav, and no
`tldr` or `toc` in the front matter so the templates' `with`/`if` branches are
exercised in their empty state as well as their full one.

## Long tokens

A path with no break opportunities, in a paragraph:
`/home/user/blog1/content/posts/style-guide-edge-cases/an/absurdly/deep/directory/that/does/not/exist/index.md`

The same thing as a bare autolink, which is the version that actually
overflows:

https://breadgravy.github.io/blog1/posts/style-guide-edge-cases/?utm_source=placeholder&utm_medium=style-guide&utm_campaign=a-query-string-long-enough-to-matter

A word that is not a word:
Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch.

## Deep nesting

- Level one
  - Level two
    - Level three
      - Level four
        - Level five, by which point the `padding-left: 5ch` on `ul` has
          eaten most of the measure
- Back to level one

1. Ordered level one
   1. Ordered level two
      1. Ordered level three
         - and an unordered leaf

## Adjacency

Heading immediately followed by a heading:

## Second heading, no text between

### Third heading, still nothing between

Text at last, so the stacked `margin-top: 2em` on headings is visible.

A rule immediately after a heading:

## Heading before a rule

---

A list immediately after a rule, with no paragraph between:

- First
- Second

> A blockquote immediately after a list, with no paragraph between.

```sh
# A code window immediately after a blockquote.
echo done
```

## Very short body sections

One.

Two.

Three.
