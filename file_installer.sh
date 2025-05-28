#!/bin/bash

echo "  Welcome to File_Installer"
sleep 1

echo " Please enter your project name:"
sleep 1
read projectname

# Créer le dossier principal
mkdir -p "$projectname"
cd "$projectname" || exit

# Créer des sous-dossiers automatiquement
mkdir file1 file2 file3 file4
echo " Dossiers file1 à file4 créés dans $projectname"
sleep 1

# Fonction : écrire dans un fichier
write_file() {
    read -p "Nom du fichier à créer/éditer : " filename
    read -p "Texte à écrire : " content
    echo "$content" >> "$filename"
    echo " Texte ajouté à $filename"
}

# Fonction : lire un fichier
read_file() {
    read -p "Nom du fichier à lire : " filename
    if [ -f "$filename" ]; then
        echo " Contenu de $filename:"
        cat "$filename"
    else
        echo " Fichier introuvable"
    fi
}

# Fonction : supprimer un fichier
delete_file() {
    read -p "Nom du fichier à supprimer : " filename
    if [ -f "$filename" ]; then
        rm "$filename"
        echo "  Fichier supprimé"
    else
        echo " Fichier non trouvé"
    fi
}

# Fonction : ajouter un dossier
create_folder() {
    read -p "Nom du dossier à créer : " foldername
    mkdir -p "$foldername"
    echo " Dossier $foldername créé"
}

# Menu interactif
while true; do
    echo ""
    echo "======= MENU ======="
    echo "1. Ajouter un fichier avec texte"
    echo "2. Lire un fichier"
    echo "3. Supprimer un fichier"
    echo "4. Créer un nouveau dossier"
    echo "5. Quitter"
    read -p "Votre choix : " choice

    case $choice in
        1) write_file ;;
        2) read_file ;;
        3) delete_file ;;
        4) create_folder ;;
        5) echo " Au revoir !" ; exit 0 ;;
        *) echo "❗ Choix invalide" ;;
    esac
done
