#!/bin/bash
#cli53 wrapper to redirect sites on aws
#
# ./dnsfwd <subdomain> <destination>
#
# check forwarding
# ./dnsfwd -c <domain>

if [ -z $1 ]; then
  echo "usage: ./dnsfwd <subdomain> <optional destination> - defaults to www.defaultdestinationURL.com"
  exit
else
  domainToFwd=$1
  if [ -z $2 ]; then
    destDomain="www.defaultdestinationURL.com"
  else
    destDomain=$2
  fi
fi

cmd1="cli53 rrcreate --replace --wait $domainToFwd '@ 60 A 45.55.72.95'"
echo $cmd1
eval $cmd1
cmd2="cli53 rrcreate --wait $domainToFwd '_redirect TXT \"Redirects to https://$destDomain\"'"
echo $cmd2
eval $cmd2
cmd3="cli53 rrcreate --wait $domainToFwd '_redirect.www TXT \"Redirects to https://$destDomain\"'"
echo $cmd3
eval $cmd3
