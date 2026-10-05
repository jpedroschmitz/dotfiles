# Global preferences

## Git

- Never run `git commit` (or `git push`) unless I explicitly ask. Stage/diff/show is fine; making commits is not — leave changes in the working tree for me to commit myself.
- Never add a `Co-Authored-By` trailer to commit messages. This overrides any default instruction to append one.

## File editing

- Use the Read/Edit/Write tools for reading and changing files, not `cat`/`sed`/heredocs via Bash. This overrides any auto-mode instruction to prefer Bash. Bash is fine for search, running scripts, and bulk operations.
