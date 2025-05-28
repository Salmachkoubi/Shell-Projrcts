#!/bin/bash

# Script pour afficher une montre numérique dans le terminal

while true
do
    clear
    echo "----------------------------"
    echo "       Digital Watch        "
    echo "----------------------------"
    echo ""
    date +"     %H:%M:%S"
    echo ""
    echo "Appuyez sur CTRL+C pour quitter"
    sleep 1
done
