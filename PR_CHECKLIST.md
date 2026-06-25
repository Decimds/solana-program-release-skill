# PR Checklist

Use this when submitting a novel skill to `https://github.com/solanabr/skill-bounty`.

- [ ] Public GitHub repository created.
- [ ] `skill/SKILL.md` present as the entry point.
- [ ] README explains problem, install path, and usage.
- [ ] MIT license included.
- [ ] Installer scripts included.
- [ ] Inspector script tested on a sample Anchor repo.
- [ ] No secrets, keypairs, private RPC URLs, or wallet material included.
- [ ] Superteam listing submission includes repository or PR link.

## Suggested PR Title

Add solana-program-release-skill for release readiness reports

## Suggested PR Body

This PR adds `solana-program-release-skill`, a production-oriented Solana AI Kit skill for release-readiness reviews of Solana/Anchor programs.

It helps agents inspect local release evidence, including:

- `Anchor.toml` program IDs
- `declare_id!` values
- IDL artifacts
- TypeScript tests
- CI workflows
- deploy script references

The skill is read-only, avoids network calls, does not inspect keypair contents, and separates static repository evidence from human confirmations such as upgrade authority and governance state.
