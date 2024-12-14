# Using the gitpod VM environment that is provided by FreeCodeCamp
# this starts from main branch from the repo that is in the working directory in the VM (eg /workspace/project)
git checkout -b jsmith
git remote add downstream https://github.com/jennylsmith/celestial_bodies_db.git
git add universe_checkpoint.sql
git commit -m "added sql dump from first half of exercise"
git push -u downstream main
# This doesn't make jsmith branch track downstream/main (see stdout message below)
# branch 'main' set up to track 'downstream/main'.
# https://stackoverflow.com/questions/2765421/how-do-i-push-a-new-local-branch-to-a-remote-git-repository-and-track-it-too
# such that this does NOT push changes to my git repo `git push downstream main`
git branch --set-upstream-to=downstream/main
# this is necessary to have jsmith branch now track my github repo
git config --list
# branch.jsmith.vscode-merge-base=origin/main
# branch.jsmith.remote=downstream
# branch.jsmith.merge=refs/heads/main
git push downstream HEAD:main
# but now, its required to have to push with `downstream HEAD:main` which seems odd?
# Need to follow up on below:
# To avoid automatically configuring an upstream branch when its name
# won't match the local branch, see option 'simple' of branch.autoSetupMerge
# in 'git help config'.