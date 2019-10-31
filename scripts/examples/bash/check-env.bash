#!/bin/bash

# ------------------------------------ #
# scripts/examples/bash/check-env.bash #
# ------------------------------------ #

printf "\check-env.sh\n"
printf "\nChecking Environment...\n\n"

# $ command -v foo >/dev/null 2>&1 || { echo >&2 "I require foo but it's not installed.  Aborting."; exit 1; }
# $ type foo >/dev/null 2>&1 || { echo >&2 "I require foo but it's not installed.  Aborting."; exit 1; }
# $ hash foo 2>/dev/null || { echo >&2 "I require foo but it's not installed.  Aborting."; exit 1; }

# ACK
command -v ack >/dev/null 2>&1 || {
  echo >&2 "I require ack but it's not installed.  Aborting."; exit 1;
}
printf " * ACK: "
ack --version | ack ack

# NodeJS
command -v node >/dev/null 2>&1 || {
  echo >&2 "I require nodejs but it's not installed.  Aborting."; exit 1;
}
printf " * NodeJS: "
node -v

# NPM
command -v npm >/dev/null 2>&1 || {
  echo >&2 "I require npm but it's not installed.  Aborting."; exit 1;
}
printf " * NPM: "
npm -v

# Python
command -v python >/dev/null 2>&1 || {
  echo >&2 "I require python but it's not installed.  Aborting."; exit 1;
}
printf " * Python: "
python -V

# PIP
command -v pip >/dev/null 2>&1 || {
  echo >&2 "I require pip but it's not installed.  Aborting."; exit 1;
}
printf " * PIP: "
pip -V

# is colorama installed already?
#COLORAMA=$(pip list | grep colorama)
# printf "${COLORAMA}"
#if [ -z "$COLORAMA" ]
#then
#      echo "\$colorama is installed!"
#else
#      echo "\$colorama is NOT installed!"
#fi

printf "\nDone"

# EOF #
