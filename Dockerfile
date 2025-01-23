FROM golang:1.23.5

WORKDIR /usr/src/jobportal
COPY go.mod go.mod
COPY go.sum go.sum
RUN go mod download

RUN go install github.com/pressly/goose/v3/cmd/goose@latest

COPY . .
RUN which goose

RUN CGO_ENABLED=0 go build -o app ./cmd

ENV PATH="/go/bin:${PATH}"

CMD ["/usr/src/jobportal/app"]
