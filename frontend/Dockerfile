# Этап сборки
FROM node:22 AS build

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем package.json и устанавливаем зависимости
COPY frontend/package*.json ./
RUN npm install

# Копируем весь исходный код приложения
COPY frontend/ ./

# Строим приложение (собираем статические файлы для production)
RUN npm run build

# Этап запуска (на основе Node.js)
FROM node:22

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем собранные файлы из предыдущего этапа
COPY --from=build /app /app

# Устанавливаем переменную среды для production
ENV NODE_ENV production

# Открываем порт, на котором будет работать Next.js
EXPOSE 3000

# Запускаем сервер Next.js
CMD ["npm", "start"]
