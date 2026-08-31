+++
title = 'Style Guide: Media and Callouts'
date = 2026-08-22
tags = ['style-guide', 'placeholder']
tldr = 'Placeholder post. Images, figures and the callout shortcode, including the sizes that overflow the measure.'
toc = true
+++

Placeholder content. This post is a leaf bundle, so its images sit next to
`index.md` and are referenced relatively -- which keeps them correct under a
sub-path `baseURL`, unlike a hand-written `/images/...` link.

## Images

A plain Markdown image, wider than the measure, so `img { max-width: 100% }`
has something to clamp:

![A wide placeholder panel](panel-wide.svg)

A small image, well under the measure, which should keep its natural size and
its 2px border:

![A small placeholder panel](panel-small.svg)

A tall image, where the `max-height` on `figure img` does *not* apply because
there is no figure around it:

![A tall placeholder panel](panel-tall.svg)

An image wrapped in a link, which picks up both the image border and the link
styling:

[![A small placeholder panel, linked](panel-small.svg)](panel-wide.svg)

## Figures

The `figure` shortcode renders the title as an `h4`, which the stylesheet
prefixes with an arrow:

{{< figure src="panel-wide.svg" title="A wide figure with a title" alt="Wide placeholder panel" >}}

{{< figure src="panel-tall.svg" title="A tall figure, clamped by the max-height rule" alt="Tall placeholder panel" >}}

{{< figure src="panel-small.svg" alt="Small placeholder panel with no title" >}}

{{< figure src="panel-small.svg" title="A figure whose title is long enough to wrap onto a second line, which is the case worth looking at" alt="Small placeholder panel" >}}

## Callouts

One line:

{{< callout text="This is the shortest callout worth having." >}}

Several lines, to check the padding on a block that wraps:

{{< callout text="A longer callout. It runs past the measure so it wraps, and the emoji marker stays on the first line rather than floating beside the whole block -- which is what the current markup does, since the emoji is inline text and not an absolutely positioned marker." >}}

Two in a row, to check the gap between them:

{{< callout text="First of two." >}}

{{< callout text="Second of two." >}}

A callout directly after a heading:

### Heading, then a callout

{{< callout text="No paragraph between the heading and this block." >}}

## Media inside other blocks

An image inside a list item:

- A list item with an image below it:

  ![A small placeholder panel](panel-small.svg)

- A plain list item after it

An image inside a blockquote:

> ![A small placeholder panel](panel-small.svg)
>
> Quoted, with the image inside the quote's background.
