param(
    [string]$Destination = "$env:USERPROFILE\.codex\skills"
)

$ErrorActionPreference = "Stop"

$Target = Join-Path $Destination "solana-program-release-skill"
New-Item -ItemType Directory -Force -Path $Target | Out-Null
Copy-Item -Recurse -Force -Path "skill" -Destination $Target
Copy-Item -Force -Path "README.md", "LICENSE" -Destination $Target

Write-Host "Installed solana-program-release-skill to $Target"
Write-Host "Skill entry: $(Join-Path $Target 'skill\SKILL.md')"
