# MCP Server API Key Setup
# ========================
# SECURITY: Never commit this file with real API keys to Git!
# This is a TEMPLATE showing you where to add your keys.

## Option 1: Environment Variables (RECOMMENDED)

Set these in your system environment variables (Windows):

```powershell
[Environment]::SetEnvironmentVariable("GITHUB_PERSONAL_ACCESS_TOKEN", "ghp_YOUR_TOKEN_HERE", "User")
[Environment]::SetEnvironmentVariable("EXA_API_KEY", "your-exa-key", "User")
[Environment]::SetEnvironmentVariable("FIRECRAWL_API_KEY", "your-firecrawl-key", "User")
```

Then restart your terminal. The ${VARIABLE} syntax in mcp-servers.json will read from env vars.

## Option 2: Direct Edit (NOT for shared computers)

Edit `mcp-servers.json` and replace placeholders:
- "${GITHUB_PERSONAL_ACCESS_TOKEN}" → "ghp_your_actual_token"
- "${EXA_API_KEY}" → "your_actual_key"

⚠️ Risk: Keys are stored in plain text

## How to Get API Keys

### GitHub Personal Access Token
1. Go to https://github.com/settings/tokens
2. Click "Generate new token (classic)"
3. Select scopes: repo, read:user, read:org
4. Copy the token (starts with ghp_)

### Exa API Key (Web Search)
1. Go to https://dashboard.exa.ai/
2. Sign up / Log in
3. Copy your API key from the dashboard

### Firecrawl API Key (Web Scraping)
1. Go to https://www.firecrawl.dev/
2. Sign up for an account
3. Copy your API key

## To Add More MCP Servers

Copy from `mcp-servers-original.json` (backup of all 23 servers) to `mcp-servers.json`

Remember: More MCP servers = less context window (each uses ~10-20K tokens)
MAX recommended: 5 active MCP servers
