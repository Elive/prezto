#
# Defines Git aliases.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Settings
#
#

# Log
zstyle -s ':prezto:module:git:log:medium' format '_git_log_medium_format' \
  || _git_log_medium_format='%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B'
zstyle -s ':prezto:module:git:log:oneline' format '_git_log_oneline_format' \
  || _git_log_oneline_format='%C(green)%h%C(reset) %s%C(red)%d%C(reset)%n'
zstyle -s ':prezto:module:git:log:brief' format '_git_log_brief_format' \
  || _git_log_brief_format='%C(green)%h%C(reset) %s%n%C(blue)(%ar by %an)%C(red)%d%C(reset)%n'

# Status
zstyle -s ':prezto:module:git:status:ignore' submodules '_git_status_ignore_submodules' \
  || _git_status_ignore_submodules='none'

#
# Aliases
#

# Git
alias g='is_alias=1 git'

# Branch (b)
alias gb='is_alias=1 git branch'
alias gbc='is_alias=1 git checkout -b'
alias gbl='is_alias=1 git branch -v'
alias gbL='is_alias=1 git branch -av'
alias gbx='is_alias=1 git branch -d'
alias gbX='is_alias=1 git branch -D'
alias gbm='is_alias=1 git branch -m'
alias gbM='is_alias=1 git branch -M'
alias gbs='is_alias=1 git show-branch'
alias gbS='is_alias=1 git show-branch -a'

# Commit (c)
alias gc='is_alias=1 git commit --verbose'
alias gca='is_alias=1 git commit --verbose --all'
alias gcm='is_alias=1 git commit --message'
alias gco='is_alias=1 git checkout'
alias gcO='is_alias=1 git checkout --patch'
alias gcf='is_alias=1 git commit --amend --reuse-message HEAD'
alias gcF='is_alias=1 git commit --verbose --amend'
alias gcp='is_alias=1 git cherry-pick --ff'
alias gcP='is_alias=1 git cherry-pick --no-commit'
alias gcr='is_alias=1 git revert'
alias gcR='is_alias=1 git reset "HEAD^"'
alias gcs='is_alias=1 git show'
alias gcl='is_alias=1 git-commit-lost'

# Conflict (C)
alias gCl='is_alias=1 git status | sed -n "s/^.*both [a-z]*ed: *//p"'
alias gCa='is_alias=1 git add $(gCl)'
alias gCe='is_alias=1 git mergetool $(gCl)'
alias gCo='is_alias=1 git checkout --ours --'
alias gCO='is_alias=1 gCo $(gCl)'
alias gCt='is_alias=1 git checkout --theirs --'
alias gCT='is_alias=1 gCt $(gCl)'

# Data (d)
alias gd='is_alias=1 git ls-files'
alias gdc='is_alias=1 git ls-files --cached'
alias gdx='is_alias=1 git ls-files --deleted'
alias gdm='is_alias=1 git ls-files --modified'
alias gdu='is_alias=1 git ls-files --other --exclude-standard'
alias gdk='is_alias=1 git ls-files --killed'
alias gdi='is_alias=1 git status --porcelain --short --ignored | sed -n "s/^!! //p"'

# Fetch (f)
alias gf='is_alias=1 git fetch'
alias gfc='is_alias=1 git clone'
alias gfm='is_alias=1 git pull'
alias gfr='is_alias=1 git pull --rebase'

# Grep (g)
alias gg='is_alias=1 git grep'
alias ggi='is_alias=1 git grep --ignore-case'
alias ggl='is_alias=1 git grep --files-with-matches'
alias ggL='is_alias=1 git grep --files-without-matches'
alias ggv='is_alias=1 git grep --invert-match'
alias ggw='is_alias=1 git grep --word-regexp'

# Index (i)
alias gia='is_alias=1 git add'
alias giA='is_alias=1 git add --patch'
alias giu='is_alias=1 git add --update'
alias gid='is_alias=1 git diff --no-ext-diff --cached'
alias giD='is_alias=1 git diff --no-ext-diff --cached --word-diff'
alias gir='is_alias=1 git reset'
alias giR='is_alias=1 git reset --patch'
alias gix='is_alias=1 git rm -r --cached'
alias giX='is_alias=1 git rm -rf --cached'

