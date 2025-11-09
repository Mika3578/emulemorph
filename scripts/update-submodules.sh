#!/usr/bin/env bash
set -euo pipefail

# Update all submodules to the tip of the branch configured in .gitmodules.
# This script ensures the submodule branch exists locally, fetches the latest
# changes from origin and fast-forwards to the remote tip.

if [[ "${1:-}" == "--child" ]]; then
  shift
  update_submodule() {
    local name="$1"
    local toplevel="$2"
    local path="$3"
    local branch

    branch=$(git config -f "$toplevel/.gitmodules" "submodule.$name.branch" || true)
    if [[ -z "$branch" ]]; then
      # Fall back to the remote HEAD when no branch has been configured.
      branch=$(git -C "$path" symbolic-ref --short HEAD 2>/dev/null || echo "HEAD")
    fi

    echo "Updating $name ($path) on branch $branch"
    git -C "$path" fetch --prune --tags origin

    if [[ "$branch" != "HEAD" ]]; then
      if git -C "$path" show-ref --verify --quiet "refs/heads/$branch"; then
        git -C "$path" checkout "$branch"
      else
        git -C "$path" checkout -B "$branch" "origin/$branch"
      fi
      git -C "$path" reset --hard "origin/$branch"
    else
      # No explicit branch is known; just fast-forward to the remote HEAD.
      remote_head=$(git -C "$path" symbolic-ref --quiet --short refs/remotes/origin/HEAD || true)
      remote_head=${remote_head#origin/}
      if [[ -n "$remote_head" ]]; then
        git -C "$path" checkout "$remote_head"
        git -C "$path" reset --hard "origin/$remote_head"
      else
        echo "Unable to determine remote HEAD for $name; skipping" >&2
      fi
    fi
  }

  update_submodule "$@"
  exit 0
fi

# Ensure we are inside a Git repository.
git_root=$(git rev-parse --show-toplevel 2>/dev/null || true)
if [[ -z "$git_root" ]]; then
  echo "This script must be executed from inside a Git repository." >&2
  exit 1
fi

cd "$git_root"

# Ensure every submodule is at least initialized locally.
git submodule update --init --recursive

# Iterate over every submodule (recursively) and update it.
git submodule foreach --recursive 'bash "$toplevel/scripts/update-submodules.sh" --child "$name" "$toplevel" "$path"'
