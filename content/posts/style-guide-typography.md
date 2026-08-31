+++
title = 'Style Guide: Typography'
date = 2026-08-24
tags = ['style-guide', 'typography', 'placeholder']
tldr = 'Placeholder post. Every text-level construct the Markdown pipeline can emit, on one page, so a palette or spacing change can be eyeballed in one scroll.'
toc = true
+++

Placeholder content. Nothing here is true; it exists so that a change to
`main.css` or `dark.css` has something to break. If a rule only shows up on
this page, that is the point.

## Headings

The heading rule is a single grouped selector, so `h1` through `h6` all come
out the same size. They are stacked here so that is obvious rather than
surprising.

# Heading level one

## Heading level two

### Heading level three

#### Heading level four

##### Heading level five

###### Heading level six

## Paragraphs and inline runs

A plain paragraph of filler. The measure is capped at `--measure`, so this
line needs to be long enough to actually reach the wrap point on a wide
window; otherwise the column width is untested and any change to it goes
unnoticed until a real post is written.

Inline emphasis: *italic*, **bold**, ***bold italic***, ~~struck through~~,
`inline code`, and a [link to another post](../first-post/). A link with
`code` inside it: [the `--measure` variable](#paragraphs-and-inline-runs).
Emphasis butted against punctuation -- *"quoted italic,"* **bold;** and a
possessive **panel's** edge.

A bare autolinked URL, which is the usual cause of horizontal overflow:
https://example.com/a/deliberately/long/path/that/will/not/fit/on/one/line/at/any/reasonable/window/width

And an unbroken token of the kind a stack trace produces:
`ThisIsOneVeryLongUnbrokenIdentifierWithNoBreakOpportunitiesAnywhereInItAtAll`

Footnote reference[^1] mid-sentence, and a second one[^2] later.

[^1]: Footnotes render as an ordered list under an `<hr>` at the end of the
      article body.
[^2]: The back-reference arrow is an inline link inside that list.

## Blockquotes

> A single-line quote.

> A quote with two paragraphs, so the `blockquote > :last-child` margin rule
> gets exercised.
>
> The second paragraph should sit flush with the bottom padding, not add an
> extra gap below itself.

> Quoting someone quoting someone:
>
> > The nested case, which has no rule of its own and inherits the outer
> > background and left border.
>
> Back out one level.

> A quote containing a list and `inline code`:
>
> - first
> - second

## Lists

Unordered, which the stylesheet restyles with a `*` marker:

- First item
- Second item, long enough to wrap onto a second line so the negative
  `text-indent` on `ul li` can be checked against the hanging marker
- Third item with `code` in it

Nested unordered:

- Top level
  - Second level
    - Third level
  - Back to second
- Top level again

Ordered:

1. First step
2. Second step
3. Third step, again long enough to wrap so the indent behaviour of an
   ordered list can be compared against the unordered one above

Ordered with a nested unordered list:

1. Outer step
   - inner note
   - inner note
2. Outer step

Task list:

- [x] Completed item
- [ ] Incomplete item
- [ ] Incomplete item with a longer label that wraps

Definition list:

Panel
: A `--paper` rectangle with a 2px `--rule` border and a hard offset shadow.

Halftone
: The dot screen on the desktop behind the panels.

## Tables

| Variable | Light | Dark | Used for |
| --- | --- | --- | --- |
| `--paper` | `#f2f2f5` | dark override | panel background |
| `--rule` | `#513c6b` | dark override | borders and shadows |
| `--ink` | `#232333` | dark override | body text |

Alignment, and a table wide enough to need horizontal scroll on a narrow
window:

| Left | Centre | Right | A deliberately wide column of prose |
| :--- | :---: | ---: | :--- |
| a | b | 1 | Short. |
| aa | bb | 22 | A longer cell that pushes the table past the measure so overflow behaviour can be judged. |
| aaa | ccc | 333 | `code in a cell` |

## Rules

Text above a horizontal rule.

---

Text below it.

## Entities and marks

Typographer output: "curly quotes", an em dash -- like this -- and an
ellipsis...

Symbols that need font coverage: -> <- (c) 1/2 x^2 ~ 100 EUR, plus emoji 💡 ✅
🚧 which the callout shortcode also uses.
