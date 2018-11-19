# Sync Atom between computers using Git & Github

I had been using Atom on multiple machines for a long time and eventually the packages that I use were out of sync between my workstations. Add to that the fact that I don't remember specific package names, and it was a mess all around. So, i decided to go ahead and sync all of my installations with the help of `git` and Github.

## 1. Pick the 'Master' Installation

I designated as `master-atom` the computer that I use the most and that has all the packages I need. On that machine, I navigated to the Atom directory, and created a repository:

```Shell

cd ~/.atom

git init
```

I added a `.gitignore` file containing the following:

```
blob-store
compile-cache
dev
storage
.apm
.node-gyp
.npm
packages/
atom-shell/
```  

I also added a `README.md` file to document the process.

```Shell
echo "# Sync Atom between computers using Git & Github" > README.md
```

Then, `add` and `commit`. 

```Shell
git add .
git commit -m "first atom commit"
```

## 2. Make a Repo on Github

I made a public repo on Github called `atom-master` and linked it to the local repo on my `master-atom` machine. Then, I pushed the local repo to the remote repo. 

```Shell
git remote add origin git@github.com:boryanakis/atom-master.git
git push -u origin master
```

## 3. List Installed Packages 

Made a list of the packages that I have installed using Atom's `apm` command:

```Shell 
apm list --installed --bare > package-list.txt
```

Since this creates a new file, I had to `add`, `commit`, and `push` it to the remote.

```Shell
git add package-list.txt
git commit -m "got a list of installed packages"
git push
```

## 4. Sync on Secondary Workstations

Now, I wanted to sync my laptop's Atom installation with that of my main workstation. On my laptop, I removed the .atom directory and cloned the Github repo. _Note_: I closed Atom while doing this. 

```Shell
rm -rf ~/.atom

git clone git@github.com:boryanakis/atom-master.git .atom

cd ~/.atom

apm install --packages-file package-list.txt

```

And done! 




