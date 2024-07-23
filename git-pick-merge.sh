#!/bin/bash

# Check if git is installed
if ! command -v git &> /dev/null
then
    echo "git could not be found. Please install git to use this script."
    exit 1
fi

# Check if fzf is installed
if ! command -v fzf &> /dev/null
then
    echo "fzf could not be found. Please install fzf to use this script."
    exit 1
fi

# fetch remote branch.
git fetch

current_branch=$(git rev-parse --abbrev-ref HEAD)

# リモートブランチのリストを取得してfzfで選択
selected_branch=$(git branch -r | fzf --prompt "Select a remote branch: " | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

# temp-branchが存在する場合は削除
if git show-ref --verify --quiet refs/heads/temp-branch; then
    git branch -D temp-branch
fi

# 選択されたリモートブランチをローカルにチェックアウト
git checkout -b temp-branch "$selected_branch"

# 選択されたブランチのマージコミットを取得してfzfで選択
selected_commit=$(git log --merges --oneline | fzf --prompt "Select a merge commit: " | awk '{print $1}')

# 現在のブランチに戻る
git checkout "$current_branch"

# 選択されたマージコミットをcherry-pick
if [ -n "$selected_commit" ]; then
    git cherry-pick -m 1 "$selected_commit"
    if [ $? -ne 0 ]; then
        echo "Cherry-pick failed. Resolve conflicts and run 'git cherry-pick --continue'."
    else
        echo "Cherry-pick successful."
    fi
else
    echo "No commit selected."
fi

# 一時ブランチを削除
git branch -D temp-branch
