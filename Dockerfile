# Используем официальный образ Nginx
FROM nginx:latest

# Копируем кастомный конфиг
COPY nginx.conf /etc/nginx/nginx.conf

# Копируем файлы сайта
COPY ./ /usr/share/nginx/html/

# Указываем порт
EXPOSE 80

# Команда запуска
CMD ["nginx", "-g", "daemon off;"]