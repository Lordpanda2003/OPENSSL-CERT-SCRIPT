@echo off
chcp 65001 > nul
title Générateur de certificat S/MIME - MONEZE PARFAIT

echo ==============================================
echo     🔐 S/MIME Certificate Generator - BAT
echo     Auteur : MONEZE PARFAIT
echo     Version : 1.0
echo ==============================================

:: Vérifier si OpenSSL est installé
where openssl >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ ERREUR : OpenSSL n'est pas installé ou pas dans le PATH.
    echo 👉 Téléchargez-le ici : https://slproweb.com/products/Win32OpenSSL.html
    pause
    exit /b
)

:: Demande des informations utilisateur
set /p EMAIL=📧 Entrez votre adresse e-mail :
set /p ORG=🏢 Entrez votre nom ou organisation :

:: Noms des fichiers et durée de validité
set KEY_NAME=smime_private.key
set CERT_NAME=smime_cert.pem
set P12_NAME=smime_cert.p12
set DAYS_VALID=365

echo [1/3] 🔑 Génération de la clé privée...
openssl genrsa -out %KEY_NAME% 2048

echo [2/3] 📜 Génération du certificat auto-signé...
openssl req -new -x509 -key %KEY_NAME% -out %CERT_NAME% -days %DAYS_VALID% -subj "/C=CM/ST=Centre/L=Yaounde/O=%ORG%/OU=Cybersecu/CN=%EMAIL%/emailAddress=%EMAIL%"

echo [3/3] 🧷 Création du fichier P12 (protégé par mot de passe)...
openssl pkcs12 -export -inkey %KEY_NAME% -in %CERT_NAME% -out %P12_NAME%

echo ✅ Fichier .p12 généré : %P12_NAME%
echo ----------------------------------------------
echo 💡 Vous pouvez maintenant importer ce certificat dans Outlook ou Thunderbird.
pause
