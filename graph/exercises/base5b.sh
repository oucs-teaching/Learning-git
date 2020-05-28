#!/bin/sh

# Creates a repository in the new subdirectory 'local'
# DO NOT RUN in a location that is already monitored by git

# This is a repository with three commits on 'master', and a new file staged.

########################


# INITIALISING:

mkdir local
cd local

# Creates and switches to a new directory (to ensure there is no interference
# with existing files).

git init

# Initialises an empty repository.



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



# MISTAKEN STAGING:

echo "This is a mistake" > unwanted.txt

# Creates a new text file containing a single line.

git add unwanted.txt

# Stages the new file (above).


########################

# The directory 'local' will now contain the git repository, with its
# 'master' branch checked-out, ready for further interactions.

# Be sure to delete the directory 'local' after the exercise is complete.
