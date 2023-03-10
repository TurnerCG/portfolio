###################################################################

# Author: Christopher Turner
# Creation Date: 01/2023
# Last Modified Data: 02/23
# Script Description: Searches and filters files logins

###################################################################

#!/bin/bash

# Source the regexes.sh script
source regexes.sh

# Define color codes
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
PURPLE='\033[1;35m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m'

# Print table header
printf "${BLUE}%-15s ${GREEN}| %-10s ${YELLOW}| %-10s ${PURPLE}| %-30s ${RED}| %-10s${NC}\n" "Username" "UserID" "GroupID" "Home" "Shell"
printf "${BLUE}%s${NC}\n" "--------------------------------------------------------------------------------------------------------"

# Read data from file and print table rows that match regexes
while IFS=':' read -r username password uid gid gecos home shell; do
  if [[ "$shell" == "/bin/bash" ]]; then
    printf "${CYAN}%-15s ${WHITE}| %-10s ${WHITE}| %-10s ${WHITE}| %-30s ${WHITE}| %-10s${NC}\n" "$username" "$uid" "$gid" "$home" "$shell"
  fi
done < /etc/passwd

printf "${BLUE}%s${NC}\n" "--------------------------------------------------------------------------------------------------------"
