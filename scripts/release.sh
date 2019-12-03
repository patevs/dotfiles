#!/usr/bin/env bash

# ------------------ #
# scripts/release.sh #
# ------------------ #

# ! WIP !

# Bash script to bump project version

# Usage:
# You just give it a version number on stdin,
# tell it which part you need incremented,
# and you'll get it properly changed on stdout.
# Fields right of the one given get zeroed out.

# echo "1.2.3" | inc_version 3
# 1.2.4

# echo "1.2.3" | inc_version 2
# 1.3.0

# echo "1.2.3" | inc_version 1
# 2.0.0

# If your version number ends on a build- or version control identifier, just replace NF with NF-1, so the zeroing stops one field short.

inc_version() {
	awk -F. -vOFS=. '{ $ver++; while(ver++<NF) $ver=0; print $0 }' ver=$1
}

# EOF #
