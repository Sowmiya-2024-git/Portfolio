# Stage 1: Build the Flutter Web App
FROM cirrusci/flutter:latest AS build

WORKDIR /app
COPY . .

# Enable flutter web support
RUN flutter channel stable
RUN flutter upgrade
RUN flutter config --enable-web
RUN flutter pub get
RUN flutter build web

# Stage 2: Serve with Nginx
FROM nginx:alpine
COPY --from=build /app/build/web /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]