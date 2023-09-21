FROM nginx:1.16.1-alpine AS build-stage
WORKDIR /app
COPY . /app
RUN apk add --no-cache npm git
RUN npm install
RUN ./node_modules/bower/bin/bower install --allow-root
RUN ./node_modules/grunt/bin/grunt compile

FROM scratch AS final
COPY --from=build-stage /app/dist /dist
COPY --from=build-stage /app/package-lock.json /package-lock.json
