# git-pick-merge 🚀

A Bash script for interactively selecting and cherry-picking merge commits from remote branches using fzf.

## Features ✨
- Interactive remote branch selection with fzf
- Interactive merge commit selection with fzf
- Cherry-pick merge commits with first parent (-m 1)
- Automatic cleanup of temporary branches

## Installation 📦

### Download and Install
```bash
# Download to /usr/local/bin and make executable
sudo curl -L https://raw.githubusercontent.com/tk-aria/git-pick-merge/main/git-pick-merge -o /usr/local/bin/git-pick-merge
sudo chmod +x /usr/local/bin/git-pick-merge
```

### Alternative Installation Locations
```bash
# Install to ~/.local/bin (add to PATH if needed)
mkdir -p ~/.local/bin
curl -L https://raw.githubusercontent.com/tk-aria/git-pick-merge/main/git-pick-merge -o ~/.local/bin/git-pick-merge
chmod +x ~/.local/bin/git-pick-merge

# Install to ~/bin (add to PATH if needed)
mkdir -p ~/bin
curl -L https://raw.githubusercontent.com/tk-aria/git-pick-merge/main/git-pick-merge -o ~/bin/git-pick-merge
chmod +x ~/bin/git-pick-merge
```

## Prerequisites 🔧
- `git` must be installed
- `fzf` must be installed

## Usage 🎯
```bash
# After installation, you can run it from anywhere
git-pick-merge

# Or use as custom git command
git pick-merge

# Or if running locally without installation
./git-pick-merge
```

## How it works 🔄
1. **Remote branch selection**: Select from a list of remote branches using fzf
2. **Merge commit selection**: Select from merge commits in the chosen branch using fzf  
3. **Cherry-pick execution**: The selected merge commit is cherry-picked to your current branch

## fzf Controls ⌨️
- `↑↓` arrow keys: Navigate through items
- `Enter`: Confirm selection
- `Ctrl+C`: Cancel operation

## Notes 📝
- The first parent of merge commits (-m 1) is cherry-picked
- If conflicts occur, resolve them manually and run `git cherry-pick --continue`
- A temporary branch `temp-branch` is created and automatically deleted during the process

## License 📄
This project is open source and available under the MIT License.
