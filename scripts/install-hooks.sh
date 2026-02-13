#!/bin/sh
#
# Installs git hooks from scripts/git-hooks/ into .git/hooks/
#

HOOKS_DIR="$(git rev-parse --show-toplevel)/scripts/git-hooks"
GIT_HOOKS_DIR="$(git rev-parse --git-dir)/hooks"

echo "Installing git hooks..."

for hook in "$HOOKS_DIR"/*; do
    hook_name=$(basename "$hook")
    cp "$hook" "$GIT_HOOKS_DIR/$hook_name"
    chmod +x "$GIT_HOOKS_DIR/$hook_name"
    echo "  ✅ Installed $hook_name"
done

echo "Done!"
