# ---------------------------
# Etapa 1: Build (compilação)
# ---------------------------
FROM node:18-alpine AS builder  # Usa imagem oficial Node.js leve (alpine) para compilar o projeto

WORKDIR /app                   # Define o diretório de trabalho dentro do container

COPY package*.json ./          # Copia arquivos de dependências para instalar só o necessário
RUN npm ci --only=production   # Instala dependências de produção (mais rápido e seguro)

COPY . .                       # Copia todo o restante do projeto para dentro do container

RUN npm run build              # Compila o projeto (gera a pasta dist/)

# ---------------------------
# Etapa 2: Produção (execução)
# ---------------------------
FROM node:18-alpine AS production  # Nova imagem limpa para rodar o app

WORKDIR /app                       # Define o diretório de trabalho

COPY --from=builder /app/dist ./dist           # Copia apenas os arquivos compilados
COPY --from=builder /app/node_modules ./node_modules  # Copia as dependências já instaladas
COPY package*.json ./                          # Copia package.json para referência

EXPOSE 3000                                   # Expõe a porta 3000 (ajuste se seu app usar outra)

CMD ["node", "dist/server.js"]                # Comando para iniciar o app (ajuste se seu entrypoint for outro)

# DICA:
# - Use "npm run build" para compilar TypeScript para JavaScript antes de rodar.
# - Use "node dist/server.js" para rodar o app já compilado.
# - Se usar outro arquivo de entrada, troque "dist/server.js" pelo seu.
