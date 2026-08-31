# blog1

Source for [Brett Grady's Technical Blog](http://brettg.cc), a [Hugo](https://gohugo.io) site.

## Layout

    content/posts/   posts, one Markdown file each
    layouts/         page templates
    assets/css/      main.css (light) and dark.css (prefers-color-scheme: dark)
    static/          files copied to the site root as-is
    hugo.toml        site configuration

The templates started as the [archie](https://github.com/athul/archie) theme
(MIT, see `LICENSE`) and have since been rewritten in place, so they live at
the project root rather than under `themes/`.

## Running it locally

Install [Hugo](https://gohugo.io/installation/) (extended), then:

    hugo server

The site is served at <http://localhost:1313> and reloads as you edit. Add
`-D` to include drafts. To build into `public/` without serving, run
`hugo --minify`.

## Writing a post

Create `content/posts/my-post.md` with TOML front matter:

    +++
    title = 'My Post Title'
    date = 2026-03-15
    tags = ['hugo']      # optional
    tldr = 'One line.'   # optional, rendered above the post
    toc = true           # optional, renders a table of contents
    draft = true         # optional, hidden unless you pass -D
    +++

Then write Markdown below it. Fenced code blocks render in a framed window;
its titlebar shows the language, or a `title` attribute if you set one:

    ```go {title="main.go"}

There is also a `{{< callout text="..." >}}` shortcode.

## Deploying

Pushing to `main` triggers `.github/workflows/deploy-github-pages.yml`, which
builds with Hugo and publishes to GitHub Pages. It can also be run by hand
from **Actions → Deploy Hugo site to GitHub Pages → Run workflow**.

The repository must have **Settings → Pages → Source** set to **GitHub
Actions**. To serve from a custom domain, put the domain in `static/CNAME`
and point DNS at GitHub Pages.
