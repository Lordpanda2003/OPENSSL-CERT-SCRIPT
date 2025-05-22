#!/bin/bash

echo "=============================================="
echo "  🔐 S/MIME Certificate Generator - SH Script"
echo "  Auteur : MONEZE PARFAIT"
echo "  Version : 1.0"
echo "=============================================="

# Vérifier que openssl est installé
if ! command -v openssl &> /dev/null; then
    echo "❌ OpenSSL n'est pas installé. Veuillez l'installer pour continuer."
    echo "💡 Exemple : sudo apt install openssl"
    exit 1
fi

# Définir les noms des fichiers
KEY_NAME="smime_private.key"
CERT_NAME="smime_cert.pem"
P12_NAME="smime_cert.p12"
DAYS_VALID=365

# Saisie des infos
read -p "📧 Entrez votre adresse e-mail : " EMAIL
read -p "🏢 Entrez votre nom complet ou organisation : " ORG

# Génération de la clé privée
echo "[1/3] 🔑 Génération de la clé privée..."
openssl genrsa -out "$KEY_NAME" 2048

# Génération du certificat auto-signé
echo "[2/3] 📜 Génération du certificat auto-signé..."
openssl req -new -x509 -key "$KEY_NAME" -out "$CERT_NAME" -days "$DAYS_VALID" \
    -subj "/C=CM/ST=Centre/L=Yaounde/O=$ORG/OU=Cybersecu/CN=$EMAIL/emailAddress=$EMAIL"

# Conversion en P12
echo "[3/3] 🧷 Création du fichier .p12 (mot de passe requis)..."
openssl pkcs12 -export -inkey "$KEY_NAME" -in "$CERT_NAME" -out "$P12_NAME"

echo "✅ Fichier .p12 généré : $P12_NAME"
echo "----------------------------------------------"
echo "💡 Vous pouvez maintenant importer ce certificat dans Outlook ou Thunderbird."
read -p "Appuyez sur Entrée pour quitter..."
