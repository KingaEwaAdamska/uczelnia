#!/bin/bash

# Sprawdzenie argumentu
if [ $# -ne 1 ]; then
    echo "Usage: $0 file.csv"
    exit 1
fi

FILE="$1"

# Sprawdzenie czy plik istnieje
if [ ! -f "$FILE" ]; then
    echo "File not found!"
    exit 1
fi

DEFAULT_PASSWD="Password123"

# Pomijamy nagłówek
tail -n +2 "$FILE" | while IFS=',' read -r EmployeeID Department DN Enabled GivenName mail Manager Name ObjectClass ObjectGUID OfficePhone SamAccountName SID sn Surname Title UPN
do
    USERNAME="$SamAccountName"
    FULLNAME="$Name"

    echo "Creating user: $USERNAME ($FULLNAME)"
    sudo useradd -m -c "$FULLNAME" "$USERNAME"
    echo "$USERNAME:$DEFAULT_PASSWD" | sudo chpasswd

    # Wymuszenie zmiany hasła przy pierwszym logowaniu, ponieważ nie ma rubryki hasła
    sudo chage -d 0 "$USERNAME"

done
