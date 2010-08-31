#!/bin/sh
# Commit or pull changes into this repository.
# Add files to share publically to publicfiles.map
# Make sure there are no outstanding commits in REMOTE_REPO.
# Run this script to push these files into the bitbucket.org repository and merge them in.
#
# TODO: Automate updating of publicfiles.map
# TODO: all target try all in sequence; abort on any failure
# TODO: Check for publicfiles.map and bail if it's not there.
# TODO: Check for hg errors and bail if we find them.
# TODO: Use python instead of bash?
# TODO: cd to correct directory if there is an error (or only popd if there *wasn't* an error).
REMOTE_REPO=/Users/seth/sandbox/code/araxia-mac-os-x-tools
NAME=$1

function pushfiles {
	LOCAL_REPO=$1
	REMOTE_REPO=$2
	NAME=$3

	echo "Pushing from " ${LOCAL_REPO} " to " ${REMOTE_REPO}
	hg --verbose convert -s hg -d hg --filemap ${LOCAL_REPO}/publicfiles.map ${LOCAL_REPO} ${REMOTE_REPO}  && pushd ${REMOTE_REPO} && hg merge && hg ci -m"Publishing " ${NAME} " files to bitbucket.org." && hg push
	popd
}

case "${NAME}" in
	scpt)
		pushfiles /Users/seth/bin ${REMOTE_REPO} applescripts
		;;
	bin)
		pushfiles /Users/seth/Library/Scripts/applescripts ${REMOTE_REPO} applescripts
		;;
	*)
		echo "Valid targets are: scpt, bin"
		;;
esac
