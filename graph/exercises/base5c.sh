#!/bin/sh

# Creates a repository in the new subdirectory 'local'
# and two patch files in the subdirectory 'patches'
# DO NOT RUN in a location that is already monitored by git

# This is a repository with two commits on 'master'.

########################


# INITIALISING:

mkdir local
mkdir patches
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



# PATCHES

cd ../patches/

# Changes to the patches directory

echo "From 572a11bc77ad71c72809206d7f46b9c69048cb1c Mon Sep 17 00:00:00 2001
From: Prepared Earlier <dummy@email.address>
Date: Mon, 18 Nov 2019 13:44:20 +1300
Subject: [PATCH 1/2] Add feature

---
 feature.txt | 1 +
 tests.txt   | 1 +
 2 files changed, 2 insertions(+)
 create mode 100644 feature.txt

diff --git a/feature.txt b/feature.txt
new file mode 100644
index 0000000..81ee083
--- /dev/null
+++ b/feature.txt
@@ -0,0 +1 @@
+This is an old feature
diff --git a/tests.txt b/tests.txt
index e69de29..e95a986 100644
--- a/tests.txt
+++ b/tests.txt
@@ -0,0 +1 @@
+This is a feature test
--
2.21.0
" > 0001-Add-feature.patch

# Creates the first patch file

echo "From cf0bf7df5383723e9d4efb2467bb54000d5d81c0 Mon Sep 17 00:00:00 2001
From: Prepared Earlier <dummy@email.address>
Date: Mon, 18 Nov 2019 13:44:20 +1300
Subject: [PATCH 2/2] Fix bug

---
 feature.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/feature.txt b/feature.txt
index 81ee083..48af23d 100644
--- a/feature.txt
+++ b/feature.txt
@@ -1 +1 @@
-This is an old feature
+This is a new feature
--
2.21.0
" > 0002-Fix-bug.patch

# Creates the second patch file


########################

# The directory 'local' will now contain the git repository, with its
# 'master' branch checked-out, ready for further interactions.
# The directory 'patches' will now contain the two patch files.

# Be sure to delete the directories 'local' and 'patches' after the exercise
# is complete.
