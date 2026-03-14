param(
    [Parameter(Mandatory = $false)]
    [string]$Message = "chore: codex sync $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
)

$ErrorActionPreference = "Stop"

# Stage all tracked and untracked changes in repo
git add -A

# Exit early if there is nothing to commit
git diff --cached --quiet
if ($LASTEXITCODE -eq 0) {
    Write-Host "Nothing to commit. Working tree is clean."
} else {
    git commit -m $Message
    git push origin main
    Write-Host "Sync complete: $Message"
}
