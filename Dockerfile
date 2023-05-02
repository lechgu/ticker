FROM golang:alpine as build

WORKDIR /app

COPY . .
RUN go build -o ticker cmd/emitter/main.go

FROM scratch
COPY --from=build /app/ticker /bin/

ENV PORT=80

ENTRYPOINT ["/bin/ticker"]