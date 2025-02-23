# Usar a imagem do Node.js
FROM node:18

# Definir o diretório de trabalho dentro do container
WORKDIR /app

# Copiar os arquivos do projeto para dentro do container
COPY package*.json ./

# Instalar as dependências
RUN npm install

# Copiar o restante dos arquivos
COPY . .

# Instalar o Prisma Client e gerar o cliente
RUN npm install @prisma/client && npx prisma generate

# Gerar o build do NestJS
RUN npm run build

# Expor a porta do NestJS (mantenha a mesma do seu app)
EXPOSE 3000

# Comando para iniciar a aplicação
CMD ["npm", "run", "start:prod"]
