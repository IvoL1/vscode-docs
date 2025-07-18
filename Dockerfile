# Escolha a imagem base do Node.js (pode trocar a versão)
FROM node:20-alpine

# Define a pasta onde o código vai ficar dentro do container
WORKDIR /usr/src/app

# Copia os arquivos de dependências (package.json e package-lock.json) para instalar as libs
COPY package*.json ./

# Instala todas as dependências (inclusive as de desenvolvimento)
RUN npm install

# Copia todo o restante do código para dentro do container
COPY . .

# Abre a porta que sua aplicação usa (troque se for diferente)
EXPOSE 3000

# Comando para rodar a aplicação em modo desenvolvimento (pode ser "npm run dev", "nodemon src/index.js", etc)
CMD ["npm", "run", "dev"]
