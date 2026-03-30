# Dockerfile
# Image de base — ancienne version volontaire pour le scan Trivy
FROM node:14

# Répertoire de travail dans le conteneur
WORKDIR /app

# Copie des fichiers de dépendances
COPY package*.json ./

# Installation des dépendances
RUN npm install

# Copie du reste du code source
COPY . .

# Port exposé par l'application
EXPOSE 3000

# Commande de démarrage
CMD ["node", "app.js"]
