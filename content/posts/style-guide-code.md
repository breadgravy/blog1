+++
title = 'Style Guide: Code Windows'
date = 2026-08-23
tags = ['style-guide', 'placeholder']
description = 'A short hand-written description, so the home list renders the .Description branch instead of falling back to .Summary.'
tldr = 'Placeholder post. Fenced blocks in several languages, with and without a title, plus the overflow cases.'
+++

Placeholder content for the `render-codeblock.html` hook. Every fenced block
is wrapped in a framed window whose titlebar shows the `title` attribute when
one is given and the language otherwise.

## With an explicit title

```go {title="main.go"}
package main

import "fmt"

// Greet is deliberately trivial; the point is the highlighting, not the code.
func Greet(name string) string {
	if name == "" {
		name = "world"
	}
	return fmt.Sprintf("hello, %s", name)
}

func main() {
	fmt.Println(Greet("panel"))
}
```

## Title falling back to the language

```python
from dataclasses import dataclass


@dataclass
class Panel:
    """A paper rectangle on the halftone desktop."""

    width: int
    height: int
    border: int = 2

    def area(self) -> int:
        return self.width * self.height


print(Panel(64, 32).area())
```

## A long title

```bash {title="deploy/scripts/rebuild-and-publish-the-whole-site.sh"}
#!/usr/bin/env bash
set -euo pipefail

hugo --minify --baseURL "https://breadgravy.github.io/blog1/" -d public
```

## Short and tall blocks

One line, to check the minimum height of the frame:

```sh
hugo server -D
```

Tall enough to make the window the dominant element on the page:

```css {title="panel.css"}
:root {
  --paper: #f2f2f5;
  --rule: #513c6b;
  --panel-border: 2px solid var(--rule);
  --panel-shadow: 6px 6px 0 var(--rule);
}

.panel {
  background: var(--paper);
  border: var(--panel-border);
  box-shadow: var(--panel-shadow);
  padding: 16px;
}

.panel > :first-child {
  margin-top: 0;
}

.panel > :last-child {
  margin-bottom: 0;
}

@media screen and (max-width: 600px) {
  :root {
    --panel-shadow: 4px 4px 0 var(--rule);
  }
}
```

## Lines too long to fit

The frame must not scroll its titlebar away when the code scrolls sideways:

```js {title="overflow.js"}
const message = "a single line long enough to force horizontal scrolling inside the code window, which is exactly the case the wrapper exists to survive";
document.querySelectorAll('.mac-window .mac-titlebar .window-title').forEach((node) => { node.textContent = message.slice(0, 40); });
```

## No language given

```
Plain text, no lexer. The titlebar falls back to "text".

  Indented lines are preserved verbatim.
```

## Markup and data

```html {title="index.html"}
<div class="code-window">
	<div class="titlebar"><span class="window-title">index.html</span></div>
	<pre><code>nested markup inside a highlighted block</code></pre>
</div>
```

```toml {title="hugo.toml"}
baseURL = 'http://brettg.cc'
title = "Brett Grady's Technical Blog"

[taxonomies]
  tag = "tags"
```

```diff {title="main.css.patch"}
 .callout {
   background-color: var(--callout-color);
-  border: 1px solid var(--rule);
+  border: var(--panel-border);
   padding: 1em;
 }
```

## An indented block

Four-space indentation, which bypasses the render hook entirely and so lands
on the bare `.body > .highlight` fallback rather than in a framed window:

    hugo --minify -d /tmp/before
    hugo --minify -d /tmp/after
    diff -r /tmp/before /tmp/after

## Code in other contexts

A list whose items carry code:

- `hugo server` -- rebuilds on save
- `hugo --minify` -- writes to `public/`

A blockquote containing a fenced block:

> ```sh
> hugo version
> ```
