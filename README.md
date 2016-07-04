# Description

**salix-chroot-install** is a small script that runs from within a Salix
installation, takes a Salix iso and performs an installation to a
directory in your hard drive. That directory can then be accessed as a
separate "installation" using chroot.

# Installation

You can install salix-chroot-install on your Salix system with:

```
sudo spi -i salix-chroot-install
```

# Usage

You can run it like this:

```
sudo salix-chroot-install -d /destination/dir -i /path/to/salix.iso
```

You then get the usual choice of Full/Basic/Core and nothing much more than
that. Once it finishes, you'll have an almost complete Salix installation
under that destination dir. You can now use chroot to access that
installation.

A nice tool to do that the easy way is **schroot**, which your can install
with:

```
sudo spi -i schroot
```

Once it is installed, you'll need to inform schroot about your
salix-in-a-chroot installation. You can do that by creating a file with
contents similar to these in your */etc/schroot/chroot.d/* directory:

```
[salix-14.1]
description=Salix 14.1 32-bit
directory=/home/george/salix/chroot/salix-14.1
users=george
root-users=george
personality=linux32
type=directory
```

Of course you'll need to swap the username with yours and adjust the
directory. For 32bit chroots in a 64bit system, you'll need the
personality line. For 64bit chroots in 64bit systems or 32bit chroots in
32bit systems, you'll need to remove it.

After you set up your chroots this way, you can list them with:

```
schroot -l
```

Note that you don't need sudo powers to use schroot and access the
chroots.

You can "log in" a chroot with:

```
schroot -c name_of_chroot
```

which for the above settings example translates to:

```
schroot -c salix-14.1
```

and from then on, you're in a completely isolated environment, away from
your day-to-day system, which you can use to build and test packages etc.
You can use it for building any type of package this way, the only
exception being kernel related packages (which can be done, but need extra
effort). The default settings include using the same home dir in the
chroot as you're normally using.

You can even run GUI apps in the chroot. So you can also use this to run
32bit apps in a 64bit system that you don't want to "contaminate" with
multilib. You'll need to add the `-p` switch for that:

```
schroot -p -c salix-14.1
```

You can examine schroot options by taking a look in the man pages that
come with it.

