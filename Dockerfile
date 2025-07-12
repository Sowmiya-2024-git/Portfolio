# ---------- Build Stage ----------
FROM ghcr.io/cirruslabs/flutter:3.19.2 AS build
# ✅ This includes Dart 3.7.2

WORKDIR /app

# Copy dependency files first and install
COPY pubspec.* ./
RUN flutter pub get

# Copy the rest of the app
COPY . .

# Build flutter web app
RUN flutter upgrade
RUN flutter config --enable-web
RUN flutter build web --release

# ---------- Run Stage ----------
FROM nginx:alpine
COPY --from=build /app/build/web /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]