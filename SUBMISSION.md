# Superteam Earn Submission Draft

Listing: Ship useful agent skills we can add to Solana AI Kit

## Submission Link

Upload this repository to GitHub and paste the public repository URL.

## Short Description

I built `solana-program-release-skill`, a production-oriented Solana AI Kit skill that helps agents prepare release-readiness reports for Solana/Anchor programs before devnet, testnet, or mainnet deployment.

## What It Solves

Solana program release readiness is easy to get wrong. Program IDs can drift between `Anchor.toml`, `declare_id!`, IDL metadata, generated clients, docs, and deploy artifacts. Upgrade authority and deploy authority also require careful human confirmation. This skill gives coding agents a safe, repeatable workflow for checking those release-critical details without touching secrets or making unsafe mainnet-readiness claims.

## Why It Is Useful

- It targets a real recurring Solana builder workflow: pre-deploy and pre-release review.
- It combines engineering, security, DevOps, and governance checks.
- It includes a read-only inspector script that produces Markdown and JSON evidence.
- It uses progressive loading: concise `SKILL.md`, detailed references, and deterministic script support.
- It is MIT licensed and ready to slot into an agent skill hub.

## Closest Competing Skill

The closest adjacent skills are general Solana development or audit skills, but this one focuses specifically on release readiness: program ID consistency, IDL/client freshness, deploy artifact hygiene, test/CI evidence, and upgrade authority confirmations.

## Founder/Creator Fit

This submission is built around a practical release workflow that AI coding agents can execute safely and repeatably. It avoids unsafe behavior such as requesting private keys, reading keypair contents, or claiming safety without evidence.
