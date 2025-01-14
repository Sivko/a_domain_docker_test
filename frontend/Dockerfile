# Этап сборки
FROM node:16 AS build

WORKDIR /app

# Копируем package.json и устанавливаем зависимости
COPY frontend/package*.json ./
RUN npm install

# Копируем весь исходный код
COPY frontend/ ./

# Строим приложение
RUN npm run build

# Этап запуска
FROM node:16

WORKDIR /app

# Копируем только необходимые файлы
COPY --from=build /app /app

# Устанавливаем переменные среды
ENV NODE_ENV production

# Открываем порт для приложения
EXPOSE 3000

# Запускаем Next.js сервер
CMD ["npm", "start"]
