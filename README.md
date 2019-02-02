# shell_cli53_dns_forwarder
This is a shell script that acts as a wrapper to forward domain or subdomains to a destination url using http://redirect.name

Pre-reqs:
1. domain already created on route53
2. cli53 already installed - This script assumes that you have cli53 installed from https://github.com/barnybug/cli53
3. aws accessible via keys

Usage:

./dnsfwd.sh domain destination
