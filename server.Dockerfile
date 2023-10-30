FROM rust:latest as builder

WORKDIR /app
COPY . .
RUN cargo install --path my_dag --bins --root .

FROM ghcr.io/thepipelinetool/thepipelinetool-server-dev:latest
WORKDIR /server
COPY --from=builder /app/bin/ /server/bin/

EXPOSE 8000

CMD server