# Log (l)
alias gl='is_alias=1 git log --topo-order --pretty=format:${_git_log_medium_format}'
alias gls='is_alias=1 git log --topo-order --stat --pretty=format:${_git_log_medium_format}'
alias gld='is_alias=1 git log --topo-order --stat --patch --full-diff --pretty=format:${_git_log_medium_format}'
alias glo='is_alias=1 git log --topo-order --pretty=format:${_git_log_oneline_format}'
alias glg='is_alias=1 git log --topo-order --all --graph --pretty=format:${_git_log_oneline_format}'
alias glb='is_alias=1 git log --topo-order --pretty=format:${_git_log_brief_format}'
alias glc='is_alias=1 git shortlog --summary --numbered'

# Merge (m)
alias gm='is_alias=1 git merge'
alias gmC='is_alias=1 git merge --no-commit'
alias gmF='is_alias=1 git merge --no-ff'
alias gma='is_alias=1 git merge --abort'
alias gmt='is_alias=1 git mergetool'

# Push (p)
alias gp='is_alias=1 git push'
alias gpf='is_alias=1 git push --force'
alias gpa='is_alias=1 git push --all'
alias gpA='is_alias=1 git push --all && git push --tags'
alias gpt='is_alias=1 git push --tags'
alias gpc='is_alias=1 git push --set-upstream origin "$(git-branch-current 2> /dev/null)"'
alias gpp='is_alias=1 git pull origin "$(git-branch-current 2> /dev/null)" && git push origin "$(git-branch-current 2> /dev/null)"'

# Rebase (r)
alias gr='is_alias=1 git rebase'
alias gra='is_alias=1 git rebase --abort'
alias grc='is_alias=1 git rebase --continue'
alias gri='is_alias=1 git rebase --interactive'
alias grs='is_alias=1 git rebase --skip'

# Remote (R)
alias gR='is_alias=1 git remote'
alias gRl='is_alias=1 git remote --verbose'
alias gRa='is_alias=1 git remote add'
alias gRx='is_alias=1 git remote rm'
alias gRm='is_alias=1 git remote rename'
alias gRu='is_alias=1 git remote update'
alias gRp='is_alias=1 git remote prune'
alias gRs='is_alias=1 git remote show'
alias gRb='is_alias=1 git-hub-browse'

# Stash (s)
alias gs='is_alias=1 git stash'
alias gsa='is_alias=1 git stash apply'
alias gsx='is_alias=1 git stash drop'
alias gsX='is_alias=1 git-stash-clear-interactive'
alias gsl='is_alias=1 git stash list'
alias gsL='is_alias=1 git-stash-dropped'
alias gsd='is_alias=1 git stash show --patch --stat'
alias gsp='is_alias=1 git stash pop'
alias gsr='is_alias=1 git-stash-recover'
alias gss='is_alias=1 git stash save --include-untracked'
alias gsS='is_alias=1 git stash save --patch --no-keep-index'
alias gsw='is_alias=1 git stash save --include-untracked --keep-index'

# Submodule (S)
alias gS='is_alias=1 git submodule'
alias gSa='is_alias=1 git submodule add'
alias gSf='is_alias=1 git submodule foreach'
alias gSi='is_alias=1 git submodule init'
alias gSI='is_alias=1 git submodule update --init --recursive'
alias gSl='is_alias=1 git submodule status'
alias gSm='is_alias=1 git-submodule-move'
alias gSs='is_alias=1 git submodule sync'
alias gSu='is_alias=1 git submodule foreach git pull origin master'
alias gSx='is_alias=1 git-submodule-remove'

# Working Copy (w)
alias gws='is_alias=1 git status --ignore-submodules=${_git_status_ignore_submodules} --short'
alias gwS='is_alias=1 git status --ignore-submodules=${_git_status_ignore_submodules}'
alias gwd='is_alias=1 git diff --no-ext-diff'
alias gwD='is_alias=1 git diff --no-ext-diff --word-diff'
alias gwr='is_alias=1 git reset --soft'
alias gwR='is_alias=1 git reset --hard'
alias gwc='is_alias=1 git clean -n'
alias gwC='is_alias=1 git clean -f'
alias gwx='is_alias=1 git rm -r'
alias gwX='is_alias=1 git rm -rf'

