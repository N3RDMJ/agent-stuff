---
name: remove-ai-slop
description: Remove AI-generated slop from diffs against main (excess comments, unusual defensive checks, any-casts, or inconsistent style) and summarize changes in 1-3 sentences. Must be invoked before any commit.
---

# Remove AI code slop

Check the diff against main, and remove all AI generated slop introduced in this branch.

This includes:
- Extra comments that a human wouldn't add or is inconsistent with the rest of the file
- Extra defensive checks or try/catch blocks that are abnormal for that area of the codebase (especially if called by trusted / validated codepaths)
- Casts to any to get around type issues
- Any other style that is inconsistent with the file

Report at the end with only a 1-3 sentence summary of what you changed

## Workflow

- This skill must be invoked before any commit.
- Run the clean-up pass across the diff against main, then proceed with commit actions.
