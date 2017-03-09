#!/bin/bash
url=$(git config --get remote.origin.url) || { echo "No git repository found in current folder"; exit 1;}
repository=$(basename "$url" ".${url##*.}")
branch=$(git rev-parse --abbrev-ref HEAD)

echo -e "You are comitting to \e[92m${repository}\e[39m on branch \e[92m${branch}\e[39m"
echo "Does your commit relate to a ticket? (y/n)"
read hasTicket

while [ "$hasTicket" != "y" -a "$hasTicket" != "Y" -a "$hasTicket" != "n" -a "$hasTicket" != "N" ]; do
  echo "Please enter either y or n"
  read hasTicket
done

if [ "$hasTicket" == "y" -o "$hasTicket" == "Y" ]; then
  echo "Please enter the issue name"
  read issueName
fi

if [ ! -z "$issueName" ]; then
  ((messageLimit = 49 - ${#issueName}))
else
  messageLimit=50
fi

echo "Please enter your commit message ( ${messageLimit} character limit)"
read commitMessage

if [ ! -z "$issueName" ]; then
  fullMessage="${issueName} ${commitMessage}"
else
  fullMessage="${commitMessage}"
fi

echo "Committing and pushing all changes to git with message: ${fullMessage}"

git add -A || exit 1

git commit -m "${fullMessage}" || exit 1

git push || exit 1

echo "Successfully pushed to server"

exit 0