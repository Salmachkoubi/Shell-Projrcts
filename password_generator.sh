#!/bin/bash

# Couleurs
GREEN='\033[0;32m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m' # No Color

clear
echo -e "${CYAN} Bienvenue dans le générateur de mots de passe sécurisé ! ${NC}"
sleep 1

# Demander la longueur du mot de passe
read -p " Longueur du mot de passe souhaitée : " PASS_LENGTH
if ! [[ "$PASS_LENGTH" =~ ^[0-9]+$ ]]; then
    echo -e "${RED} Erreur : Veuillez entrer un nombre entier valide.${NC}"
    exit 1
fi

# Demander combien de mots de passe générer
read -p " Nombre de mots de passe à générer : " PASS_COUNT
if ! [[ "$PASS_COUNT" =~ ^[0-9]+$ ]]; then
    echo -e "${RED} Erreur : Veuillez entrer un nombre entier valide.${NC}"
    exit 1
fi

echo ""
echo -e "${GREEN} Vos mots de passe générés :${NC}"
echo "-----------------------------------------"

# Boucle pour générer les mots de passe
for (( i=1; i<=PASS_COUNT; i++ )); do
    PASSWORD=$(openssl rand -base64 48 | tr -dc 'A-Za-z0-9!@#$%^&*()-_=+' | head -c $PASS_LENGTH)
    echo -e " Mot de passe $i : ${CYAN}$PASSWORD${NC}"
done

echo ""
echo -e "${GREEN} Terminé ! Utilisez-les avec précaution.${NC}"
