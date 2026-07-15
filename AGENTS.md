# Repository Guidelines

This repository deploys n8n to a Render Free web service with Supabase Postgres
and GitHub Actions automation. Keep contributions small, automation-focused,
and documented.

## Project structure

- `Dockerfile` pins the official n8n image version.
- `render.yaml` defines the Render web service and its environment variables.
- `.github/workflows/` contains update and keep-alive automation.
- `Auto keep n8n alive and updates on n8n-free repo.json` is an optional
  importable n8n workflow.
- `README.md` is the primary setup guide.
- `DEPLOYMENT.md` is the operator worksheet and verification checklist.

## Validation

- Validate YAML and JSON after changing automation files.
- Run `git diff --check` before committing.
- Confirm `/healthz/readiness` after every live deployment.
- Use workflow dispatch to test keep-alive actions after changing them.

## Style and commits

- No trailing whitespace.
- YAML and JSON use 2-space indentation.
- Name workflow files with clear kebab-case names.
- All commits must be signed off with `git commit -s`.
- Update `README.md` when setup or runtime behavior changes.

## Security

- Never commit passwords, API keys, database credentials, or the n8n encryption
  key.
- Store runtime secrets in Render and automation secrets in GitHub Actions.
- Treat `N8N_ENCRYPTION_KEY` as a required recovery secret and keep it stable.

## Agent notes

- Preserve unrelated user changes.
- If you use git worktrees, create them under `.git/wtm_data/`.
