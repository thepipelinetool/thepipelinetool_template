FROM rust:latest as builder

WORKDIR /app
COPY . .
RUN cargo install --path my_dag --bins --root .

FROM ghcr.io/thepipelinetool/thepipelinetool-server-dev:latest
WORKDIR /worker
COPY --from=builder /app/bin/ /worker/bin/

CMD worker
