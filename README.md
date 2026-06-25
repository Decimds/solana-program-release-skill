# Solana Program Release Skill

This repository contains a Codex/agent skill for preparing Solana program release-readiness reports. It is designed for Solana builders who need a repeatable preflight review before devnet, testnet, or mainnet deployments.

## Problem

Solana program releases often fail because release-critical evidence is scattered across `Anchor.toml`, `declare_id!`, IDL artifacts, generated clients, CI, deploy scripts, and human-controlled upgrade authority. AI agents can help, but they need a disciplined workflow that avoids unsafe claims and never touches secrets.

## What The Skill Does

- Inspects Anchor/Solana repositories for release evidence.
- Detects program IDs in `Anchor.toml` and `declare_id!`.
- Summarizes IDL, deploy artifacts, tests, and CI evidence.
- Flags mismatches and missing release blockers.
- Produces a Markdown release readiness report.
- Separates static evidence from human confirmations such as deployer wallet, upgrade authority, governance, and RPC state.

## Repository Structure

```text
skill/
  SKILL.md
  agents/openai.yaml
  references/release-checklist.md
  references/report-template.md
  scripts/inspect_solana_release.py
```

## Installation

Use the installer for your shell:

```bash
./install.sh ~/.codex/skills
```

```powershell
.\install.ps1 -Destination "$env:USERPROFILE\.codex\skills"
```

Or copy `skill/` into your agent or Codex skills directory manually. For Solana AI Kit integration, include this repository as a skill folder or submodule and keep `skill/SKILL.md` as the entry point.

## Usage

Ask the agent:

```text
Use solana-program-release-skill to inspect this Anchor repository and prepare a release readiness report.
```

When a local repository is available, the agent can run:

```bash
python skill/scripts/inspect_solana_release.py /path/to/solana-repo --out release-report.md --json release-evidence.json
```

## Safety Model

- The inspector is read-only.
- It does not perform network calls.
- It does not read or print keypair contents.
- It treats upgrade authority and deploy authority as human-confirmed unless verified by explicit user-provided evidence.
- It avoids claiming that a program is safe or mainnet-ready solely from local files.

## Why This Fits Solana AI Kit

This skill solves a recurring builder problem: release readiness. It is cross-domain because it touches engineering, DevOps, security, and governance. It follows progressive loading: the core `SKILL.md` stays concise, while checklists and report templates live in references and the deterministic inspector lives in `scripts/`.

## License

MIT
