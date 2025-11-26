\def{title}{Basics of a Unix Terminal}

# Basics of a Unix Terminal

Date: 2025-10-07

I'm studying Physics and Computer Science at university, so I kinda have a foot
in two worlds. A lot of people studying physics don't know anything about Unix,
and a lot of the people studying CS use it frequently. I'm here to bridge this
gap, I guess, so here's the very basics of using a modern Unix system from the
command line. Forewarning, basically everything here should have an "it's
actually more complicated than that" attached to it, so be aware that this is
simplified a bit. The
[Bash Reference Manual](https://www.gnu.org/software/bash/manual/bash.pdf) is
over 200 pages long; I don't want to write that and you more than likely don't
want to read it.

I'm going to assume you know the basics of how to use a computer. You
should know what a directory is (a lot of OSes call them "folders" for some
reason), and you should have used them at least a bit in whatever graphical
file manager you like. Also, if you're really confused as to what a "terminal"
is, you might know it as "Command Prompt" or "Powershell" or "that weird
black-colored app you can type commands into".

---

A terminal is just the old-fashioned way to run programs. Instead of clicking
an icon and opening the program, you type the name of the program and hit
enter. Then, the program runs, and gives you an output, and once it finishes,
you can run another program. Windows people, you've maybe heard of Command
Prompt or Powershell in passing; this is that, but for Unix systems (MacOS,
Linux, and more).

The terminal is also a bit like a file manager; when you start it up, it starts
in your home directory, and you can navigate into and out of folders. When you
run a program, if it saves something to the file `foo.txt`, `foo.txt` will get
saved to whatever folder you're currently in. Pretty handy.

Terminals are a bit more powerful than just a file-manager-that-runs-programs,
though. You can give "arguments" to a program when you run it; these will get
passed along to the program and give the program some extra instructions that
can tell it to do something slightly different.

For example, let's take a look at the `ls` command. `ls` **l**i**s**ts the
contents of the current directory. If the folder you're in
contains the files `foo.txt`, `bar.csv`, and `baz.jpeg`, and the subdirectory
`asdf`, `ls` will work as follows (you don't have to type the $):

~~~
$ ls
asdf bar.csv baz.jpeg foo.txt
~~~

Try this your computer, and see what it spits out! (You should also be trying future examples, the only proper way to learn is by doing!).

If you pass the name of a subdirectory to `ls` as its first argument,
`ls` will list the files in that directory. Reusing the prior example, suppose
`asdf` contains `qwerty.json`, `yuiop.tiff` and `zxcvbnm.svg`, then `ls` works
as follows:

~~~
$ ls asdf
qwerty.json yuiop.tiff zxcvbnm.svg
~~~

The program does something different depending on what arguments you pass it!
Arguments are separated by spaces, however. If your arguments have spaces in
them, well, that's a problem. There is a solution, though; just surround the
argument with quotes. Either single quotes (`'`) or double quotes (`"`) work.

~~~
$ ls "a directory name with spaces"
please.bmp dont.png put.pdf spaces.zip in.tar.gz your.wav filenames.mp3
~~~

Before we go further, we need to talk about a little oddity with how Unix works.
Every directory has two "hidden" files in it that allow you to move between
directories. `.` is just a link to the current directory, and `..` is just a
link to the parent directory. So, `./my-file.txt` is the same as `my-file.txt`,
which is the same as `./././././my-file.txt`, and `ls ..` will list all the
files in the parent directory. If your current directory is called `yeet`,
`ls ../yeet` will list all the files in it.

When deciphering `.` and `..` in filepaths, I like to think of them as
essentially teleporters; whenever you see `.` in a filename, it is jumping
from the current directory to... the current directory. Admittedly, not
particularly useful (although it is not actually useless, for reasons we won't
get into). Whenever you see `..`, the filename is jumping from the current
directory to the one above it. That's a bit more useful. To avoid confusion,
when I say "teleport" or "jump", that's maybe a bit of a misnomer, the
terminal doesn't actually change directory at all when figuring out filepaths.
This is just an analogy to help you figure out what file
`../././../../../.././.././why-would-you-do-this.txt` is pointing to.

Actually, in Unix, any file starting with a period is considered to be hidden,
by a convention that was started by with these two files. Or, rather, someone
didn't want `.` and `..` to show up in `ls`'s output, and so made any files
starting with `.` not get printed. This is a bug, but it turned into a feature
because it's kinda useful. Passing the `-a` argument to `ls` (for example,
`ls -a`) will show these hidden files.

Unix oddities aside, back to what we were talking about. Listing what's in a
directory is great, but you need to **c**hange **d**irectories somehow, which
is what the `cd` command does. It works mostly the same way as `ls` (well, the
`-a` argument doesn't work; you can move to hidden directories just fine
without it). If your current directory has `asdf` as a subdirectory, `cd asdf`
will make the terminal navigate into `asdf`. `.` and `..` work like you'd
expect; `cd .` navigates to the directory you're currently in (useless, I
know), and `cd ..` navigates to the parent directory.

Finally, `pwd` prints the full name of your current directory. No arguments
this time, just type it into your terminal and see what happens.

Now, you should be able to see what's in a folder, navigate up and down through
directories, and see what directory you're currently in! You are now at the
point where I can tell you how to use some other command and you'll have the
necessary groundwork to know what I'm even talking about.
