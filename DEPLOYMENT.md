# Local Blog Deployment

This repository includes a setup script to install optional theme dependencies, build the blog, and run a local Hugo server.

## Prerequisites

- [Hugo](https://gohugo.io/installation/) (required)
- [Node.js + npm](https://nodejs.org/) (optional, used for theme dependencies)

## One-command local setup

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

---

# Deploying to GitHub Pages

This repository now includes a GitHub Actions workflow at `.github/workflows/deploy-github-pages.yml` that builds and deploys the Hugo output to GitHub Pages.

## 1) Configure repository settings

In GitHub, open **Settings → Pages** and set:

- **Source**: `GitHub Actions`

## 2) Push to `main`

Any push to `main` triggers the workflow:

1. Installs Hugo Extended.
2. Builds the site with a Pages-aware base URL.
3. Uploads `public/` as the Pages artifact.
4. Deploys to the `github-pages` environment.

You can also run it manually from **Actions → Deploy Hugo site to GitHub Pages → Run workflow**.

## 3) Verify deployment URL

After the first successful run, your site is available at:

- User/Org site repo (`<owner>.github.io`): `https://<owner>.github.io/`
- Project site repo: `https://<owner>.github.io/<repo>/`

## Optional: custom domain

If you want to serve the site from a custom domain, add a `static/CNAME` file containing your domain and configure DNS as documented by GitHub Pages.
