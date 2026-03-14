# Checklist: connect GitHub to local Codex

## Done already
- Repo at C:\Users\shattlex\Documents\Playground is initialized.
- Branch: main.
- origin points to GitHub: https://github.com/shattlex/test.git.
- Quick sync script created: scripts/codex-sync.ps1.

## One-time auth setup
1. Configure GitHub access (SSH key recommended).
2. Add your public key in GitHub:
   - GitHub -> Settings -> SSH and GPG keys -> New SSH key.
3. Verify access:
   - ssh -T git@github.com

## Daily flow from Codex
1. Make code changes.
2. Run:
   - powershell -ExecutionPolicy Bypass -File .\scripts\codex-sync.ps1 -Message "feat: short summary"
3. Verify:
   - git log --oneline -n 3
   - git status

## If push fails
- Permission denied (publickey): key is not added in GitHub.
- HTTPS credentials error: switch remote to SSH:
  - git remote set-url origin git@github.com:shattlex/test.git
