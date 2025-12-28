---
name: improve-after-session
description: "Analyze coding agent session transcripts to improve an existing skill or draft a new skill based on session history. Use when asked to improve a skill after a session, extract a new skill from a transcript, or build an improvement prompt from recent agent sessions (Claude, Pi, Codex)."
---

# Improve After Session

Analyze recent session transcripts and generate a focused prompt to improve an existing skill or extract a new one. Keep output concise and ready for a fresh agent session.

## Quick Start

```bash
# Auto-detect agent and extract current session
./scripts/extract-session.js
```

## Session Extraction

Use the extractor to locate and parse the latest session for the current working directory.

```bash
# Auto-detect (uses most recent session for current working directory)
./scripts/extract-session.js

# Specify agent type
./scripts/extract-session.js --agent claude
./scripts/extract-session.js --agent pi
./scripts/extract-session.js --agent codex

# Specify a different working directory
./scripts/extract-session.js --cwd /path/to/project

# Use a specific session file
./scripts/extract-session.js /path/to/session.jsonl
```

Session file locations:
- Claude Code: `~/.claude/projects/<encoded-cwd>/*.jsonl`
- Pi: `~/.pi/agent/sessions/<encoded-cwd>/*.jsonl`
- Codex: `~/.codex/sessions/YYYY/MM/DD/*.jsonl`

## Improve an Existing Skill

1) Extract the session transcript:

```bash
./scripts/extract-session.js > /tmp/session-transcript.txt
```

2) Locate the skill:
- `~/.codex/skills/<skill-name>/SKILL.md`
- `~/.claude/skills/<skill-name>/SKILL.md`
- `~/.pi/agent/skills/<skill-name>/SKILL.md`

3) Generate the improvement prompt:

```
COPY THE FOLLOWING PROMPT INTO A NEW AGENT SESSION:

I need to improve the "<skill-name>" skill based on a session where I used it.

First, read the current skill at: <path-to-skill>

Then analyze this session transcript to understand:
- Where I struggled to use the skill correctly
- What information was missing from the skill
- What examples would have helped
- What I had to figure out on my own

<session_transcript>
<paste transcript here>
</session_transcript>

Based on this analysis, improve the skill by:
1. Adding missing instructions or clarifications
2. Adding examples for common use cases discovered
3. Fixing any incorrect guidance
4. Making the skill more concise where possible

Write the improved skill back to the same location.
```

## Create a New Skill from a Session

1) Extract the session transcript:

```bash
./scripts/extract-session.js > /tmp/session-transcript.txt
```

2) Generate the creation prompt:

```
COPY THE FOLLOWING PROMPT INTO A NEW AGENT SESSION:

Analyze this session transcript to extract a reusable skill called "<skill-name>":

<session_transcript>
<paste transcript here>
</session_transcript>

Create a new skill that captures:
1. The core capability or workflow demonstrated
2. Key commands, APIs, or patterns used
3. Common pitfalls and how to avoid them
4. Example usage for typical scenarios

Write the skill to: ~/.codex/skills/<skill-name>/SKILL.md

Use this format:
---
name: <skill-name>
description: "<one-line description>"
---

# <Skill Name> Skill

<overview and quick reference>

## <Section for each major capability>

<instructions and examples>
```

## Why a Fresh Session

Use a fresh session to keep context minimal, focus the analysis, and make the improvement prompt reusable.

## What to Look For

- Confusion patterns or repeated retries
- Missing examples or unclear steps
- Workarounds that should become first-class guidance
- Errors and how they were resolved
- Successful patterns worth codifying
