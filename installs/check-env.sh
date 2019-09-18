#!/bin/bash

# check-env.sh

# example of using arguments to a script
# echo "Total number of arguments is $#" 

printf "\check-env.sh\n"
printf "\nChecking Environment...\n\n"

# $ command -v foo >/dev/null 2>&1 || { echo >&2 "I require foo but it's not installed.  Aborting."; exit 1; }
# $ type foo >/dev/null 2>&1 || { echo >&2 "I require foo but it's not installed.  Aborting."; exit 1; }
# $ hash foo 2>/dev/null || { echo >&2 "I require foo but it's not installed.  Aborting."; exit 1; }

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

# pip
command -v pip >/dev/null 2>&1 || { 
  echo >&2 "I require pip but it's not installed.  Aborting."; exit 1; 
}
printf " * pip: "
pip -V

printf "\nDone"