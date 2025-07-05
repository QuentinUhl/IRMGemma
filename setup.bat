@echo off
chcp 65001 > nul
echo 🚀 Installation et démarrage de MedGemma IRMGemma
echo ==================================================

REM Vérifier que nous sommes dans le bon répertoire
if not exist "Frontend" (
    echo ❌ Erreur: Ce script doit être exécuté depuis la racine du projet IRMGemma
    exit /b 1
)
if not exist "Backend" (
    echo ❌ Erreur: Ce script doit être exécuté depuis la racine du projet IRMGemma
    exit /b 1
)

REM Installation des dépendances Backend
echo 📦 Installation des dépendances Backend...
cd Backend
call npm install
if %errorlevel% neq 0 (
    echo ❌ Erreur lors de l'installation des dépendances Backend
    exit /b 1
)

REM Installation des dépendances Frontend
echo 📦 Installation des dépendances Frontend...
cd ..\Frontend
call npm install --legacy-peer-deps
if %errorlevel% neq 0 (
    echo ❌ Erreur lors de l'installation des dépendances Frontend
    exit /b 1
)

cd ..

echo ✅ Installation terminée!
echo.
echo 📋 Instructions pour démarrer l'application:
echo 1. Configurez vos variables d'environnement dans Backend\.env
echo 2. Ouvrez 2 terminaux:
echo    Terminal 1 (Backend): cd Backend ^&^& npm run dev
echo    Terminal 2 (Frontend): cd Frontend ^&^& npm run dev
echo.
echo 🌐 L'application sera accessible sur:
echo    Frontend: http://localhost:3000
echo    Backend API: http://localhost:3001
echo.
echo 📚 Consultez les README.md pour plus d'informations.
pause
