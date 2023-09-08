# Use latest stable channel SDK.
FROM dart:stable AS build

# Resolve app dependencies.
WORKDIR /app
COPY pubspec.* ./
RUN dart pub get

# Copy app source code (except anything in .dockerignore) and AOT compile app.
COPY . .
RUN dart compile exe bin/server.dart -o bin/server

# Build minimal serving image from AOT-compiled `/server`
# and the pre-built AOT-runtime in the `/runtime/` directory of the base image.
FROM scratch
COPY --from=build /runtime/ /
COPY --from=build /app/bin/server /app/bin/

# ENVs
ENV DB_HOST="db"
ENV DB_PORT="5432"
ENV DB_DATABASE_NAME="postgres"
ENV DB_USERNAME="postgres"
ENV DB_PASSWORD="docker"
ENV PORT="8080"

# Start server.
CMD ["/app/bin/server"]
