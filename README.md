seinfield.sh
============

Very simple CLI seinfield chain tracker.

This piece of Code is highly beta and is still lacking a lot of features. Feel free to clone it and send pull requests.

SETUP
-----

1. create a textfile that will contain the projects you want to track, with a format of:

> projectname:-
> 
> project2:-
> 
> \# this is a comment
> 
> \# You can also indent the dashes after the column for nicer format like
> 
> project3:-
> 
> test:    -

The single dash at the end is optional and represents the first day of the chain. It can be added later by the program.

2. add ```export SEINFILE=/path/to/textfile.txt``` to your .bashrc or equivalent file. Restart your shell to enable the new enviromental variable.

3. (optional) Move seinfield.sh to somewhere inside your PATH and rename it to something more handy, like ```sf```

4. (optional) If you have not yet added any dashes to your projects, run ```./seinfield.sh newday``` (or ```sf newday``` if you followed step 3)

5. At the moment, new days are not recognized automatically. This is horrible, I know, but for now, you could add something along the lines of ```@daily /path/to/seinfield.sh newday``` to your crontab.

USAGE
-----

    seinfield.sh [ do PROJECT | undo PROJECT | ls | newday ]

do:     Tick a project for the day (will replace today's "-" with a "#"

undo:   Untick a project for the day (will replace today's "#" with a "-")

ls:     Show chains for all Projects

newday: Add a "-" to the end of every project's line
