# Local Blog Deployment

This repository includes a single setup script to install optional theme dependencies, build the blog, and run a local Hugo server.

## Prerequisites

- [Hugo](https://gohugo.io/installation/) (required)
- [Node.js + npm](https://nodejs.org/) (optional, used for theme dependencies)

## One-command setup and deploy

From the repository root:

```bash
./setup_local_blog.sh
```

The script performs the following steps:

1. Verifies `hugo` is installed.
2. Optionally installs theme dependencies with `npm ci` in `themes/archie`.
3. Builds the static site to `public/` using `hugo --minify --cleanDestinationDir`.
4. Starts the local development server.

## Runtime configuration

You can override defaults with environment variables:

```bash
HOST=0.0.0.0 PORT=8080 BASE_URL=http://localhost:8080 INSTALL_THEME_DEPS=1 RUN_SERVER=1 ./setup_local_blog.sh
```

- `HOST` (default: `0.0.0.0`)
- `PORT` (default: `8080`)
- `BASE_URL` (default: `http://localhost:$PORT`)
- `INSTALL_THEME_DEPS` (`1` to run `npm ci`, `0` to skip)
- `RUN_SERVER` (`1` to launch `hugo server`, `0` to build only)

## Accessing the blog

Open your browser at:

- `http://localhost:8080` (or your custom `BASE_URL`)

Press `Ctrl+C` to stop the server.
