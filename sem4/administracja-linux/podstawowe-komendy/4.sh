#!/bin/bash

echo "Jaki jest twój ulubiony system operacyjny?"
read system

if [ "${system,,}" == "windows" ] || [ "${system,,}" == "mac" ]; then
    echo "Ach, $system? Musisz kochać ból."
elif [ "${system,,}" == "linux" ]; then
    echo "Świetny wybór!"
else
    echo "Czy $system jest systemem operacyjnym?"
fi
