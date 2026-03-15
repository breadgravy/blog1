# blog1

Personal Hugo blog source.

## Repository structure
- `content/` — blog posts and pages.
- `static/` — static assets copied as-is.
- `themes/archie/` — active Hugo theme.
- `hugo.toml` — site configuration.
- `.github/workflows/deploy-github-pages.yml` — GitHub Pages deployment workflow.

## Deployment
- Local setup and development: [`DEPLOYMENT.md`](DEPLOYMENT.md)
- GitHub Pages deployment steps: [`DEPLOYMENT.md`](DEPLOYMENT.md#deploying-to-github-pages)

## Adding new blog posts
1. Create a new post file in `content/posts/` (for example with Hugo: `hugo new content/posts/my-post.md`).
2. Add/update front matter at the top of the file using TOML fields like:
   - `title = 'My Post Title'`
   - `date = 2026-03-15`
3. Write your post content below the front matter in Markdown.
4. Preview locally with `./setup_local_blog.sh` (or `hugo server`) and open `http://localhost:8080`.
5. Commit and push; publishing happens through the GitHub Pages workflow documented in `DEPLOYMENT.md`.
