#--- clone existing git repo ---#
cd ~/projects
git clone git@github.com:benscarlson/repo.git

git clone git@github.com:repo.git myrepo #instead of cloning to folder 'repo' this will clone to folder 'myrepo'

#--- add non-repo code to a new github repo ---#
#first, go to github.com and create the repo "anno" on github, don't initialize
cd ~/projects/anno/src
git init
git status
#set up .gitignore. See below
git add .
git remote add origin git@github.com:benscarlson/anno.git
git commit -am 'initial commit'
git push -u origin master

#--- add existing local repo to github ---#
#first, go to github.com and create the repo "anno" on github, don't initialize
cd ~/projects/anno
git remote add origin git@github.com:benscarlson/anno.git
#make sure that git repo has something in it!
git add .
git commit -am 'initial commit'
git push -u origin master

# Untrack a file from the repo but leave on disk
git rm --cached your_filename

#get the last commit
git rev-parse HEAD #5e152f31b4e0d4fe45403d822cd785da888e0431
git log -1 --format='%H' #5e152f31b4e0d4fe45403d822cd785da888e0431
git log --pretty --format='%h' -n 1 #5e152f3 (short version?)



git checkout mybranch #switch to mybranch
git branch --merged #see which branches have been merged into the current branch
git branch -d mybranch #delete my branch

#---- how to stage a pull request ----
#note if master branch is selected and you make changes, and you want to commit changes to a local branch
# you can still follow the steps below. The key is just don't commit your changes to the master branch. Create
# your own branch and then commit. Overall, it's probably best practice to make a branch first and switch to that
# branch before making any changes.

git branch mybranch # create new branch
git checkout mybranch # switch to new branch
git branch #shows you current branch

git commit -am 'my message' # make changes and commit to local branch
git push -u origin mybranch # set up a branch on github that will track your local branch.
# go to github and make a pull request

#---- what to do to your local repo after pull request has been merged
# maintainer will merge branch into master, and delete remote branch
git pull # get the latest (assuming you are on master branch)
git branch -d mybranch # delete local branch

#---- .gitignore
echo ".DS_Store" >> .gitignore
echo ".RData" >> .gitignore
echo ".RHistory" >> .gitignore
echo ".Rproj.user" >> .gitignore

