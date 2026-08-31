# CLAUDE.md

Personal Hugo blog, built to static HTML and published to GitHub Pages.
There is no framework, no build step beyond Hugo, and no JS dependencies.

## Layout

    content/posts/*.md              posts, one Markdown file each; the only content
    layouts/
      _default/baseof.html          whole page skeleton: <head>, masthead, footer
      _default/single.html          a post
      _default/list.html            /posts/ and /tags/<term>/
      _default/terms.html           /tags/
      _default/_markup/
        render-codeblock.html       wraps fenced code in a framed "window"
      index.html                    home page: paginated post list
      shortcodes/callout.html       {{< callout text="..." >}}
    assets/css/main.css             light palette + layout + chroma "tango"
    assets/css/dark.css             dark palette overrides + chroma "github-dark"
    static/images/hero.avif         masthead banner
    static/js/main.js               link-click blink effect (the only JS)
    hugo.toml                       site config
    .github/workflows/              deploy to GitHub Pages on push to main

Every template except `baseof.html` is a `{{ define "main" }}` block that
`baseof.html` wraps. There are no partials: the four that existed each had a
single caller, so they were inlined. Put shared chrome in `baseof.html`.

## Styling

Two stylesheets, both fingerprinted by Hugo so their published filenames
carry a content hash. `main.css` defines the palette as CSS custom
properties on `:root`; `dark.css` is loaded under
`media="(prefers-color-scheme: dark)"` and redefines those same variables.

To recolour the site, change the variables, not the rules. A colour that
only exists in `main.css` will be wrong in dark mode.

There is no theme toggle and no theme JS -- dark mode is purely the media
query. The design is a "paper panels on a halftone desktop" look: panels are
`--paper` with a 2px `--rule` border and a hard offset shadow.

## Writing a post

`content/posts/my-post.md`, TOML front matter:

    +++
    title = 'My Post Title'
    date = 2026-03-15
    tags = ['hugo']      # optional
    tldr = 'One line.'   # optional, rendered above the body
    toc = true           # optional, table of contents
    draft = true         # optional, needs `hugo server -D` to show
    hidden = true        # optional, drops it from the home list only
                         #   (still built, still listed under /posts/)
    +++

Fenced code blocks render in a framed window; the titlebar shows the
language, or a `title` attribute when given:

    ```go {title="main.go"}

## Commands

    hugo server        # localhost:1313, live reload; add -D for drafts
    hugo --minify      # build into public/

CI pins Hugo **0.123.8 extended**; match it when testing a change that
affects output.

## Gotchas

- **Never build a URL by hand with a leading slash.** In Hugo, a leading
  slash suppresses the baseURL's path, so `"/tags/" | relLangURL` yields
  `/tags/x/` instead of `/blog1/tags/x/` and 404s on a project sub-path.
  Use `.RelPermalink` (or `.Page.RelPermalink` on a taxonomy term). This
  already caused one real bug in the tag links.
- `hugo.toml` sets `baseURL = 'http://brettg.cc'`, but the CI workflow
  overrides it with the URL GitHub Pages reports, and the masthead link in
  `baseof.html` is hardcoded to `https://breadgravy.github.io/blog1/`. If
  the canonical domain changes, all three need updating.
- Only the `tags` taxonomy is enabled. Hugo's default set also includes
  `categories`, which produced an empty page and feed.
- `<head>` must stay a bare tag (no attributes) or Hugo silently stops
  injecting its generator meta -- `lang` belongs on `<html>`.

## Verifying a change

Output is static, so diff it. Build before and after into separate
directories and compare; normalise the CSS fingerprints first, since any
stylesheet edit changes every hash:

    hugo --minify -d /tmp/before        # on the old tree
    hugo --minify -d /tmp/after         # after the change
    diff -r /tmp/before /tmp/after

Build with a sub-path baseURL too when touching links:

    hugo --minify --baseURL "https://breadgravy.github.io/blog1/" -d /tmp/sub

A post exercising every template path (tags, toc, tldr, callout, code
window, image) is the fastest way to catch a template regression.
