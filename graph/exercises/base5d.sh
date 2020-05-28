#!/bin/sh

# Creates a repository in the new subdirectory 'local'
# DO NOT RUN in a location that is already monitored by git

# This is a repository with three commits on 'master', with an unreferenced
# commit branching off the second.

########################


# INITIALISING:

mkdir local
cd local

# Creates and switches to a new directory (to ensure there is no interference
# with existing files).

git init

# Initialises an empty repository.

git config --local advice.detachedHead false

# Suppress warnings about detached HEAD.



# FIRST COMMIT:

touch readme.txt
touch tests.txt

# Creates two empty text files.

git add -A

# Stages all changes (i.e. the addition of the two new files above).

git commit -m "Initial commit"

# Creates the first commit with a default message.



# SECOND COMMIT:

echo "This is a README" >> readme.txt

# Appends a line to the (previously empty) readme file.

git commit -a -m "Add README"

# Stages and commits all changes to already-tracked files (i.e. the new line above).



# THIRD COMMIT:

echo "This is a test" >> tests.txt

# Appends a line to the (previously empty) tests file.

git commit -a -m "Add test"

# Stages and commits all changes to already-tracked files (i.e. the new line above).



# FIRST DANGLING COMMIT

git checkout HEAD^

# Checks out the second 'master' commit in detached HEAD mode

echo "This is an old feature" > feature.txt

# Creates a new text file containing a single line.

echo "This is a feature test" >> tests.txt

# Appends a line to the (previously empty) tests file.

git add -A

# Stages all changes (i.e. the new file and modified file above).

git commit -m "Add feature"

# Creates a new commit on the 'new-feature' branch.



# SECOND DANGLING COMMIT:

sed -i "" "s/an old/a new/g" feature.txt

# Changes the line in the feature file.

git commit -a -m "Fix bug"

# Stages and commits all changes to already-tracked files (i.e. the altered
# line above).



# HOUSEKEEPING

git checkout --quiet master

# Switches back to the 'master' branch, with quiet option to suppress
# warning about dangling commit.

git config --local advice.detachedHead true

# Turn "detached HEAD" warnings back on


########################

# The directory 'local' will now contain the git repository, with its
# 'master' branch checked-out, ready for further interactions.

# Be sure to delete the directory 'local' after the exercise is complete.

