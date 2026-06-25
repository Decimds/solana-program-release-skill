---
name: solana-program-release-skill
description: Prepare release-readiness reviews for Solana programs, especially Anchor repositories. Use when Codex is asked to inspect a Solana program before deploy, verify Anchor.toml/program IDs/IDL artifacts, produce a preflight checklist, or generate a release readiness report for mainnet, devnet, or testnet.
---

# Solana Program Release Skill

## Overview

Use this skill to review a Solana program repository before a deploy or public release. The workflow is read-only by default and produces a concise report covering configuration, artifacts, IDL, program IDs, tests, safety notes, and remaining release blockers.

## Quick Workflow

1. Identify the repository root and whether it is Anchor-based.
2. Run `scripts/inspect_solana_release.py <repo-root> --out release-report.md` when local files are available.
3. Read `references/release-checklist.md` for the manual checks that cannot be proven from files alone.
4. Produce a report using `references/report-template.md`.
5. Clearly separate:
   - **Verified**: evidence found in files or command output.
   - **Needs human confirmation**: wallet authority, deployer identity, governance, multisig, or RPC state.
   - **Blocker**: missing or contradictory release-critical evidence.

## What To Inspect

Check these files first when present:

- `Anchor.toml`
- `Cargo.toml` and workspace member crates
- `programs/*/Cargo.toml`
- `programs/*/src/lib.rs`
- `target/idl/*.json`
- `target/types/*.ts`
- `target/deploy/*.json` and `target/deploy/*.so`
- `.github/workflows/*`
- `tests/*`
- `migrations/*`
- `README.md`

For non-Anchor repositories, adapt the same checks to the visible build and deploy system. Do not assume Anchor commands exist unless the repository proves it.

## Reporting Rules

- Never claim a program is safe or mainnet-ready solely from static files.
- Never request or print private keys, seed phrases, keypair file contents, or wallet secrets.
- Treat deploy authority, upgrade authority, governance, and multisig ownership as human-confirmed unless verified by public RPC output supplied by the user.
- Flag mismatches between `Anchor.toml`, `declare_id!`, IDL metadata, and deploy keypair names.
- Prefer exact file paths and snippets over broad assertions.
- Recommend the smallest concrete next action for each blocker.

## Common Release Checks

- Program IDs are consistent across `Anchor.toml`, `declare_id!`, IDL metadata, generated client types, and deployment docs.
- `anchor test` or equivalent tests are documented and pass in recent output.
- IDL and TypeScript client artifacts are regenerated after source changes.
- Build artifacts are present only when intentionally committed; otherwise `.gitignore` explains local generation.
- Mainnet/devnet cluster settings are explicit.
- Upgrade authority is intentional, documented, and controlled by the right owner or governance process.
- Security-sensitive instructions avoid sharing secrets and avoid unsafe mainnet operations.

## Output Shape

Use this report order:

1. Release status: `Ready`, `Needs fixes`, or `Blocked`.
2. Evidence summary.
3. Blockers and fixes.
4. Configuration consistency.
5. Tests and build artifacts.
6. Deployment/governance confirmations needed.
7. Copy-paste release checklist.

Load `references/report-template.md` when the user needs a polished deliverable.
