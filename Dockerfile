FROM node:18-alpine

WORKDIR /app

# Копируем package.json и устанавливаем зависимости
COPY package*.json ./
RUN npm ci --only=production

# Копируем всё остальное
COPY . .

# Создаём папки для загрузок (multer)
RUN mkdir -p public/uploads public/audio public/photo public/avatars

# Открываем порт (у вас в app.listen 3000)
EXPOSE 3000

# Запускаем сервер
CMD ["node", "server.js"]