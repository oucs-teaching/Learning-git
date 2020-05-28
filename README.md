# Learning git

Various notes, links to tutorials, etc. for developing an "Intro to Git" lab for students.

There is a full repository elsewhere, that contains additional non-public data, such as anonymised student responses comparing different `git` teaching material. The full repository also contains LaTeX source code for a technical report that summarises the findings from this study of learning git.

## Exercises

In the 'graph' directory are early experiments with developing (and and eye towards automating) some exercises for assessing students' competancy with using `git`.

To see an example of these in action, open one of the `html` files (from 'graph/exercises') in a browser, and call the appropriate shell script from a "clean" directory (*i.e.* one that is not part of a `git` repository). The script will create a simple repository whose history matches the initial diagram on the page. Following the model answer's instructions should change the repository in the manner depicted in later diagrams.

(There are also `html` files that just depict the base states created by the shell scripts.)

Each `html` file shows the initial setup of the repository/repositories, then gives a short summation of the intended task (such as a demonstrator/marker might describe it to a student). The intent is that the demonstrator will run the appropriate script on the student's machine, describe the task, then observe how the student goes about solving it. Each exercise is based around one significant action (such as a `merge` or `rebase`), though it may require several operations to complete (*e.g.* due to dealing with merge conflicts). The task should still be such that a student who is familiar with `git` will be able to complete them while the demonstrator watches (but it should not be a time-based assessment - it ought to be quickly clear to the demonstrator if the student has no idea/the wrong idea how to go about solving the task).
