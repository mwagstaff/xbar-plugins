#!/usr/bin/env bash

# <xbar.title>Healthchecks</xbar.title>
# <xbar.version>v1.0.0</xbar.version>
# <xbar.author>Mike Wagstaff</xbar.author>
# <xbar.author.github>mwagstaff</xbar.author.github>
# <xbar.desc>Shows the status of websites you wish to check the health of</xbar.desc>  

# The websites you wish to check the health of
sites=(
    "https://football-scores-api.fly.dev/api/v1/healthcheck"
    "https://train-track-api.fly.dev/healthcheck"
    "https://waste-collection.fly.dev/healthcheck"
)


function check_site() {
    status_code=$(curl -I "${1}" 2>/dev/null | head -n 1 | cut -d$' ' -f2)
    if [ "$status_code" -eq "200" ]; then
        echo "🟢_[${status_code}] ${1}"
    else
        echo "🔴_[${status_code}] ${1}"
    fi
}

# Define a menuBarOutput variable to hold the output of the menu bar
menuBarOutput=""

# Define a dropdownOutput variable to hold the output of the dropdown
dropdownOutput=""

for site in "${sites[@]}"
do
    checkOutput=$(check_site "$site") 
    menuBarOutput+=$(echo "$checkOutput" | cut -d'_' -f1)
    dropdownOutput+=$(echo "$checkOutput" | cut -d'_' -f2-)
    dropdownOutput+=" | href=${site}"

    # Add a newline character to the end of the dropdownOutput variable unless it is the last iteration
    if [ "$site" != "${sites[@]: -1}" ]; then
        dropdownOutput+='\n'
    fi
done

# Print the menu bar output
echo "Health: ${menuBarOutput}" 

# Print the separator
echo "---"

# Trim the trailing newline from the dropdown output


# Print the dropdown output
echo -e ${dropdownOutput}