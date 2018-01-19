systemd-named-netns
===================

Repository Layout
-----------------

* Main development stays in *master*
* Updates are merged into the *debian* branch

Build Instructions
------------------

Use `git-buildpackage` to create the Debian source and binary branch. Call
these from the project's root directory:

    gbp buildpackage --git-debian-branch=debian
    fakeroot debian/rules clean
    # if you are ready to release, tag the result
    gbp buildpackage --git-ignore-new  --git-tag-only
    git push --tags

The resulting files (.deb, .changes, .dsc, .tar.gz) are located in the parent
directory.
