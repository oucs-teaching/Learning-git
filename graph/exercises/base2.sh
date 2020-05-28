#!/bin/sh

# Creates repositories in the new subdirectories 'local' and 'remote'
# DO NOT RUN in a location that is already monitored by git

# This is a repository with three commits on 'master'. It has a remote with the same three commits on 'master', and two commits on a branch 'new-feature' that diverges from the second commit on 'master'.

########################


# INITIALISING:

mkdir local
mkdir remote
cd remote

# Creates new directories for local and remote repositories (to ensure there
# is no interference with existing files) and switches to the remote
# repository's directory.

git init

# Initialises an empty repository.



# FIRST 'master' COMMIT:

touch readme.txt
touch tests.txt

# Creates two empty text files.

git add -A

# Stages all changes (i.e. the addition of the two new files above).

git commit -m "Initial commit"

# Creates the first commit with a default message.



# SECOND 'master' COMMIT:

echo "This is a README" >> readme.txt

# Appends a line to the (previously empty) readme file.

git commit -a -m "Add README"

# Stages and commits all changes to already-tracked files (i.e. the new line above).



# CLONING THE REMOTE:

cd ../local

# Changes to the local repository's directory.

git clone ../remote .

# Clones the remote repository. The local will now have a reference to the
# remote (using the default name 'origin'), and have a tracking branch
# 'origin/master' (currently at the same position as its 'master' branch).



# HOUSEKEEPING:

cd ../remote

# Changes to the remote repository's directory.



# NEW BRANCH:

git checkout -b "new-feature"

# Creates and switches to the branch 'new-feature' (still at the second commit).



# FIRST 'new-feature' COMMIT:

echo "This is an old feature" > feature.txt

# Creates a new text file containing a single line.

echo "This is a feature test" >> tests.txt

# Appends a line to the (previously empty) tests file.

git add -A

# Stages all changes (i.e. the new file and modified file above).

git commit -m "Add feature"

# Creates a new commit on the 'new-feature' branch.



# SECOND 'new-feature' COMMIT:

sed -i "" "s/an old/a new/g" feature.txt

# Changes the line in the feature file.

git commit -a -m "Fix bug"

# Stages and commits all changes to already-tracked files (i.e. the altered
# line above).



# HOUSEKEEPING:

cd ../local

# Changes to the local repository's directory (note that the local repository
# currently knows nothing about the 'new-feature' branch).



# THIRD 'master' COMMIT:

echo "This is a test" >> tests.txt

# Appends a line to the (previously empty) tests file.

git commit -a -m "Add test"

# Stages and commits all changes to already-tracked files (i.e. the new line
# above). The 'master' branch will now be ahead of the 'origin/master' tracking
# branch by one commit.



# SHARING:

git push

# Updates the remote repository with the third 'master' commit, 'origin/master'
# will now be at the same commit as 'master'.


########################

# The directory 'local' will now contain the git repository, with its
# 'master' branch checked-out, ready for further interactions.
# The directory 'remote' will now contain a copy of the repository.

# Be sure to delete the directories 'local' and 'remote' after the exercise
# is complete.
