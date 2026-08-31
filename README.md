# blog1

Source for [Brett Grady's Technical Blog](http://brettg.cc), a
[Hugo](https://gohugo.io) site published to GitHub Pages.

## Running it locally

Install [Hugo](https://gohugo.io/installation/) (extended), then:

    hugo server

Serves <http://localhost:1313> and reloads as you edit; add `-D` to include
drafts. `hugo --minify` builds into `public/` without serving.

## Writing a post

Add `content/posts/my-post.md` with TOML front matter:

    +++
    title = 'My Post Title'
    date = 2026-03-15
    tags = ['hugo']      # optional
    tldr = 'One line.'   # optional, rendered above the body
    toc = true           # optional, table of contents
    draft = true         # optional, hidden unless you pass -D
    +++

Then write Markdown below it. Fenced code blocks render in a framed window
labelled with the language, or with a `title` attribute if you set one
(` ```go {title="main.go"} `). There is also a `{{< callout text="..." >}}`
shortcode.

## Deploying

Pushing to `main` runs `.github/workflows/deploy-github-pages.yml`, which
builds the site and publishes it to GitHub Pages. It can also be triggered
from **Actions → Deploy Hugo site to GitHub Pages → Run workflow**.

The repository needs **Settings → Pages → Source** set to **GitHub Actions**.
For a custom domain, put the domain in `static/CNAME` and point DNS at
GitHub Pages.

## Repository layout

See [`CLAUDE.md`](CLAUDE.md) for the directory map, styling conventions, and
notes on how the templates fit together.

The templates began as the [archie](https://github.com/athul/archie) theme
(MIT, see `LICENSE`) and have since been rewritten in place, so they live at
the project root rather than under `themes/`.
