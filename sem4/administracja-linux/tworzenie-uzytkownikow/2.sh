#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 file.csv"
    exit 1
fi

FILE="$1"

if [ ! -f "$FILE" ]; then
    echo "File not found!"
    exit 1
fi

tail -n +2 "$FILE" | while IFS=',' read -r EmployeeID Department DN Enabled GivenName mail Manager Name ObjectClass ObjectGUID OfficePhone SamAccountName SID sn Surname Title UPN
do
    USERNAME="$SamAccountName"

    echo "Removing user: $USERNAME"

    # sprawdzenie czy istnieje
    if id "$USERNAME" &>/dev/null; then
        sudo userdel -r "$USERNAME"
    else
        echo "User $USERNAME does not exist, skipping..."
    fi

done
