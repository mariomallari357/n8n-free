# Deployment worksheet

Prepared deployment:

- GitHub fork: `mariomallari357/n8n-free`
- Render service: `n8n-free`, Free plan, Singapore region
- Database: Supabase Session pooler on port `5432`
- Timezone: `Asia/Shanghai`
- Health endpoint: `/healthz/readiness`

## Render Blueprint

Deploy the root `render.yaml`. The Blueprint prompts for these secrets:

```text
DB_POSTGRESDB_HOST=<Supabase Session pooler host>
DB_POSTGRESDB_PORT=5432
DB_POSTGRESDB_DATABASE=postgres
DB_POSTGRESDB_USER=postgres.<project-ref>
DB_POSTGRESDB_PASSWORD=<database password>
DB_POSTGRESDB_SSL_CA=<full Supabase CA certificate PEM>
N8N_ENCRYPTION_KEY=<stable random secret>
```

Render derives the public n8n host, editor URL, and webhook URL from its own
`RENDER_EXTERNAL_HOSTNAME` and `RENDER_EXTERNAL_URL` values.

## GitHub Actions after deployment

Add this repository variable:

```text
RENDER_URL=https://<service>.onrender.com
```

Add these repository secrets:

```text
SUPABASE_URL=<Supabase project URL>
SUPABASE_KEY=<Supabase publishable key>
```

Run **Render Keep-Alive** and **Supabase Keep-Alive** manually once. Confirm
both runs succeed, then create the n8n owner account at the Render service URL.

## Deployment checklist

- [ ] `render.yaml` is committed on `main`.
- [ ] No secrets appear in the Git repository.
- [ ] Render plan is Free and region is Singapore.
- [ ] Supabase SSL enforcement is enabled.
- [ ] Render deploy finishes successfully.
- [ ] `/healthz/readiness` returns HTTP 200.
- [ ] The n8n owner setup screen loads over HTTPS.
- [ ] GitHub keep-alive workflows succeed.
- [ ] `N8N_ENCRYPTION_KEY` is backed up securely.

Rollback trigger: if readiness fails after an n8n upgrade, revert the commit
that changed `Dockerfile`; Render will automatically redeploy the prior image.
